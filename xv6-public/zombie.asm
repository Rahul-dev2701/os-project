
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 79 02 00 00       	call   28f <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7e 0d                	jle    27 <main+0x27>
    sleep(5);  // Let child exit before parent.
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	6a 05                	push   $0x5
  1f:	e8 03 03 00 00       	call   327 <sleep>
  24:	83 c4 10             	add    $0x10,%esp
  exit();
  27:	e8 6b 02 00 00       	call   297 <exit>
  2c:	66 90                	xchg   %ax,%ax
  2e:	66 90                	xchg   %ax,%ax
  30:	66 90                	xchg   %ax,%ax
  32:	66 90                	xchg   %ax,%ax
  34:	66 90                	xchg   %ax,%ax
  36:	66 90                	xchg   %ax,%ax
  38:	66 90                	xchg   %ax,%ax
  3a:	66 90                	xchg   %ax,%ax
  3c:	66 90                	xchg   %ax,%ax
  3e:	66 90                	xchg   %ax,%ax

00000040 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  40:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  41:	31 c0                	xor    %eax,%eax
{
  43:	89 e5                	mov    %esp,%ebp
  45:	53                   	push   %ebx
  46:	8b 4d 08             	mov    0x8(%ebp),%ecx
  49:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  50:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  54:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  57:	83 c0 01             	add    $0x1,%eax
  5a:	84 d2                	test   %dl,%dl
  5c:	75 f2                	jne    50 <strcpy+0x10>
    ;
  return os;
}
  5e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  61:	89 c8                	mov    %ecx,%eax
  63:	c9                   	leave
  64:	c3                   	ret
  65:	8d 76 00             	lea    0x0(%esi),%esi
  68:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  6f:	00 

00000070 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  70:	55                   	push   %ebp
  71:	89 e5                	mov    %esp,%ebp
  73:	53                   	push   %ebx
  74:	8b 55 08             	mov    0x8(%ebp),%edx
  77:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  7a:	0f b6 02             	movzbl (%edx),%eax
  7d:	84 c0                	test   %al,%al
  7f:	75 2d                	jne    ae <strcmp+0x3e>
  81:	eb 3d                	jmp    c0 <strcmp+0x50>
  83:	eb 1b                	jmp    a0 <strcmp+0x30>
  85:	8d 76 00             	lea    0x0(%esi),%esi
  88:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  8f:	00 
  90:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  97:	00 
  98:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  9f:	00 
  a0:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  a4:	83 c2 01             	add    $0x1,%edx
  a7:	83 c1 01             	add    $0x1,%ecx
  while(*p && *p == *q)
  aa:	84 c0                	test   %al,%al
  ac:	74 12                	je     c0 <strcmp+0x50>
  ae:	0f b6 19             	movzbl (%ecx),%ebx
  b1:	38 c3                	cmp    %al,%bl
  b3:	74 eb                	je     a0 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
  b5:	29 d8                	sub    %ebx,%eax
}
  b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  ba:	c9                   	leave
  bb:	c3                   	ret
  bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return (uchar)*p - (uchar)*q;
  c0:	0f b6 19             	movzbl (%ecx),%ebx
  c3:	31 c0                	xor    %eax,%eax
  c5:	29 d8                	sub    %ebx,%eax
}
  c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  ca:	c9                   	leave
  cb:	c3                   	ret
  cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000d0 <strlen>:

uint
strlen(const char *s)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  d6:	80 3a 00             	cmpb   $0x0,(%edx)
  d9:	74 15                	je     f0 <strlen+0x20>
  db:	31 c0                	xor    %eax,%eax
  dd:	8d 76 00             	lea    0x0(%esi),%esi
  e0:	83 c0 01             	add    $0x1,%eax
  e3:	89 c1                	mov    %eax,%ecx
  e5:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  e9:	75 f5                	jne    e0 <strlen+0x10>
    ;
  return n;
}
  eb:	89 c8                	mov    %ecx,%eax
  ed:	5d                   	pop    %ebp
  ee:	c3                   	ret
  ef:	90                   	nop
  for(n = 0; s[n]; n++)
  f0:	31 c9                	xor    %ecx,%ecx
}
  f2:	5d                   	pop    %ebp
  f3:	89 c8                	mov    %ecx,%eax
  f5:	c3                   	ret
  f6:	66 90                	xchg   %ax,%ax
  f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  ff:	00 

00000100 <memset>:

void*
memset(void *dst, int c, uint n)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 104:	8b 4d 10             	mov    0x10(%ebp),%ecx
 107:	8b 45 0c             	mov    0xc(%ebp),%eax
 10a:	8b 7d 08             	mov    0x8(%ebp),%edi
 10d:	fc                   	cld
 10e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 110:	8b 45 08             	mov    0x8(%ebp),%eax
 113:	8b 7d fc             	mov    -0x4(%ebp),%edi
 116:	c9                   	leave
 117:	c3                   	ret
 118:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 11f:	00 

00000120 <strchr>:

char*
strchr(const char *s, char c)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	8b 45 08             	mov    0x8(%ebp),%eax
 126:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 12a:	0f b6 10             	movzbl (%eax),%edx
 12d:	84 d2                	test   %dl,%dl
 12f:	75 1a                	jne    14b <strchr+0x2b>
 131:	eb 25                	jmp    158 <strchr+0x38>
 133:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 138:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 13f:	00 
 140:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 144:	83 c0 01             	add    $0x1,%eax
 147:	84 d2                	test   %dl,%dl
 149:	74 0d                	je     158 <strchr+0x38>
    if(*s == c)
 14b:	38 d1                	cmp    %dl,%cl
 14d:	75 f1                	jne    140 <strchr+0x20>
      return (char*)s;
  return 0;
}
 14f:	5d                   	pop    %ebp
 150:	c3                   	ret
 151:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 158:	31 c0                	xor    %eax,%eax
}
 15a:	5d                   	pop    %ebp
 15b:	c3                   	ret
 15c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000160 <gets>:

char*
gets(char *buf, int max)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	57                   	push   %edi
 164:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 165:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 168:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 169:	31 db                	xor    %ebx,%ebx
{
 16b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 16e:	eb 27                	jmp    197 <gets+0x37>
    cc = read(0, &c, 1);
 170:	83 ec 04             	sub    $0x4,%esp
 173:	6a 01                	push   $0x1
 175:	57                   	push   %edi
 176:	6a 00                	push   $0x0
 178:	e8 32 01 00 00       	call   2af <read>
    if(cc < 1)
 17d:	83 c4 10             	add    $0x10,%esp
 180:	85 c0                	test   %eax,%eax
 182:	7e 1d                	jle    1a1 <gets+0x41>
      break;
    buf[i++] = c;
 184:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 188:	8b 55 08             	mov    0x8(%ebp),%edx
 18b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 18f:	3c 0a                	cmp    $0xa,%al
 191:	74 1d                	je     1b0 <gets+0x50>
 193:	3c 0d                	cmp    $0xd,%al
 195:	74 19                	je     1b0 <gets+0x50>
  for(i=0; i+1 < max; ){
 197:	89 de                	mov    %ebx,%esi
 199:	83 c3 01             	add    $0x1,%ebx
 19c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 19f:	7c cf                	jl     170 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 1a1:	8b 45 08             	mov    0x8(%ebp),%eax
 1a4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ab:	5b                   	pop    %ebx
 1ac:	5e                   	pop    %esi
 1ad:	5f                   	pop    %edi
 1ae:	5d                   	pop    %ebp
 1af:	c3                   	ret
  buf[i] = '\0';
 1b0:	8b 45 08             	mov    0x8(%ebp),%eax
    buf[i++] = c;
 1b3:	89 de                	mov    %ebx,%esi
  buf[i] = '\0';
 1b5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 1b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1bc:	5b                   	pop    %ebx
 1bd:	5e                   	pop    %esi
 1be:	5f                   	pop    %edi
 1bf:	5d                   	pop    %ebp
 1c0:	c3                   	ret
 1c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1cf:	00 

000001d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1d6:	6a 00                	push   $0x0
 1d8:	ff 75 08             	push   0x8(%ebp)
{
 1db:	89 75 fc             	mov    %esi,-0x4(%ebp)
  fd = open(n, O_RDONLY);
 1de:	e8 f4 00 00 00       	call   2d7 <open>
  if(fd < 0)
 1e3:	83 c4 10             	add    $0x10,%esp
 1e6:	85 c0                	test   %eax,%eax
 1e8:	78 2e                	js     218 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 1ea:	83 ec 08             	sub    $0x8,%esp
 1ed:	ff 75 0c             	push   0xc(%ebp)
 1f0:	50                   	push   %eax
 1f1:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 1f4:	89 c3                	mov    %eax,%ebx
 1f6:	e8 f4 00 00 00       	call   2ef <fstat>
  close(fd);
 1fb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1fe:	89 c6                	mov    %eax,%esi
  close(fd);
 200:	e8 ba 00 00 00       	call   2bf <close>
  return r;
 205:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 208:	83 c4 10             	add    $0x10,%esp
}
 20b:	89 f0                	mov    %esi,%eax
 20d:	8b 75 fc             	mov    -0x4(%ebp),%esi
 210:	c9                   	leave
 211:	c3                   	ret
 212:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
 218:	be ff ff ff ff       	mov    $0xffffffff,%esi
 21d:	eb ec                	jmp    20b <stat+0x3b>
 21f:	90                   	nop

00000220 <atoi>:

int
atoi(const char *s)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	53                   	push   %ebx
 224:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 227:	0f be 02             	movsbl (%edx),%eax
 22a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 22d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 230:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 235:	77 1e                	ja     255 <atoi+0x35>
 237:	90                   	nop
 238:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 23f:	00 
    n = n*10 + *s++ - '0';
 240:	83 c2 01             	add    $0x1,%edx
 243:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 246:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 24a:	0f be 02             	movsbl (%edx),%eax
 24d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 250:	80 fb 09             	cmp    $0x9,%bl
 253:	76 eb                	jbe    240 <atoi+0x20>
  return n;
}
 255:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 258:	89 c8                	mov    %ecx,%eax
 25a:	c9                   	leave
 25b:	c3                   	ret
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000260 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	83 ec 08             	sub    $0x8,%esp
 266:	8b 45 10             	mov    0x10(%ebp),%eax
 269:	8b 55 08             	mov    0x8(%ebp),%edx
 26c:	89 75 f8             	mov    %esi,-0x8(%ebp)
 26f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 272:	85 c0                	test   %eax,%eax
 274:	7e 12                	jle    288 <memmove+0x28>
 276:	89 7d fc             	mov    %edi,-0x4(%ebp)
 279:	01 d0                	add    %edx,%eax
  dst = vdst;
 27b:	89 d7                	mov    %edx,%edi
 27d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 280:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 281:	39 f8                	cmp    %edi,%eax
 283:	75 fb                	jne    280 <memmove+0x20>
 285:	8b 7d fc             	mov    -0x4(%ebp),%edi
  return vdst;
}
 288:	8b 75 f8             	mov    -0x8(%ebp),%esi
 28b:	89 d0                	mov    %edx,%eax
 28d:	c9                   	leave
 28e:	c3                   	ret

0000028f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 28f:	b8 01 00 00 00       	mov    $0x1,%eax
 294:	cd 40                	int    $0x40
 296:	c3                   	ret

00000297 <exit>:
SYSCALL(exit)
 297:	b8 02 00 00 00       	mov    $0x2,%eax
 29c:	cd 40                	int    $0x40
 29e:	c3                   	ret

0000029f <wait>:
SYSCALL(wait)
 29f:	b8 03 00 00 00       	mov    $0x3,%eax
 2a4:	cd 40                	int    $0x40
 2a6:	c3                   	ret

000002a7 <pipe>:
SYSCALL(pipe)
 2a7:	b8 04 00 00 00       	mov    $0x4,%eax
 2ac:	cd 40                	int    $0x40
 2ae:	c3                   	ret

000002af <read>:
SYSCALL(read)
 2af:	b8 05 00 00 00       	mov    $0x5,%eax
 2b4:	cd 40                	int    $0x40
 2b6:	c3                   	ret

000002b7 <write>:
SYSCALL(write)
 2b7:	b8 10 00 00 00       	mov    $0x10,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret

000002bf <close>:
SYSCALL(close)
 2bf:	b8 15 00 00 00       	mov    $0x15,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret

000002c7 <kill>:
SYSCALL(kill)
 2c7:	b8 06 00 00 00       	mov    $0x6,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret

000002cf <exec>:
SYSCALL(exec)
 2cf:	b8 07 00 00 00       	mov    $0x7,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret

000002d7 <open>:
SYSCALL(open)
 2d7:	b8 0f 00 00 00       	mov    $0xf,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret

000002df <mknod>:
SYSCALL(mknod)
 2df:	b8 11 00 00 00       	mov    $0x11,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret

000002e7 <unlink>:
SYSCALL(unlink)
 2e7:	b8 12 00 00 00       	mov    $0x12,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret

000002ef <fstat>:
SYSCALL(fstat)
 2ef:	b8 08 00 00 00       	mov    $0x8,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret

000002f7 <link>:
SYSCALL(link)
 2f7:	b8 13 00 00 00       	mov    $0x13,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret

000002ff <mkdir>:
SYSCALL(mkdir)
 2ff:	b8 14 00 00 00       	mov    $0x14,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret

00000307 <chdir>:
SYSCALL(chdir)
 307:	b8 09 00 00 00       	mov    $0x9,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret

0000030f <dup>:
SYSCALL(dup)
 30f:	b8 0a 00 00 00       	mov    $0xa,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret

00000317 <getpid>:
SYSCALL(getpid)
 317:	b8 0b 00 00 00       	mov    $0xb,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret

0000031f <sbrk>:
SYSCALL(sbrk)
 31f:	b8 0c 00 00 00       	mov    $0xc,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret

00000327 <sleep>:
SYSCALL(sleep)
 327:	b8 0d 00 00 00       	mov    $0xd,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret

0000032f <uptime>:
SYSCALL(uptime)
 32f:	b8 0e 00 00 00       	mov    $0xe,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret
 337:	66 90                	xchg   %ax,%ax
 339:	66 90                	xchg   %ax,%ax
 33b:	66 90                	xchg   %ax,%ax
 33d:	66 90                	xchg   %ax,%ax
 33f:	90                   	nop

00000340 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	57                   	push   %edi
 344:	56                   	push   %esi
 345:	53                   	push   %ebx
 346:	89 cb                	mov    %ecx,%ebx
 348:	83 ec 3c             	sub    $0x3c,%esp
 34b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 34e:	85 d2                	test   %edx,%edx
 350:	0f 89 9a 00 00 00    	jns    3f0 <printint+0xb0>
 356:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 35a:	0f 84 90 00 00 00    	je     3f0 <printint+0xb0>
    neg = 1;
    x = -xx;
 360:	f7 da                	neg    %edx
    neg = 1;
 362:	b8 01 00 00 00       	mov    $0x1,%eax
 367:	89 45 c0             	mov    %eax,-0x40(%ebp)
 36a:	89 d1                	mov    %edx,%ecx
  } else {
    x = xx;
  }

  i = 0;
 36c:	31 f6                	xor    %esi,%esi
 36e:	66 90                	xchg   %ax,%ax
 370:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 377:	00 
 378:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 37f:	00 
  do{
    buf[i++] = digits[x % base];
 380:	89 c8                	mov    %ecx,%eax
 382:	31 d2                	xor    %edx,%edx
 384:	89 f7                	mov    %esi,%edi
 386:	f7 f3                	div    %ebx
 388:	8d 76 01             	lea    0x1(%esi),%esi
  }while((x /= base) != 0);
 38b:	39 d9                	cmp    %ebx,%ecx
    buf[i++] = digits[x % base];
 38d:	0f b6 92 08 08 00 00 	movzbl 0x808(%edx),%edx
  }while((x /= base) != 0);
 394:	89 c1                	mov    %eax,%ecx
    buf[i++] = digits[x % base];
 396:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 39a:	73 e4                	jae    380 <printint+0x40>
  if(neg)
 39c:	8b 45 c0             	mov    -0x40(%ebp),%eax
 39f:	85 c0                	test   %eax,%eax
 3a1:	74 07                	je     3aa <printint+0x6a>
    buf[i++] = '-';
 3a3:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 3a8:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
 3aa:	8d 74 3d d8          	lea    -0x28(%ebp,%edi,1),%esi
 3ae:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 3b1:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3bf:	00 
    putc(fd, buf[i]);
 3c0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 3c3:	83 ec 04             	sub    $0x4,%esp
  while(--i >= 0)
 3c6:	83 ee 01             	sub    $0x1,%esi
 3c9:	88 45 d7             	mov    %al,-0x29(%ebp)
  write(fd, &c, 1);
 3cc:	8d 45 d7             	lea    -0x29(%ebp),%eax
 3cf:	6a 01                	push   $0x1
 3d1:	50                   	push   %eax
 3d2:	57                   	push   %edi
 3d3:	e8 df fe ff ff       	call   2b7 <write>
  while(--i >= 0)
 3d8:	83 c4 10             	add    $0x10,%esp
 3db:	39 f3                	cmp    %esi,%ebx
 3dd:	75 e1                	jne    3c0 <printint+0x80>
}
 3df:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3e2:	5b                   	pop    %ebx
 3e3:	5e                   	pop    %esi
 3e4:	5f                   	pop    %edi
 3e5:	5d                   	pop    %ebp
 3e6:	c3                   	ret
 3e7:	90                   	nop
 3e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ef:	00 
  neg = 0;
 3f0:	31 c0                	xor    %eax,%eax
 3f2:	e9 70 ff ff ff       	jmp    367 <printint+0x27>
 3f7:	90                   	nop
 3f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ff:	00 

00000400 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	83 ec 38             	sub    $0x38,%esp
 406:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 409:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 40c:	89 75 f8             	mov    %esi,-0x8(%ebp)
 40f:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 412:	0f b6 03             	movzbl (%ebx),%eax
 415:	84 c0                	test   %al,%al
 417:	0f 84 b6 00 00 00    	je     4d3 <printf+0xd3>
  ap = (uint*)(void*)&fmt + 1;
 41d:	8d 4d 10             	lea    0x10(%ebp),%ecx
 420:	89 7d fc             	mov    %edi,-0x4(%ebp)
 423:	83 c3 01             	add    $0x1,%ebx
 426:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
 429:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 42c:	0f b6 d0             	movzbl %al,%edx
    if(state == 0){
 42f:	eb 2a                	jmp    45b <printf+0x5b>
 431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 438:	83 ec 04             	sub    $0x4,%esp
 43b:	88 45 e7             	mov    %al,-0x19(%ebp)
 43e:	8d 45 e7             	lea    -0x19(%ebp),%eax
  for(i = 0; fmt[i]; i++){
 441:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 444:	6a 01                	push   $0x1
 446:	50                   	push   %eax
 447:	56                   	push   %esi
 448:	e8 6a fe ff ff       	call   2b7 <write>
  for(i = 0; fmt[i]; i++){
 44d:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
 451:	83 c4 10             	add    $0x10,%esp
 454:	84 c0                	test   %al,%al
 456:	74 78                	je     4d0 <printf+0xd0>
    c = fmt[i] & 0xff;
 458:	0f b6 d0             	movzbl %al,%edx
      if(c == '%'){
 45b:	83 fa 25             	cmp    $0x25,%edx
 45e:	75 d8                	jne    438 <printf+0x38>
  for(i = 0; fmt[i]; i++){
 460:	0f b6 13             	movzbl (%ebx),%edx
 463:	84 d2                	test   %dl,%dl
 465:	74 69                	je     4d0 <printf+0xd0>
    c = fmt[i] & 0xff;
 467:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 46a:	80 fa 25             	cmp    $0x25,%dl
 46d:	0f 84 25 01 00 00    	je     598 <printf+0x198>
 473:	83 e8 63             	sub    $0x63,%eax
 476:	83 f8 15             	cmp    $0x15,%eax
 479:	77 0d                	ja     488 <printf+0x88>
 47b:	ff 24 85 b0 07 00 00 	jmp    *0x7b0(,%eax,4)
 482:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 488:	83 ec 04             	sub    $0x4,%esp
 48b:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 48e:	88 55 d0             	mov    %dl,-0x30(%ebp)
 491:	6a 01                	push   $0x1
 493:	51                   	push   %ecx
 494:	56                   	push   %esi
 495:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 498:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 49c:	e8 16 fe ff ff       	call   2b7 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 4a1:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 4a5:	83 c4 0c             	add    $0xc,%esp
 4a8:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 4ab:	6a 01                	push   $0x1
 4ad:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4b0:	51                   	push   %ecx
  for(i = 0; fmt[i]; i++){
 4b1:	83 c3 02             	add    $0x2,%ebx
  write(fd, &c, 1);
 4b4:	56                   	push   %esi
 4b5:	e8 fd fd ff ff       	call   2b7 <write>
  for(i = 0; fmt[i]; i++){
 4ba:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
 4be:	83 c4 10             	add    $0x10,%esp
 4c1:	84 c0                	test   %al,%al
 4c3:	75 93                	jne    458 <printf+0x58>
 4c5:	8d 76 00             	lea    0x0(%esi),%esi
 4c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4cf:	00 
 4d0:	8b 7d fc             	mov    -0x4(%ebp),%edi
      }
      state = 0;
    }
  }
}
 4d3:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 4d6:	8b 75 f8             	mov    -0x8(%ebp),%esi
 4d9:	c9                   	leave
 4da:	c3                   	ret
 4db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 16, 0);
 4e0:	83 ec 0c             	sub    $0xc,%esp
 4e3:	8b 17                	mov    (%edi),%edx
 4e5:	b9 10 00 00 00       	mov    $0x10,%ecx
 4ea:	89 f0                	mov    %esi,%eax
 4ec:	6a 00                	push   $0x0
 4ee:	e8 4d fe ff ff       	call   340 <printint>
  for(i = 0; fmt[i]; i++){
 4f3:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
 4f7:	83 c3 02             	add    $0x2,%ebx
 4fa:	83 c4 10             	add    $0x10,%esp
 4fd:	84 c0                	test   %al,%al
 4ff:	74 cf                	je     4d0 <printf+0xd0>
        ap++;
 501:	83 c7 04             	add    $0x4,%edi
 504:	e9 4f ff ff ff       	jmp    458 <printf+0x58>
 509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 510:	83 ec 0c             	sub    $0xc,%esp
 513:	8b 17                	mov    (%edi),%edx
 515:	b9 0a 00 00 00       	mov    $0xa,%ecx
 51a:	89 f0                	mov    %esi,%eax
 51c:	6a 01                	push   $0x1
 51e:	e8 1d fe ff ff       	call   340 <printint>
  for(i = 0; fmt[i]; i++){
 523:	eb ce                	jmp    4f3 <printf+0xf3>
 525:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 528:	83 ec 04             	sub    $0x4,%esp
 52b:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        putc(fd, *ap);
 52e:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 530:	6a 01                	push   $0x1
 532:	51                   	push   %ecx
 533:	56                   	push   %esi
        putc(fd, *ap);
 534:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 537:	e8 7b fd ff ff       	call   2b7 <write>
 53c:	eb b5                	jmp    4f3 <printf+0xf3>
 53e:	66 90                	xchg   %ax,%ax
        s = (char*)*ap;
 540:	8b 07                	mov    (%edi),%eax
        ap++;
 542:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 545:	85 c0                	test   %eax,%eax
 547:	74 67                	je     5b0 <printf+0x1b0>
        while(*s != 0){
 549:	0f b6 10             	movzbl (%eax),%edx
 54c:	84 d2                	test   %dl,%dl
 54e:	74 6f                	je     5bf <printf+0x1bf>
 550:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 553:	89 c7                	mov    %eax,%edi
 555:	89 d0                	mov    %edx,%eax
 557:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 55a:	89 fb                	mov    %edi,%ebx
 55c:	8d 7d e7             	lea    -0x19(%ebp),%edi
 55f:	90                   	nop
  write(fd, &c, 1);
 560:	83 ec 04             	sub    $0x4,%esp
          s++;
 563:	83 c3 01             	add    $0x1,%ebx
 566:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 569:	6a 01                	push   $0x1
 56b:	57                   	push   %edi
 56c:	56                   	push   %esi
 56d:	e8 45 fd ff ff       	call   2b7 <write>
        while(*s != 0){
 572:	0f b6 03             	movzbl (%ebx),%eax
 575:	83 c4 10             	add    $0x10,%esp
 578:	84 c0                	test   %al,%al
 57a:	75 e4                	jne    560 <printf+0x160>
 57c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
 57f:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
 583:	83 c3 02             	add    $0x2,%ebx
 586:	84 c0                	test   %al,%al
 588:	0f 85 9b fe ff ff    	jne    429 <printf+0x29>
 58e:	e9 3d ff ff ff       	jmp    4d0 <printf+0xd0>
 593:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 598:	83 ec 04             	sub    $0x4,%esp
 59b:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 59f:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 5a2:	6a 01                	push   $0x1
 5a4:	e9 07 ff ff ff       	jmp    4b0 <printf+0xb0>
 5a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
          s = "(null)";
 5b0:	89 7d d4             	mov    %edi,-0x2c(%ebp)
        if(s == 0)
 5b3:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 5b8:	bf a8 07 00 00       	mov    $0x7a8,%edi
 5bd:	eb 98                	jmp    557 <printf+0x157>
  for(i = 0; fmt[i]; i++){
 5bf:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
 5c3:	83 c3 02             	add    $0x2,%ebx
 5c6:	84 c0                	test   %al,%al
 5c8:	0f 85 8a fe ff ff    	jne    458 <printf+0x58>
 5ce:	e9 fd fe ff ff       	jmp    4d0 <printf+0xd0>
 5d3:	66 90                	xchg   %ax,%ax
 5d5:	66 90                	xchg   %ax,%ax
 5d7:	66 90                	xchg   %ax,%ax
 5d9:	66 90                	xchg   %ax,%ax
 5db:	66 90                	xchg   %ax,%ax
 5dd:	66 90                	xchg   %ax,%ax
 5df:	90                   	nop

000005e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e1:	a1 f8 0a 00 00       	mov    0xaf8,%eax
{
 5e6:	89 e5                	mov    %esp,%ebp
 5e8:	57                   	push   %edi
 5e9:	56                   	push   %esi
 5ea:	53                   	push   %ebx
 5eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 5ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5ff:	00 
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 600:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 602:	39 c8                	cmp    %ecx,%eax
 604:	73 32                	jae    638 <free+0x58>
 606:	39 d1                	cmp    %edx,%ecx
 608:	72 04                	jb     60e <free+0x2e>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 60a:	39 d0                	cmp    %edx,%eax
 60c:	72 32                	jb     640 <free+0x60>
      break;
  if(bp + bp->s.size == p->s.ptr){
 60e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 611:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 614:	39 fa                	cmp    %edi,%edx
 616:	74 30                	je     648 <free+0x68>
 618:	89 53 f8             	mov    %edx,-0x8(%ebx)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 61b:	8b 50 04             	mov    0x4(%eax),%edx
 61e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 621:	39 f1                	cmp    %esi,%ecx
 623:	74 3a                	je     65f <free+0x7f>
 625:	89 08                	mov    %ecx,(%eax)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
}
 627:	5b                   	pop    %ebx
  freep = p;
 628:	a3 f8 0a 00 00       	mov    %eax,0xaf8
}
 62d:	5e                   	pop    %esi
 62e:	5f                   	pop    %edi
 62f:	5d                   	pop    %ebp
 630:	c3                   	ret
 631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 638:	39 d0                	cmp    %edx,%eax
 63a:	72 04                	jb     640 <free+0x60>
 63c:	39 d1                	cmp    %edx,%ecx
 63e:	72 ce                	jb     60e <free+0x2e>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 640:	89 d0                	mov    %edx,%eax
 642:	eb bc                	jmp    600 <free+0x20>
 644:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 648:	03 72 04             	add    0x4(%edx),%esi
 64b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 64e:	8b 10                	mov    (%eax),%edx
 650:	8b 12                	mov    (%edx),%edx
 652:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 655:	8b 50 04             	mov    0x4(%eax),%edx
 658:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 65b:	39 f1                	cmp    %esi,%ecx
 65d:	75 c6                	jne    625 <free+0x45>
    p->s.size += bp->s.size;
 65f:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 662:	a3 f8 0a 00 00       	mov    %eax,0xaf8
    p->s.size += bp->s.size;
 667:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 66a:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 66d:	89 08                	mov    %ecx,(%eax)
}
 66f:	5b                   	pop    %ebx
 670:	5e                   	pop    %esi
 671:	5f                   	pop    %edi
 672:	5d                   	pop    %ebp
 673:	c3                   	ret
 674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 678:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 67f:	00 

00000680 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 686:	8b 45 08             	mov    0x8(%ebp),%eax
{
 689:	89 7d fc             	mov    %edi,-0x4(%ebp)
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 68c:	8d 78 07             	lea    0x7(%eax),%edi
  if((prevp = freep) == 0){
 68f:	a1 f8 0a 00 00       	mov    0xaf8,%eax
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 694:	c1 ef 03             	shr    $0x3,%edi
 697:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 69a:	85 c0                	test   %eax,%eax
 69c:	0f 84 c6 00 00 00    	je     768 <malloc+0xe8>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6a2:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 6a4:	8b 4a 04             	mov    0x4(%edx),%ecx
 6a7:	39 f9                	cmp    %edi,%ecx
 6a9:	0f 83 87 00 00 00    	jae    736 <malloc+0xb6>
 6af:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 6b2:	89 75 f8             	mov    %esi,-0x8(%ebp)
  if(nu < 4096)
 6b5:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6ba:	39 df                	cmp    %ebx,%edi
 6bc:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 6bf:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 6c6:	eb 21                	jmp    6e9 <malloc+0x69>
 6c8:	eb 16                	jmp    6e0 <malloc+0x60>
 6ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6d0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 6d7:	00 
 6d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 6df:	00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 6e2:	8b 4a 04             	mov    0x4(%edx),%ecx
 6e5:	39 f9                	cmp    %edi,%ecx
 6e7:	73 47                	jae    730 <malloc+0xb0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6e9:	89 d0                	mov    %edx,%eax
 6eb:	39 15 f8 0a 00 00    	cmp    %edx,0xaf8
 6f1:	75 ed                	jne    6e0 <malloc+0x60>
  p = sbrk(nu * sizeof(Header));
 6f3:	83 ec 0c             	sub    $0xc,%esp
 6f6:	56                   	push   %esi
 6f7:	e8 23 fc ff ff       	call   31f <sbrk>
  if(p == (char*)-1)
 6fc:	83 c4 10             	add    $0x10,%esp
 6ff:	83 f8 ff             	cmp    $0xffffffff,%eax
 702:	74 54                	je     758 <malloc+0xd8>
  hp->s.size = nu;
 704:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 707:	83 ec 0c             	sub    $0xc,%esp
 70a:	83 c0 08             	add    $0x8,%eax
 70d:	50                   	push   %eax
 70e:	e8 cd fe ff ff       	call   5e0 <free>
  return freep;
 713:	a1 f8 0a 00 00       	mov    0xaf8,%eax
      if((p = morecore(nunits)) == 0)
 718:	83 c4 10             	add    $0x10,%esp
 71b:	85 c0                	test   %eax,%eax
 71d:	75 c1                	jne    6e0 <malloc+0x60>
 71f:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 722:	8b 75 f8             	mov    -0x8(%ebp),%esi
 725:	eb 26                	jmp    74d <malloc+0xcd>
 727:	90                   	nop
 728:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 72f:	00 
 730:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 733:	8b 75 f8             	mov    -0x8(%ebp),%esi
      if(p->s.size == nunits)
 736:	39 cf                	cmp    %ecx,%edi
 738:	74 66                	je     7a0 <malloc+0x120>
        p->s.size -= nunits;
 73a:	29 f9                	sub    %edi,%ecx
 73c:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 73f:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 742:	89 7a 04             	mov    %edi,0x4(%edx)
      freep = prevp;
 745:	a3 f8 0a 00 00       	mov    %eax,0xaf8
      return (void*)(p + 1);
 74a:	8d 42 08             	lea    0x8(%edx),%eax
        return 0;
  }
}
 74d:	8b 7d fc             	mov    -0x4(%ebp),%edi
 750:	c9                   	leave
 751:	c3                   	ret
 752:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        return 0;
 758:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 75b:	8b 75 f8             	mov    -0x8(%ebp),%esi
 75e:	31 c0                	xor    %eax,%eax
}
 760:	8b 7d fc             	mov    -0x4(%ebp),%edi
 763:	c9                   	leave
 764:	c3                   	ret
 765:	8d 76 00             	lea    0x0(%esi),%esi
 768:	89 5d f4             	mov    %ebx,-0xc(%ebp)
    base.s.size = 0;
 76b:	ba fc 0a 00 00       	mov    $0xafc,%edx
 770:	89 75 f8             	mov    %esi,-0x8(%ebp)
    base.s.ptr = freep = prevp = &base;
 773:	c7 05 f8 0a 00 00 fc 	movl   $0xafc,0xaf8
 77a:	0a 00 00 
 77d:	c7 05 fc 0a 00 00 fc 	movl   $0xafc,0xafc
 784:	0a 00 00 
    base.s.size = 0;
 787:	c7 05 00 0b 00 00 00 	movl   $0x0,0xb00
 78e:	00 00 00 
    if(p->s.size >= nunits){
 791:	e9 1f ff ff ff       	jmp    6b5 <malloc+0x35>
 796:	66 90                	xchg   %ax,%ax
 798:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 79f:	00 
        prevp->s.ptr = p->s.ptr;
 7a0:	8b 0a                	mov    (%edx),%ecx
 7a2:	89 08                	mov    %ecx,(%eax)
 7a4:	eb 9f                	jmp    745 <malloc+0xc5>
