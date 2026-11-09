#include "types.h"
#include "defs.h"
#include "fs.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "buf.h"

static struct sleeplock effectlock;

void effect_lock_init(void) {
    initsleeplock(&effectlock, "effect");
}

void effect_lock(void) {
    acquiresleep(&effectlock);
}

void effect_unlock(void) {
    releasesleep(&effectlock);
}

// Return 1 if found, 0 if absent with space available,
// -1 for invalid input, invalid layout, or a full table.
int effect_lookup(int dev, unsigned long long key, int *result, uint *request_hash) {
  struct superblock s;
  struct effect_record *records;
  struct buf *bp;
  uint slots, start, slot, block, index;
  int i;

  if(key == 0 || result == 0 || request_hash == 0) {
    return -1;
  }

  readsb(dev, &s);
  slots = s.neffectblocks * (BSIZE / sizeof(struct effect_record));
  if(slots == 0 || s.effectstart + s.neffectblocks > s.size)
    return -1;

  start = (uint)(key ^ (key >> 32)) % slots;
  for(i = 0; i < slots; i++){
    slot = (start + i) % slots;
    block = s.effectstart + slot / (BSIZE / sizeof(struct effect_record));
    index = slot % (BSIZE / sizeof(struct effect_record));
    bp = bread(dev, block);
    records = (struct effect_record*)bp->data;
    if(records[index].key == key){
      *result = records[index].result;
      *request_hash = records[index].request_hash;
      brelse(bp);
      return 1;
    }
    if(records[index].key == 0){
      brelse(bp);
      return 0;
    }
    brelse(bp);
  }
  return -1;
}

// Caller must be inside begin_op()/end_op() and protect against
// concurrent modifications. Return 0 if inserted, -1 if full/invalid,
// -2 if key already exists.
int effect_insert(int dev, unsigned long long key, int result, uint request_hash) {
  struct superblock s;
  struct effect_record *records;
  struct buf *bp;
  uint slots, start, slot, block, index;
  int i;

  if(key == 0)
    return -1;
  readsb(dev, &s);
  slots = s.neffectblocks * (BSIZE / sizeof(struct effect_record));
  if(slots == 0 || s.effectstart + s.neffectblocks > s.size)
    return -1;

  start = (uint)(key ^ (key >> 32)) % slots;
  for(i = 0; i < slots; i++){
    slot = (start + i) % slots;
    block = s.effectstart + slot / (BSIZE / sizeof(struct effect_record));
    index = slot % (BSIZE / sizeof(struct effect_record));
    bp = bread(dev, block);
    records = (struct effect_record*)bp->data;
    if(records[index].key == key){
      brelse(bp);
      return -2;
    }
    if(records[index].key == 0){
      records[index].key = key;
      records[index].result = result;
      records[index].request_hash = request_hash;
      log_write(bp);
      brelse(bp);
      return 0;
    }
    brelse(bp);
  }
  return -1;
}
