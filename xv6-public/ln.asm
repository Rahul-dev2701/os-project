
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
  12:	83 39 03             	cmpl   $0x3,(%ecx)
  15:	74 13                	je     2a <main+0x2a>
    printf(2, "Usage: ln old new\n");
  17:	52                   	push   %edx
  18:	52                   	push   %edx
  19:	68 c8 07 00 00       	push   $0x7c8
  1e:	6a 02                	push   $0x2
  20:	e8 fb 03 00 00       	call   420 <printf>
    exit();
  25:	e8 8d 02 00 00       	call   2b7 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2a:	50                   	push   %eax
  2b:	50                   	push   %eax
  2c:	ff 73 08             	push   0x8(%ebx)
  2f:	ff 73 04             	push   0x4(%ebx)
  32:	e8 e0 02 00 00       	call   317 <link>
  37:	83 c4 10             	add    $0x10,%esp
  3a:	85 c0                	test   %eax,%eax
  3c:	78 05                	js     43 <main+0x43>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  3e:	e8 74 02 00 00       	call   2b7 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  43:	ff 73 08             	push   0x8(%ebx)
  46:	ff 73 04             	push   0x4(%ebx)
  49:	68 db 07 00 00       	push   $0x7db
  4e:	6a 02                	push   $0x2
  50:	e8 cb 03 00 00       	call   420 <printf>
  55:	83 c4 10             	add    $0x10,%esp
  58:	eb e4                	jmp    3e <main+0x3e>
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  60:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  61:	31 c0                	xor    %eax,%eax
{
  63:	89 e5                	mov    %esp,%ebp
  65:	53                   	push   %ebx
  66:	8b 4d 08             	mov    0x8(%ebp),%ecx
  69:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  70:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  74:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  77:	83 c0 01             	add    $0x1,%eax
  7a:	84 d2                	test   %dl,%dl
  7c:	75 f2                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  7e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  81:	89 c8                	mov    %ecx,%eax
  83:	c9                   	leave
  84:	c3                   	ret
  85:	8d 76 00             	lea    0x0(%esi),%esi
  88:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  8f:	00 

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	53                   	push   %ebx
  94:	8b 55 08             	mov    0x8(%ebp),%edx
  97:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  9a:	0f b6 02             	movzbl (%edx),%eax
  9d:	84 c0                	test   %al,%al
  9f:	75 2d                	jne    ce <strcmp+0x3e>
  a1:	eb 3d                	jmp    e0 <strcmp+0x50>
  a3:	eb 1b                	jmp    c0 <strcmp+0x30>
  a5:	8d 76 00             	lea    0x0(%esi),%esi
  a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  af:	00 
  b0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  b7:	00 
  b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  bf:	00 
  c0:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  c4:	83 c2 01             	add    $0x1,%edx
  c7:	83 c1 01             	add    $0x1,%ecx
  while(*p && *p == *q)
  ca:	84 c0                	test   %al,%al
  cc:	74 12                	je     e0 <strcmp+0x50>
  ce:	0f b6 19             	movzbl (%ecx),%ebx
  d1:	38 c3                	cmp    %al,%bl
  d3:	74 eb                	je     c0 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
  d5:	29 d8                	sub    %ebx,%eax
}
  d7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  da:	c9                   	leave
  db:	c3                   	ret
  dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return (uchar)*p - (uchar)*q;
  e0:	0f b6 19             	movzbl (%ecx),%ebx
  e3:	31 c0                	xor    %eax,%eax
  e5:	29 d8                	sub    %ebx,%eax
}
  e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  ea:	c9                   	leave
  eb:	c3                   	ret
  ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000f0 <strlen>:

uint
strlen(const char *s)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  f6:	80 3a 00             	cmpb   $0x0,(%edx)
  f9:	74 15                	je     110 <strlen+0x20>
  fb:	31 c0                	xor    %eax,%eax
  fd:	8d 76 00             	lea    0x0(%esi),%esi
 100:	83 c0 01             	add    $0x1,%eax
 103:	89 c1                	mov    %eax,%ecx
 105:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 109:	75 f5                	jne    100 <strlen+0x10>
    ;
  return n;
}
 10b:	89 c8                	mov    %ecx,%eax
 10d:	5d                   	pop    %ebp
 10e:	c3                   	ret
 10f:	90                   	nop
  for(n = 0; s[n]; n++)
 110:	31 c9                	xor    %ecx,%ecx
}
 112:	5d                   	pop    %ebp
 113:	89 c8                	mov    %ecx,%eax
 115:	c3                   	ret
 116:	66 90                	xchg   %ax,%ax
 118:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 11f:	00 

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 124:	8b 4d 10             	mov    0x10(%ebp),%ecx
 127:	8b 45 0c             	mov    0xc(%ebp),%eax
 12a:	8b 7d 08             	mov    0x8(%ebp),%edi
 12d:	fc                   	cld
 12e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 130:	8b 45 08             	mov    0x8(%ebp),%eax
 133:	8b 7d fc             	mov    -0x4(%ebp),%edi
 136:	c9                   	leave
 137:	c3                   	ret
 138:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 13f:	00 

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 14a:	0f b6 10             	movzbl (%eax),%edx
 14d:	84 d2                	test   %dl,%dl
 14f:	75 1a                	jne    16b <strchr+0x2b>
 151:	eb 25                	jmp    178 <strchr+0x38>
 153:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 158:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 15f:	00 
 160:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 164:	83 c0 01             	add    $0x1,%eax
 167:	84 d2                	test   %dl,%dl
 169:	74 0d                	je     178 <strchr+0x38>
    if(*s == c)
 16b:	38 d1                	cmp    %dl,%cl
 16d:	75 f1                	jne    160 <strchr+0x20>
      return (char*)s;
  return 0;
}
 16f:	5d                   	pop    %ebp
 170:	c3                   	ret
 171:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 178:	31 c0                	xor    %eax,%eax
}
 17a:	5d                   	pop    %ebp
 17b:	c3                   	ret
 17c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000180 <gets>:

char*
gets(char *buf, int max)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 185:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 188:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 189:	31 db                	xor    %ebx,%ebx
{
 18b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 18e:	eb 27                	jmp    1b7 <gets+0x37>
    cc = read(0, &c, 1);
 190:	83 ec 04             	sub    $0x4,%esp
 193:	6a 01                	push   $0x1
 195:	57                   	push   %edi
 196:	6a 00                	push   $0x0
 198:	e8 32 01 00 00       	call   2cf <read>
    if(cc < 1)
 19d:	83 c4 10             	add    $0x10,%esp
 1a0:	85 c0                	test   %eax,%eax
 1a2:	7e 1d                	jle    1c1 <gets+0x41>
      break;
    buf[i++] = c;
 1a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1a8:	8b 55 08             	mov    0x8(%ebp),%edx
 1ab:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1af:	3c 0a                	cmp    $0xa,%al
 1b1:	74 1d                	je     1d0 <gets+0x50>
 1b3:	3c 0d                	cmp    $0xd,%al
 1b5:	74 19                	je     1d0 <gets+0x50>
  for(i=0; i+1 < max; ){
 1b7:	89 de                	mov    %ebx,%esi
 1b9:	83 c3 01             	add    $0x1,%ebx
 1bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1bf:	7c cf                	jl     190 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 1c1:	8b 45 08             	mov    0x8(%ebp),%eax
 1c4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1cb:	5b                   	pop    %ebx
 1cc:	5e                   	pop    %esi
 1cd:	5f                   	pop    %edi
 1ce:	5d                   	pop    %ebp
 1cf:	c3                   	ret
  buf[i] = '\0';
 1d0:	8b 45 08             	mov    0x8(%ebp),%eax
    buf[i++] = c;
 1d3:	89 de                	mov    %ebx,%esi
  buf[i] = '\0';
 1d5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 1d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1dc:	5b                   	pop    %ebx
 1dd:	5e                   	pop    %esi
 1de:	5f                   	pop    %edi
 1df:	5d                   	pop    %ebp
 1e0:	c3                   	ret
 1e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1ef:	00 

000001f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f6:	6a 00                	push   $0x0
 1f8:	ff 75 08             	push   0x8(%ebp)
{
 1fb:	89 75 fc             	mov    %esi,-0x4(%ebp)
  fd = open(n, O_RDONLY);
 1fe:	e8 f4 00 00 00       	call   2f7 <open>
  if(fd < 0)
 203:	83 c4 10             	add    $0x10,%esp
 206:	85 c0                	test   %eax,%eax
 208:	78 2e                	js     238 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 20a:	83 ec 08             	sub    $0x8,%esp
 20d:	ff 75 0c             	push   0xc(%ebp)
 210:	50                   	push   %eax
 211:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 214:	89 c3                	mov    %eax,%ebx
 216:	e8 f4 00 00 00       	call   30f <fstat>
  close(fd);
 21b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 21e:	89 c6                	mov    %eax,%esi
  close(fd);
 220:	e8 ba 00 00 00       	call   2df <close>
  return r;
 225:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 228:	83 c4 10             	add    $0x10,%esp
}
 22b:	89 f0                	mov    %esi,%eax
 22d:	8b 75 fc             	mov    -0x4(%ebp),%esi
 230:	c9                   	leave
 231:	c3                   	ret
 232:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
 238:	be ff ff ff ff       	mov    $0xffffffff,%esi
 23d:	eb ec                	jmp    22b <stat+0x3b>
 23f:	90                   	nop

00000240 <atoi>:

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 247:	0f be 02             	movsbl (%edx),%eax
 24a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 24d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 250:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 255:	77 1e                	ja     275 <atoi+0x35>
 257:	90                   	nop
 258:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 25f:	00 
    n = n*10 + *s++ - '0';
 260:	83 c2 01             	add    $0x1,%edx
 263:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 266:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 26a:	0f be 02             	movsbl (%edx),%eax
 26d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 270:	80 fb 09             	cmp    $0x9,%bl
 273:	76 eb                	jbe    260 <atoi+0x20>
  return n;
}
 275:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 278:	89 c8                	mov    %ecx,%eax
 27a:	c9                   	leave
 27b:	c3                   	ret
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	83 ec 08             	sub    $0x8,%esp
 286:	8b 45 10             	mov    0x10(%ebp),%eax
 289:	8b 55 08             	mov    0x8(%ebp),%edx
 28c:	89 75 f8             	mov    %esi,-0x8(%ebp)
 28f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 292:	85 c0                	test   %eax,%eax
 294:	7e 12                	jle    2a8 <memmove+0x28>
 296:	89 7d fc             	mov    %edi,-0x4(%ebp)
 299:	01 d0                	add    %edx,%eax
  dst = vdst;
 29b:	89 d7                	mov    %edx,%edi
 29d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2a1:	39 f8                	cmp    %edi,%eax
 2a3:	75 fb                	jne    2a0 <memmove+0x20>
 2a5:	8b 7d fc             	mov    -0x4(%ebp),%edi
  return vdst;
}
 2a8:	8b 75 f8             	mov    -0x8(%ebp),%esi
 2ab:	89 d0                	mov    %edx,%eax
 2ad:	c9                   	leave
 2ae:	c3                   	ret

000002af <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2af:	b8 01 00 00 00       	mov    $0x1,%eax
 2b4:	cd 40                	int    $0x40
 2b6:	c3                   	ret

000002b7 <exit>:
SYSCALL(exit)
 2b7:	b8 02 00 00 00       	mov    $0x2,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret

000002bf <wait>:
SYSCALL(wait)
 2bf:	b8 03 00 00 00       	mov    $0x3,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret

000002c7 <pipe>:
SYSCALL(pipe)
 2c7:	b8 04 00 00 00       	mov    $0x4,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret

000002cf <read>:
SYSCALL(read)
 2cf:	b8 05 00 00 00       	mov    $0x5,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret

000002d7 <write>:
SYSCALL(write)
 2d7:	b8 10 00 00 00       	mov    $0x10,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret

000002df <close>:
SYSCALL(close)
 2df:	b8 15 00 00 00       	mov    $0x15,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret

000002e7 <kill>:
SYSCALL(kill)
 2e7:	b8 06 00 00 00       	mov    $0x6,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret

000002ef <exec>:
SYSCALL(exec)
 2ef:	b8 07 00 00 00       	mov    $0x7,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret

000002f7 <open>:
SYSCALL(open)
 2f7:	b8 0f 00 00 00       	mov    $0xf,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret

000002ff <mknod>:
SYSCALL(mknod)
 2ff:	b8 11 00 00 00       	mov    $0x11,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret

00000307 <unlink>:
SYSCALL(unlink)
 307:	b8 12 00 00 00       	mov    $0x12,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret

0000030f <fstat>:
SYSCALL(fstat)
 30f:	b8 08 00 00 00       	mov    $0x8,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret

00000317 <link>:
SYSCALL(link)
 317:	b8 13 00 00 00       	mov    $0x13,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret

0000031f <mkdir>:
SYSCALL(mkdir)
 31f:	b8 14 00 00 00       	mov    $0x14,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret

00000327 <chdir>:
SYSCALL(chdir)
 327:	b8 09 00 00 00       	mov    $0x9,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret

0000032f <dup>:
SYSCALL(dup)
 32f:	b8 0a 00 00 00       	mov    $0xa,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret

00000337 <getpid>:
SYSCALL(getpid)
 337:	b8 0b 00 00 00       	mov    $0xb,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret

0000033f <sbrk>:
SYSCALL(sbrk)
 33f:	b8 0c 00 00 00       	mov    $0xc,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret

00000347 <sleep>:
SYSCALL(sleep)
 347:	b8 0d 00 00 00       	mov    $0xd,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret

0000034f <uptime>:
SYSCALL(uptime)
 34f:	b8 0e 00 00 00       	mov    $0xe,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret
 357:	66 90                	xchg   %ax,%ax
 359:	66 90                	xchg   %ax,%ax
 35b:	66 90                	xchg   %ax,%ax
 35d:	66 90                	xchg   %ax,%ax
 35f:	90                   	nop

00000360 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
 365:	53                   	push   %ebx
 366:	89 cb                	mov    %ecx,%ebx
 368:	83 ec 3c             	sub    $0x3c,%esp
 36b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 36e:	85 d2                	test   %edx,%edx
 370:	0f 89 9a 00 00 00    	jns    410 <printint+0xb0>
 376:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 37a:	0f 84 90 00 00 00    	je     410 <printint+0xb0>
    neg = 1;
    x = -xx;
 380:	f7 da                	neg    %edx
    neg = 1;
 382:	b8 01 00 00 00       	mov    $0x1,%eax
 387:	89 45 c0             	mov    %eax,-0x40(%ebp)
 38a:	89 d1                	mov    %edx,%ecx
  } else {
    x = xx;
  }

  i = 0;
 38c:	31 f6                	xor    %esi,%esi
 38e:	66 90                	xchg   %ax,%ax
 390:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 397:	00 
 398:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 39f:	00 
  do{
    buf[i++] = digits[x % base];
 3a0:	89 c8                	mov    %ecx,%eax
 3a2:	31 d2                	xor    %edx,%edx
 3a4:	89 f7                	mov    %esi,%edi
 3a6:	f7 f3                	div    %ebx
 3a8:	8d 76 01             	lea    0x1(%esi),%esi
  }while((x /= base) != 0);
 3ab:	39 d9                	cmp    %ebx,%ecx
    buf[i++] = digits[x % base];
 3ad:	0f b6 92 50 08 00 00 	movzbl 0x850(%edx),%edx
  }while((x /= base) != 0);
 3b4:	89 c1                	mov    %eax,%ecx
    buf[i++] = digits[x % base];
 3b6:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 3ba:	73 e4                	jae    3a0 <printint+0x40>
  if(neg)
 3bc:	8b 45 c0             	mov    -0x40(%ebp),%eax
 3bf:	85 c0                	test   %eax,%eax
 3c1:	74 07                	je     3ca <printint+0x6a>
    buf[i++] = '-';
 3c3:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 3c8:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
 3ca:	8d 74 3d d8          	lea    -0x28(%ebp,%edi,1),%esi
 3ce:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 3d1:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3df:	00 
    putc(fd, buf[i]);
 3e0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 3e3:	83 ec 04             	sub    $0x4,%esp
  while(--i >= 0)
 3e6:	83 ee 01             	sub    $0x1,%esi
 3e9:	88 45 d7             	mov    %al,-0x29(%ebp)
  write(fd, &c, 1);
 3ec:	8d 45 d7             	lea    -0x29(%ebp),%eax
 3ef:	6a 01                	push   $0x1
 3f1:	50                   	push   %eax
 3f2:	57                   	push   %edi
 3f3:	e8 df fe ff ff       	call   2d7 <write>
  while(--i >= 0)
 3f8:	83 c4 10             	add    $0x10,%esp
 3fb:	39 f3                	cmp    %esi,%ebx
 3fd:	75 e1                	jne    3e0 <printint+0x80>
}
 3ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
 402:	5b                   	pop    %ebx
 403:	5e                   	pop    %esi
 404:	5f                   	pop    %edi
 405:	5d                   	pop    %ebp
 406:	c3                   	ret
 407:	90                   	nop
 408:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 40f:	00 
  neg = 0;
 410:	31 c0                	xor    %eax,%eax
 412:	e9 70 ff ff ff       	jmp    387 <printint+0x27>
 417:	90                   	nop
 418:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 41f:	00 

00000420 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	83 ec 38             	sub    $0x38,%esp
 426:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 429:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 42c:	89 75 f8             	mov    %esi,-0x8(%ebp)
 42f:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 432:	0f b6 03             	movzbl (%ebx),%eax
 435:	84 c0                	test   %al,%al
 437:	0f 84 b6 00 00 00    	je     4f3 <printf+0xd3>
  ap = (uint*)(void*)&fmt + 1;
 43d:	8d 4d 10             	lea    0x10(%ebp),%ecx
 440:	89 7d fc             	mov    %edi,-0x4(%ebp)
 443:	83 c3 01             	add    $0x1,%ebx
 446:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
 449:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 44c:	0f b6 d0             	movzbl %al,%edx
    if(state == 0){
 44f:	eb 2a                	jmp    47b <printf+0x5b>
 451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 458:	83 ec 04             	sub    $0x4,%esp
 45b:	88 45 e7             	mov    %al,-0x19(%ebp)
 45e:	8d 45 e7             	lea    -0x19(%ebp),%eax
  for(i = 0; fmt[i]; i++){
 461:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 464:	6a 01                	push   $0x1
 466:	50                   	push   %eax
 467:	56                   	push   %esi
 468:	e8 6a fe ff ff       	call   2d7 <write>
  for(i = 0; fmt[i]; i++){
 46d:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
 471:	83 c4 10             	add    $0x10,%esp
 474:	84 c0                	test   %al,%al
 476:	74 78                	je     4f0 <printf+0xd0>
    c = fmt[i] & 0xff;
 478:	0f b6 d0             	movzbl %al,%edx
      if(c == '%'){
 47b:	83 fa 25             	cmp    $0x25,%edx
 47e:	75 d8                	jne    458 <printf+0x38>
  for(i = 0; fmt[i]; i++){
 480:	0f b6 13             	movzbl (%ebx),%edx
 483:	84 d2                	test   %dl,%dl
 485:	74 69                	je     4f0 <printf+0xd0>
    c = fmt[i] & 0xff;
 487:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 48a:	80 fa 25             	cmp    $0x25,%dl
 48d:	0f 84 25 01 00 00    	je     5b8 <printf+0x198>
 493:	83 e8 63             	sub    $0x63,%eax
 496:	83 f8 15             	cmp    $0x15,%eax
 499:	77 0d                	ja     4a8 <printf+0x88>
 49b:	ff 24 85 f8 07 00 00 	jmp    *0x7f8(,%eax,4)
 4a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 4a8:	83 ec 04             	sub    $0x4,%esp
 4ab:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 4ae:	88 55 d0             	mov    %dl,-0x30(%ebp)
 4b1:	6a 01                	push   $0x1
 4b3:	51                   	push   %ecx
 4b4:	56                   	push   %esi
 4b5:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 4b8:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4bc:	e8 16 fe ff ff       	call   2d7 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 4c1:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 4c5:	83 c4 0c             	add    $0xc,%esp
 4c8:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 4cb:	6a 01                	push   $0x1
 4cd:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4d0:	51                   	push   %ecx
  for(i = 0; fmt[i]; i++){
 4d1:	83 c3 02             	add    $0x2,%ebx
  write(fd, &c, 1);
 4d4:	56                   	push   %esi
 4d5:	e8 fd fd ff ff       	call   2d7 <write>
  for(i = 0; fmt[i]; i++){
 4da:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
 4de:	83 c4 10             	add    $0x10,%esp
 4e1:	84 c0                	test   %al,%al
 4e3:	75 93                	jne    478 <printf+0x58>
 4e5:	8d 76 00             	lea    0x0(%esi),%esi
 4e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4ef:	00 
 4f0:	8b 7d fc             	mov    -0x4(%ebp),%edi
      }
      state = 0;
    }
  }
}
 4f3:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 4f6:	8b 75 f8             	mov    -0x8(%ebp),%esi
 4f9:	c9                   	leave
 4fa:	c3                   	ret
 4fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 16, 0);
 500:	83 ec 0c             	sub    $0xc,%esp
 503:	8b 17                	mov    (%edi),%edx
 505:	b9 10 00 00 00       	mov    $0x10,%ecx
 50a:	89 f0                	mov    %esi,%eax
 50c:	6a 00                	push   $0x0
 50e:	e8 4d fe ff ff       	call   360 <printint>
  for(i = 0; fmt[i]; i++){
 513:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
 517:	83 c3 02             	add    $0x2,%ebx
 51a:	83 c4 10             	add    $0x10,%esp
 51d:	84 c0                	test   %al,%al
 51f:	74 cf                	je     4f0 <printf+0xd0>
        ap++;
 521:	83 c7 04             	add    $0x4,%edi
 524:	e9 4f ff ff ff       	jmp    478 <printf+0x58>
 529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 530:	83 ec 0c             	sub    $0xc,%esp
 533:	8b 17                	mov    (%edi),%edx
 535:	b9 0a 00 00 00       	mov    $0xa,%ecx
 53a:	89 f0                	mov    %esi,%eax
 53c:	6a 01                	push   $0x1
 53e:	e8 1d fe ff ff       	call   360 <printint>
  for(i = 0; fmt[i]; i++){
 543:	eb ce                	jmp    513 <printf+0xf3>
 545:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 548:	83 ec 04             	sub    $0x4,%esp
 54b:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        putc(fd, *ap);
 54e:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 550:	6a 01                	push   $0x1
 552:	51                   	push   %ecx
 553:	56                   	push   %esi
        putc(fd, *ap);
 554:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 557:	e8 7b fd ff ff       	call   2d7 <write>
 55c:	eb b5                	jmp    513 <printf+0xf3>
 55e:	66 90                	xchg   %ax,%ax
        s = (char*)*ap;
 560:	8b 07                	mov    (%edi),%eax
        ap++;
 562:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 565:	85 c0                	test   %eax,%eax
 567:	74 67                	je     5d0 <printf+0x1b0>
        while(*s != 0){
 569:	0f b6 10             	movzbl (%eax),%edx
 56c:	84 d2                	test   %dl,%dl
 56e:	74 6f                	je     5df <printf+0x1bf>
 570:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 573:	89 c7                	mov    %eax,%edi
 575:	89 d0                	mov    %edx,%eax
 577:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 57a:	89 fb                	mov    %edi,%ebx
 57c:	8d 7d e7             	lea    -0x19(%ebp),%edi
 57f:	90                   	nop
  write(fd, &c, 1);
 580:	83 ec 04             	sub    $0x4,%esp
          s++;
 583:	83 c3 01             	add    $0x1,%ebx
 586:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 589:	6a 01                	push   $0x1
 58b:	57                   	push   %edi
 58c:	56                   	push   %esi
 58d:	e8 45 fd ff ff       	call   2d7 <write>
        while(*s != 0){
 592:	0f b6 03             	movzbl (%ebx),%eax
 595:	83 c4 10             	add    $0x10,%esp
 598:	84 c0                	test   %al,%al
 59a:	75 e4                	jne    580 <printf+0x160>
 59c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
 59f:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
 5a3:	83 c3 02             	add    $0x2,%ebx
 5a6:	84 c0                	test   %al,%al
 5a8:	0f 85 9b fe ff ff    	jne    449 <printf+0x29>
 5ae:	e9 3d ff ff ff       	jmp    4f0 <printf+0xd0>
 5b3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 5b8:	83 ec 04             	sub    $0x4,%esp
 5bb:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5bf:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 5c2:	6a 01                	push   $0x1
 5c4:	e9 07 ff ff ff       	jmp    4d0 <printf+0xb0>
 5c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
          s = "(null)";
 5d0:	89 7d d4             	mov    %edi,-0x2c(%ebp)
        if(s == 0)
 5d3:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 5d8:	bf ef 07 00 00       	mov    $0x7ef,%edi
 5dd:	eb 98                	jmp    577 <printf+0x157>
  for(i = 0; fmt[i]; i++){
 5df:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
 5e3:	83 c3 02             	add    $0x2,%ebx
 5e6:	84 c0                	test   %al,%al
 5e8:	0f 85 8a fe ff ff    	jne    478 <printf+0x58>
 5ee:	e9 fd fe ff ff       	jmp    4f0 <printf+0xd0>
 5f3:	66 90                	xchg   %ax,%ax
 5f5:	66 90                	xchg   %ax,%ax
 5f7:	66 90                	xchg   %ax,%ax
 5f9:	66 90                	xchg   %ax,%ax
 5fb:	66 90                	xchg   %ax,%ax
 5fd:	66 90                	xchg   %ax,%ax
 5ff:	90                   	nop

00000600 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 600:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 601:	a1 44 0b 00 00       	mov    0xb44,%eax
{
 606:	89 e5                	mov    %esp,%ebp
 608:	57                   	push   %edi
 609:	56                   	push   %esi
 60a:	53                   	push   %ebx
 60b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 60e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 611:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 618:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 61f:	00 
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 620:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 622:	39 c8                	cmp    %ecx,%eax
 624:	73 32                	jae    658 <free+0x58>
 626:	39 d1                	cmp    %edx,%ecx
 628:	72 04                	jb     62e <free+0x2e>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 62a:	39 d0                	cmp    %edx,%eax
 62c:	72 32                	jb     660 <free+0x60>
      break;
  if(bp + bp->s.size == p->s.ptr){
 62e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 631:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 634:	39 fa                	cmp    %edi,%edx
 636:	74 30                	je     668 <free+0x68>
 638:	89 53 f8             	mov    %edx,-0x8(%ebx)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 63b:	8b 50 04             	mov    0x4(%eax),%edx
 63e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 641:	39 f1                	cmp    %esi,%ecx
 643:	74 3a                	je     67f <free+0x7f>
 645:	89 08                	mov    %ecx,(%eax)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
}
 647:	5b                   	pop    %ebx
  freep = p;
 648:	a3 44 0b 00 00       	mov    %eax,0xb44
}
 64d:	5e                   	pop    %esi
 64e:	5f                   	pop    %edi
 64f:	5d                   	pop    %ebp
 650:	c3                   	ret
 651:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 658:	39 d0                	cmp    %edx,%eax
 65a:	72 04                	jb     660 <free+0x60>
 65c:	39 d1                	cmp    %edx,%ecx
 65e:	72 ce                	jb     62e <free+0x2e>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 660:	89 d0                	mov    %edx,%eax
 662:	eb bc                	jmp    620 <free+0x20>
 664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 668:	03 72 04             	add    0x4(%edx),%esi
 66b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 66e:	8b 10                	mov    (%eax),%edx
 670:	8b 12                	mov    (%edx),%edx
 672:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 675:	8b 50 04             	mov    0x4(%eax),%edx
 678:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 67b:	39 f1                	cmp    %esi,%ecx
 67d:	75 c6                	jne    645 <free+0x45>
    p->s.size += bp->s.size;
 67f:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 682:	a3 44 0b 00 00       	mov    %eax,0xb44
    p->s.size += bp->s.size;
 687:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 68a:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 68d:	89 08                	mov    %ecx,(%eax)
}
 68f:	5b                   	pop    %ebx
 690:	5e                   	pop    %esi
 691:	5f                   	pop    %edi
 692:	5d                   	pop    %ebp
 693:	c3                   	ret
 694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 698:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 69f:	00 

000006a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6a6:	8b 45 08             	mov    0x8(%ebp),%eax
{
 6a9:	89 7d fc             	mov    %edi,-0x4(%ebp)
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6ac:	8d 78 07             	lea    0x7(%eax),%edi
  if((prevp = freep) == 0){
 6af:	a1 44 0b 00 00       	mov    0xb44,%eax
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6b4:	c1 ef 03             	shr    $0x3,%edi
 6b7:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 6ba:	85 c0                	test   %eax,%eax
 6bc:	0f 84 c6 00 00 00    	je     788 <malloc+0xe8>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6c2:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 6c4:	8b 4a 04             	mov    0x4(%edx),%ecx
 6c7:	39 f9                	cmp    %edi,%ecx
 6c9:	0f 83 87 00 00 00    	jae    756 <malloc+0xb6>
 6cf:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 6d2:	89 75 f8             	mov    %esi,-0x8(%ebp)
  if(nu < 4096)
 6d5:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6da:	39 df                	cmp    %ebx,%edi
 6dc:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 6df:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 6e6:	eb 21                	jmp    709 <malloc+0x69>
 6e8:	eb 16                	jmp    700 <malloc+0x60>
 6ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6f0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 6f7:	00 
 6f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 6ff:	00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 700:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 702:	8b 4a 04             	mov    0x4(%edx),%ecx
 705:	39 f9                	cmp    %edi,%ecx
 707:	73 47                	jae    750 <malloc+0xb0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 709:	89 d0                	mov    %edx,%eax
 70b:	39 15 44 0b 00 00    	cmp    %edx,0xb44
 711:	75 ed                	jne    700 <malloc+0x60>
  p = sbrk(nu * sizeof(Header));
 713:	83 ec 0c             	sub    $0xc,%esp
 716:	56                   	push   %esi
 717:	e8 23 fc ff ff       	call   33f <sbrk>
  if(p == (char*)-1)
 71c:	83 c4 10             	add    $0x10,%esp
 71f:	83 f8 ff             	cmp    $0xffffffff,%eax
 722:	74 54                	je     778 <malloc+0xd8>
  hp->s.size = nu;
 724:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 727:	83 ec 0c             	sub    $0xc,%esp
 72a:	83 c0 08             	add    $0x8,%eax
 72d:	50                   	push   %eax
 72e:	e8 cd fe ff ff       	call   600 <free>
  return freep;
 733:	a1 44 0b 00 00       	mov    0xb44,%eax
      if((p = morecore(nunits)) == 0)
 738:	83 c4 10             	add    $0x10,%esp
 73b:	85 c0                	test   %eax,%eax
 73d:	75 c1                	jne    700 <malloc+0x60>
 73f:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 742:	8b 75 f8             	mov    -0x8(%ebp),%esi
 745:	eb 26                	jmp    76d <malloc+0xcd>
 747:	90                   	nop
 748:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 74f:	00 
 750:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 753:	8b 75 f8             	mov    -0x8(%ebp),%esi
      if(p->s.size == nunits)
 756:	39 cf                	cmp    %ecx,%edi
 758:	74 66                	je     7c0 <malloc+0x120>
        p->s.size -= nunits;
 75a:	29 f9                	sub    %edi,%ecx
 75c:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 75f:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 762:	89 7a 04             	mov    %edi,0x4(%edx)
      freep = prevp;
 765:	a3 44 0b 00 00       	mov    %eax,0xb44
      return (void*)(p + 1);
 76a:	8d 42 08             	lea    0x8(%edx),%eax
        return 0;
  }
}
 76d:	8b 7d fc             	mov    -0x4(%ebp),%edi
 770:	c9                   	leave
 771:	c3                   	ret
 772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        return 0;
 778:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 77b:	8b 75 f8             	mov    -0x8(%ebp),%esi
 77e:	31 c0                	xor    %eax,%eax
}
 780:	8b 7d fc             	mov    -0x4(%ebp),%edi
 783:	c9                   	leave
 784:	c3                   	ret
 785:	8d 76 00             	lea    0x0(%esi),%esi
 788:	89 5d f4             	mov    %ebx,-0xc(%ebp)
    base.s.size = 0;
 78b:	ba 48 0b 00 00       	mov    $0xb48,%edx
 790:	89 75 f8             	mov    %esi,-0x8(%ebp)
    base.s.ptr = freep = prevp = &base;
 793:	c7 05 44 0b 00 00 48 	movl   $0xb48,0xb44
 79a:	0b 00 00 
 79d:	c7 05 48 0b 00 00 48 	movl   $0xb48,0xb48
 7a4:	0b 00 00 
    base.s.size = 0;
 7a7:	c7 05 4c 0b 00 00 00 	movl   $0x0,0xb4c
 7ae:	00 00 00 
    if(p->s.size >= nunits){
 7b1:	e9 1f ff ff ff       	jmp    6d5 <malloc+0x35>
 7b6:	66 90                	xchg   %ax,%ax
 7b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 7bf:	00 
        prevp->s.ptr = p->s.ptr;
 7c0:	8b 0a                	mov    (%edx),%ecx
 7c2:	89 08                	mov    %ecx,(%eax)
 7c4:	eb 9f                	jmp    765 <malloc+0xc5>
