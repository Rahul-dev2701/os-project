
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	be 01 00 00 00       	mov    $0x1,%esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  21:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  24:	83 f8 01             	cmp    $0x1,%eax
  27:	7e 54                	jle    7d <main+0x7d>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	push   (%ebx)
  37:	e8 7b 03 00 00       	call   3b7 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 24                	js     69 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  45:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
  48:	83 c6 01             	add    $0x1,%esi
  4b:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
  4e:	50                   	push   %eax
  4f:	e8 3c 00 00 00       	call   90 <cat>
    close(fd);
  54:	89 3c 24             	mov    %edi,(%esp)
  57:	e8 43 03 00 00       	call   39f <close>
  for(i = 1; i < argc; i++){
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  62:	75 cc                	jne    30 <main+0x30>
  }
  exit();
  64:	e8 0e 03 00 00       	call   377 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
  69:	50                   	push   %eax
  6a:	ff 33                	push   (%ebx)
  6c:	68 ab 08 00 00       	push   $0x8ab
  71:	6a 01                	push   $0x1
  73:	e8 68 04 00 00       	call   4e0 <printf>
      exit();
  78:	e8 fa 02 00 00       	call   377 <exit>
    cat(0);
  7d:	83 ec 0c             	sub    $0xc,%esp
  80:	6a 00                	push   $0x0
  82:	e8 09 00 00 00       	call   90 <cat>
    exit();
  87:	e8 eb 02 00 00       	call   377 <exit>
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <cat>:
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
  94:	53                   	push   %ebx
  95:	8b 75 08             	mov    0x8(%ebp),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  98:	eb 1d                	jmp    b7 <cat+0x27>
  9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	53                   	push   %ebx
  a4:	68 60 0c 00 00       	push   $0xc60
  a9:	6a 01                	push   $0x1
  ab:	e8 e7 02 00 00       	call   397 <write>
  b0:	83 c4 10             	add    $0x10,%esp
  b3:	39 d8                	cmp    %ebx,%eax
  b5:	75 25                	jne    dc <cat+0x4c>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  b7:	83 ec 04             	sub    $0x4,%esp
  ba:	68 00 02 00 00       	push   $0x200
  bf:	68 60 0c 00 00       	push   $0xc60
  c4:	56                   	push   %esi
  c5:	e8 c5 02 00 00       	call   38f <read>
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	89 c3                	mov    %eax,%ebx
  cf:	85 c0                	test   %eax,%eax
  d1:	7f cd                	jg     a0 <cat+0x10>
  if(n < 0){
  d3:	75 1b                	jne    f0 <cat+0x60>
}
  d5:	8d 65 f8             	lea    -0x8(%ebp),%esp
  d8:	5b                   	pop    %ebx
  d9:	5e                   	pop    %esi
  da:	5d                   	pop    %ebp
  db:	c3                   	ret
      printf(1, "cat: write error\n");
  dc:	83 ec 08             	sub    $0x8,%esp
  df:	68 88 08 00 00       	push   $0x888
  e4:	6a 01                	push   $0x1
  e6:	e8 f5 03 00 00       	call   4e0 <printf>
      exit();
  eb:	e8 87 02 00 00       	call   377 <exit>
    printf(1, "cat: read error\n");
  f0:	50                   	push   %eax
  f1:	50                   	push   %eax
  f2:	68 9a 08 00 00       	push   $0x89a
  f7:	6a 01                	push   $0x1
  f9:	e8 e2 03 00 00       	call   4e0 <printf>
    exit();
  fe:	e8 74 02 00 00       	call   377 <exit>
 103:	66 90                	xchg   %ax,%ax
 105:	66 90                	xchg   %ax,%ax
 107:	66 90                	xchg   %ax,%ax
 109:	66 90                	xchg   %ax,%ax
 10b:	66 90                	xchg   %ax,%ax
 10d:	66 90                	xchg   %ax,%ax
 10f:	66 90                	xchg   %ax,%ax
 111:	66 90                	xchg   %ax,%ax
 113:	66 90                	xchg   %ax,%ax
 115:	66 90                	xchg   %ax,%ax
 117:	66 90                	xchg   %ax,%ax
 119:	66 90                	xchg   %ax,%ax
 11b:	66 90                	xchg   %ax,%ax
 11d:	66 90                	xchg   %ax,%ax
 11f:	90                   	nop

00000120 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 120:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 121:	31 c0                	xor    %eax,%eax
{
 123:	89 e5                	mov    %esp,%ebp
 125:	53                   	push   %ebx
 126:	8b 4d 08             	mov    0x8(%ebp),%ecx
 129:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 130:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 134:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 137:	83 c0 01             	add    $0x1,%eax
 13a:	84 d2                	test   %dl,%dl
 13c:	75 f2                	jne    130 <strcpy+0x10>
    ;
  return os;
}
 13e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 141:	89 c8                	mov    %ecx,%eax
 143:	c9                   	leave
 144:	c3                   	ret
 145:	8d 76 00             	lea    0x0(%esi),%esi
 148:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 14f:	00 

00000150 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	53                   	push   %ebx
 154:	8b 55 08             	mov    0x8(%ebp),%edx
 157:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 15a:	0f b6 02             	movzbl (%edx),%eax
 15d:	84 c0                	test   %al,%al
 15f:	75 2d                	jne    18e <strcmp+0x3e>
 161:	eb 3d                	jmp    1a0 <strcmp+0x50>
 163:	eb 1b                	jmp    180 <strcmp+0x30>
 165:	8d 76 00             	lea    0x0(%esi),%esi
 168:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 16f:	00 
 170:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 177:	00 
 178:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 17f:	00 
 180:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 184:	83 c2 01             	add    $0x1,%edx
 187:	83 c1 01             	add    $0x1,%ecx
  while(*p && *p == *q)
 18a:	84 c0                	test   %al,%al
 18c:	74 12                	je     1a0 <strcmp+0x50>
 18e:	0f b6 19             	movzbl (%ecx),%ebx
 191:	38 c3                	cmp    %al,%bl
 193:	74 eb                	je     180 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
 195:	29 d8                	sub    %ebx,%eax
}
 197:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 19a:	c9                   	leave
 19b:	c3                   	ret
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return (uchar)*p - (uchar)*q;
 1a0:	0f b6 19             	movzbl (%ecx),%ebx
 1a3:	31 c0                	xor    %eax,%eax
 1a5:	29 d8                	sub    %ebx,%eax
}
 1a7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1aa:	c9                   	leave
 1ab:	c3                   	ret
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001b0 <strlen>:

uint
strlen(const char *s)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1b6:	80 3a 00             	cmpb   $0x0,(%edx)
 1b9:	74 15                	je     1d0 <strlen+0x20>
 1bb:	31 c0                	xor    %eax,%eax
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
 1c0:	83 c0 01             	add    $0x1,%eax
 1c3:	89 c1                	mov    %eax,%ecx
 1c5:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1c9:	75 f5                	jne    1c0 <strlen+0x10>
    ;
  return n;
}
 1cb:	89 c8                	mov    %ecx,%eax
 1cd:	5d                   	pop    %ebp
 1ce:	c3                   	ret
 1cf:	90                   	nop
  for(n = 0; s[n]; n++)
 1d0:	31 c9                	xor    %ecx,%ecx
}
 1d2:	5d                   	pop    %ebp
 1d3:	89 c8                	mov    %ecx,%eax
 1d5:	c3                   	ret
 1d6:	66 90                	xchg   %ax,%ax
 1d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1df:	00 

000001e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1e4:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1e7:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ea:	8b 7d 08             	mov    0x8(%ebp),%edi
 1ed:	fc                   	cld
 1ee:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1f0:	8b 45 08             	mov    0x8(%ebp),%eax
 1f3:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1f6:	c9                   	leave
 1f7:	c3                   	ret
 1f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1ff:	00 

00000200 <strchr>:

char*
strchr(const char *s, char c)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 45 08             	mov    0x8(%ebp),%eax
 206:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 20a:	0f b6 10             	movzbl (%eax),%edx
 20d:	84 d2                	test   %dl,%dl
 20f:	75 1a                	jne    22b <strchr+0x2b>
 211:	eb 25                	jmp    238 <strchr+0x38>
 213:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 218:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 21f:	00 
 220:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 224:	83 c0 01             	add    $0x1,%eax
 227:	84 d2                	test   %dl,%dl
 229:	74 0d                	je     238 <strchr+0x38>
    if(*s == c)
 22b:	38 d1                	cmp    %dl,%cl
 22d:	75 f1                	jne    220 <strchr+0x20>
      return (char*)s;
  return 0;
}
 22f:	5d                   	pop    %ebp
 230:	c3                   	ret
 231:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 238:	31 c0                	xor    %eax,%eax
}
 23a:	5d                   	pop    %ebp
 23b:	c3                   	ret
 23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000240 <gets>:

char*
gets(char *buf, int max)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 245:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 248:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 249:	31 db                	xor    %ebx,%ebx
{
 24b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 24e:	eb 27                	jmp    277 <gets+0x37>
    cc = read(0, &c, 1);
 250:	83 ec 04             	sub    $0x4,%esp
 253:	6a 01                	push   $0x1
 255:	57                   	push   %edi
 256:	6a 00                	push   $0x0
 258:	e8 32 01 00 00       	call   38f <read>
    if(cc < 1)
 25d:	83 c4 10             	add    $0x10,%esp
 260:	85 c0                	test   %eax,%eax
 262:	7e 1d                	jle    281 <gets+0x41>
      break;
    buf[i++] = c;
 264:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 268:	8b 55 08             	mov    0x8(%ebp),%edx
 26b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 26f:	3c 0a                	cmp    $0xa,%al
 271:	74 1d                	je     290 <gets+0x50>
 273:	3c 0d                	cmp    $0xd,%al
 275:	74 19                	je     290 <gets+0x50>
  for(i=0; i+1 < max; ){
 277:	89 de                	mov    %ebx,%esi
 279:	83 c3 01             	add    $0x1,%ebx
 27c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 27f:	7c cf                	jl     250 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 281:	8b 45 08             	mov    0x8(%ebp),%eax
 284:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 288:	8d 65 f4             	lea    -0xc(%ebp),%esp
 28b:	5b                   	pop    %ebx
 28c:	5e                   	pop    %esi
 28d:	5f                   	pop    %edi
 28e:	5d                   	pop    %ebp
 28f:	c3                   	ret
  buf[i] = '\0';
 290:	8b 45 08             	mov    0x8(%ebp),%eax
    buf[i++] = c;
 293:	89 de                	mov    %ebx,%esi
  buf[i] = '\0';
 295:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 299:	8d 65 f4             	lea    -0xc(%ebp),%esp
 29c:	5b                   	pop    %ebx
 29d:	5e                   	pop    %esi
 29e:	5f                   	pop    %edi
 29f:	5d                   	pop    %ebp
 2a0:	c3                   	ret
 2a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2af:	00 

000002b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b6:	6a 00                	push   $0x0
 2b8:	ff 75 08             	push   0x8(%ebp)
{
 2bb:	89 75 fc             	mov    %esi,-0x4(%ebp)
  fd = open(n, O_RDONLY);
 2be:	e8 f4 00 00 00       	call   3b7 <open>
  if(fd < 0)
 2c3:	83 c4 10             	add    $0x10,%esp
 2c6:	85 c0                	test   %eax,%eax
 2c8:	78 2e                	js     2f8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 2ca:	83 ec 08             	sub    $0x8,%esp
 2cd:	ff 75 0c             	push   0xc(%ebp)
 2d0:	50                   	push   %eax
 2d1:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 2d4:	89 c3                	mov    %eax,%ebx
 2d6:	e8 f4 00 00 00       	call   3cf <fstat>
  close(fd);
 2db:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2de:	89 c6                	mov    %eax,%esi
  close(fd);
 2e0:	e8 ba 00 00 00       	call   39f <close>
  return r;
 2e5:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 2e8:	83 c4 10             	add    $0x10,%esp
}
 2eb:	89 f0                	mov    %esi,%eax
 2ed:	8b 75 fc             	mov    -0x4(%ebp),%esi
 2f0:	c9                   	leave
 2f1:	c3                   	ret
 2f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
 2f8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2fd:	eb ec                	jmp    2eb <stat+0x3b>
 2ff:	90                   	nop

00000300 <atoi>:

int
atoi(const char *s)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	53                   	push   %ebx
 304:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 307:	0f be 02             	movsbl (%edx),%eax
 30a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 30d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 310:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 315:	77 1e                	ja     335 <atoi+0x35>
 317:	90                   	nop
 318:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 31f:	00 
    n = n*10 + *s++ - '0';
 320:	83 c2 01             	add    $0x1,%edx
 323:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 326:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 32a:	0f be 02             	movsbl (%edx),%eax
 32d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 330:	80 fb 09             	cmp    $0x9,%bl
 333:	76 eb                	jbe    320 <atoi+0x20>
  return n;
}
 335:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 338:	89 c8                	mov    %ecx,%eax
 33a:	c9                   	leave
 33b:	c3                   	ret
 33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000340 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	83 ec 08             	sub    $0x8,%esp
 346:	8b 45 10             	mov    0x10(%ebp),%eax
 349:	8b 55 08             	mov    0x8(%ebp),%edx
 34c:	89 75 f8             	mov    %esi,-0x8(%ebp)
 34f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 352:	85 c0                	test   %eax,%eax
 354:	7e 12                	jle    368 <memmove+0x28>
 356:	89 7d fc             	mov    %edi,-0x4(%ebp)
 359:	01 d0                	add    %edx,%eax
  dst = vdst;
 35b:	89 d7                	mov    %edx,%edi
 35d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 360:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 361:	39 f8                	cmp    %edi,%eax
 363:	75 fb                	jne    360 <memmove+0x20>
 365:	8b 7d fc             	mov    -0x4(%ebp),%edi
  return vdst;
}
 368:	8b 75 f8             	mov    -0x8(%ebp),%esi
 36b:	89 d0                	mov    %edx,%eax
 36d:	c9                   	leave
 36e:	c3                   	ret

0000036f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 36f:	b8 01 00 00 00       	mov    $0x1,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret

00000377 <exit>:
SYSCALL(exit)
 377:	b8 02 00 00 00       	mov    $0x2,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret

0000037f <wait>:
SYSCALL(wait)
 37f:	b8 03 00 00 00       	mov    $0x3,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret

00000387 <pipe>:
SYSCALL(pipe)
 387:	b8 04 00 00 00       	mov    $0x4,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret

0000038f <read>:
SYSCALL(read)
 38f:	b8 05 00 00 00       	mov    $0x5,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret

00000397 <write>:
SYSCALL(write)
 397:	b8 10 00 00 00       	mov    $0x10,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret

0000039f <close>:
SYSCALL(close)
 39f:	b8 15 00 00 00       	mov    $0x15,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret

000003a7 <kill>:
SYSCALL(kill)
 3a7:	b8 06 00 00 00       	mov    $0x6,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret

000003af <exec>:
SYSCALL(exec)
 3af:	b8 07 00 00 00       	mov    $0x7,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret

000003b7 <open>:
SYSCALL(open)
 3b7:	b8 0f 00 00 00       	mov    $0xf,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret

000003bf <mknod>:
SYSCALL(mknod)
 3bf:	b8 11 00 00 00       	mov    $0x11,%eax
 3c4:	cd 40                	int    $0x40
 3c6:	c3                   	ret

000003c7 <unlink>:
SYSCALL(unlink)
 3c7:	b8 12 00 00 00       	mov    $0x12,%eax
 3cc:	cd 40                	int    $0x40
 3ce:	c3                   	ret

000003cf <fstat>:
SYSCALL(fstat)
 3cf:	b8 08 00 00 00       	mov    $0x8,%eax
 3d4:	cd 40                	int    $0x40
 3d6:	c3                   	ret

000003d7 <link>:
SYSCALL(link)
 3d7:	b8 13 00 00 00       	mov    $0x13,%eax
 3dc:	cd 40                	int    $0x40
 3de:	c3                   	ret

000003df <mkdir>:
SYSCALL(mkdir)
 3df:	b8 14 00 00 00       	mov    $0x14,%eax
 3e4:	cd 40                	int    $0x40
 3e6:	c3                   	ret

000003e7 <chdir>:
SYSCALL(chdir)
 3e7:	b8 09 00 00 00       	mov    $0x9,%eax
 3ec:	cd 40                	int    $0x40
 3ee:	c3                   	ret

000003ef <dup>:
SYSCALL(dup)
 3ef:	b8 0a 00 00 00       	mov    $0xa,%eax
 3f4:	cd 40                	int    $0x40
 3f6:	c3                   	ret

000003f7 <getpid>:
SYSCALL(getpid)
 3f7:	b8 0b 00 00 00       	mov    $0xb,%eax
 3fc:	cd 40                	int    $0x40
 3fe:	c3                   	ret

000003ff <sbrk>:
SYSCALL(sbrk)
 3ff:	b8 0c 00 00 00       	mov    $0xc,%eax
 404:	cd 40                	int    $0x40
 406:	c3                   	ret

00000407 <sleep>:
SYSCALL(sleep)
 407:	b8 0d 00 00 00       	mov    $0xd,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret

0000040f <uptime>:
SYSCALL(uptime)
 40f:	b8 0e 00 00 00       	mov    $0xe,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret
 417:	66 90                	xchg   %ax,%ax
 419:	66 90                	xchg   %ax,%ax
 41b:	66 90                	xchg   %ax,%ax
 41d:	66 90                	xchg   %ax,%ax
 41f:	90                   	nop

00000420 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	53                   	push   %ebx
 426:	89 cb                	mov    %ecx,%ebx
 428:	83 ec 3c             	sub    $0x3c,%esp
 42b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 42e:	85 d2                	test   %edx,%edx
 430:	0f 89 9a 00 00 00    	jns    4d0 <printint+0xb0>
 436:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 43a:	0f 84 90 00 00 00    	je     4d0 <printint+0xb0>
    neg = 1;
    x = -xx;
 440:	f7 da                	neg    %edx
    neg = 1;
 442:	b8 01 00 00 00       	mov    $0x1,%eax
 447:	89 45 c0             	mov    %eax,-0x40(%ebp)
 44a:	89 d1                	mov    %edx,%ecx
  } else {
    x = xx;
  }

  i = 0;
 44c:	31 f6                	xor    %esi,%esi
 44e:	66 90                	xchg   %ax,%ax
 450:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 457:	00 
 458:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 45f:	00 
  do{
    buf[i++] = digits[x % base];
 460:	89 c8                	mov    %ecx,%eax
 462:	31 d2                	xor    %edx,%edx
 464:	89 f7                	mov    %esi,%edi
 466:	f7 f3                	div    %ebx
 468:	8d 76 01             	lea    0x1(%esi),%esi
  }while((x /= base) != 0);
 46b:	39 d9                	cmp    %ebx,%ecx
    buf[i++] = digits[x % base];
 46d:	0f b6 92 20 09 00 00 	movzbl 0x920(%edx),%edx
  }while((x /= base) != 0);
 474:	89 c1                	mov    %eax,%ecx
    buf[i++] = digits[x % base];
 476:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 47a:	73 e4                	jae    460 <printint+0x40>
  if(neg)
 47c:	8b 45 c0             	mov    -0x40(%ebp),%eax
 47f:	85 c0                	test   %eax,%eax
 481:	74 07                	je     48a <printint+0x6a>
    buf[i++] = '-';
 483:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 488:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
 48a:	8d 74 3d d8          	lea    -0x28(%ebp,%edi,1),%esi
 48e:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 491:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 498:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 49f:	00 
    putc(fd, buf[i]);
 4a0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 4a3:	83 ec 04             	sub    $0x4,%esp
  while(--i >= 0)
 4a6:	83 ee 01             	sub    $0x1,%esi
 4a9:	88 45 d7             	mov    %al,-0x29(%ebp)
  write(fd, &c, 1);
 4ac:	8d 45 d7             	lea    -0x29(%ebp),%eax
 4af:	6a 01                	push   $0x1
 4b1:	50                   	push   %eax
 4b2:	57                   	push   %edi
 4b3:	e8 df fe ff ff       	call   397 <write>
  while(--i >= 0)
 4b8:	83 c4 10             	add    $0x10,%esp
 4bb:	39 f3                	cmp    %esi,%ebx
 4bd:	75 e1                	jne    4a0 <printint+0x80>
}
 4bf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4c2:	5b                   	pop    %ebx
 4c3:	5e                   	pop    %esi
 4c4:	5f                   	pop    %edi
 4c5:	5d                   	pop    %ebp
 4c6:	c3                   	ret
 4c7:	90                   	nop
 4c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4cf:	00 
  neg = 0;
 4d0:	31 c0                	xor    %eax,%eax
 4d2:	e9 70 ff ff ff       	jmp    447 <printint+0x27>
 4d7:	90                   	nop
 4d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4df:	00 

000004e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	83 ec 38             	sub    $0x38,%esp
 4e6:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 4ec:	89 75 f8             	mov    %esi,-0x8(%ebp)
 4ef:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 4f2:	0f b6 03             	movzbl (%ebx),%eax
 4f5:	84 c0                	test   %al,%al
 4f7:	0f 84 b6 00 00 00    	je     5b3 <printf+0xd3>
  ap = (uint*)(void*)&fmt + 1;
 4fd:	8d 4d 10             	lea    0x10(%ebp),%ecx
 500:	89 7d fc             	mov    %edi,-0x4(%ebp)
 503:	83 c3 01             	add    $0x1,%ebx
 506:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
 509:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 50c:	0f b6 d0             	movzbl %al,%edx
    if(state == 0){
 50f:	eb 2a                	jmp    53b <printf+0x5b>
 511:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 518:	83 ec 04             	sub    $0x4,%esp
 51b:	88 45 e7             	mov    %al,-0x19(%ebp)
 51e:	8d 45 e7             	lea    -0x19(%ebp),%eax
  for(i = 0; fmt[i]; i++){
 521:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 524:	6a 01                	push   $0x1
 526:	50                   	push   %eax
 527:	56                   	push   %esi
 528:	e8 6a fe ff ff       	call   397 <write>
  for(i = 0; fmt[i]; i++){
 52d:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
 531:	83 c4 10             	add    $0x10,%esp
 534:	84 c0                	test   %al,%al
 536:	74 78                	je     5b0 <printf+0xd0>
    c = fmt[i] & 0xff;
 538:	0f b6 d0             	movzbl %al,%edx
      if(c == '%'){
 53b:	83 fa 25             	cmp    $0x25,%edx
 53e:	75 d8                	jne    518 <printf+0x38>
  for(i = 0; fmt[i]; i++){
 540:	0f b6 13             	movzbl (%ebx),%edx
 543:	84 d2                	test   %dl,%dl
 545:	74 69                	je     5b0 <printf+0xd0>
    c = fmt[i] & 0xff;
 547:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 54a:	80 fa 25             	cmp    $0x25,%dl
 54d:	0f 84 25 01 00 00    	je     678 <printf+0x198>
 553:	83 e8 63             	sub    $0x63,%eax
 556:	83 f8 15             	cmp    $0x15,%eax
 559:	77 0d                	ja     568 <printf+0x88>
 55b:	ff 24 85 c8 08 00 00 	jmp    *0x8c8(,%eax,4)
 562:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 568:	83 ec 04             	sub    $0x4,%esp
 56b:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 56e:	88 55 d0             	mov    %dl,-0x30(%ebp)
 571:	6a 01                	push   $0x1
 573:	51                   	push   %ecx
 574:	56                   	push   %esi
 575:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 578:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 57c:	e8 16 fe ff ff       	call   397 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 581:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 585:	83 c4 0c             	add    $0xc,%esp
 588:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 58b:	6a 01                	push   $0x1
 58d:	88 55 e7             	mov    %dl,-0x19(%ebp)
 590:	51                   	push   %ecx
  for(i = 0; fmt[i]; i++){
 591:	83 c3 02             	add    $0x2,%ebx
  write(fd, &c, 1);
 594:	56                   	push   %esi
 595:	e8 fd fd ff ff       	call   397 <write>
  for(i = 0; fmt[i]; i++){
 59a:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
 59e:	83 c4 10             	add    $0x10,%esp
 5a1:	84 c0                	test   %al,%al
 5a3:	75 93                	jne    538 <printf+0x58>
 5a5:	8d 76 00             	lea    0x0(%esi),%esi
 5a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5af:	00 
 5b0:	8b 7d fc             	mov    -0x4(%ebp),%edi
      }
      state = 0;
    }
  }
}
 5b3:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 5b6:	8b 75 f8             	mov    -0x8(%ebp),%esi
 5b9:	c9                   	leave
 5ba:	c3                   	ret
 5bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 16, 0);
 5c0:	83 ec 0c             	sub    $0xc,%esp
 5c3:	8b 17                	mov    (%edi),%edx
 5c5:	b9 10 00 00 00       	mov    $0x10,%ecx
 5ca:	89 f0                	mov    %esi,%eax
 5cc:	6a 00                	push   $0x0
 5ce:	e8 4d fe ff ff       	call   420 <printint>
  for(i = 0; fmt[i]; i++){
 5d3:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
 5d7:	83 c3 02             	add    $0x2,%ebx
 5da:	83 c4 10             	add    $0x10,%esp
 5dd:	84 c0                	test   %al,%al
 5df:	74 cf                	je     5b0 <printf+0xd0>
        ap++;
 5e1:	83 c7 04             	add    $0x4,%edi
 5e4:	e9 4f ff ff ff       	jmp    538 <printf+0x58>
 5e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 5f0:	83 ec 0c             	sub    $0xc,%esp
 5f3:	8b 17                	mov    (%edi),%edx
 5f5:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5fa:	89 f0                	mov    %esi,%eax
 5fc:	6a 01                	push   $0x1
 5fe:	e8 1d fe ff ff       	call   420 <printint>
  for(i = 0; fmt[i]; i++){
 603:	eb ce                	jmp    5d3 <printf+0xf3>
 605:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 608:	83 ec 04             	sub    $0x4,%esp
 60b:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        putc(fd, *ap);
 60e:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 610:	6a 01                	push   $0x1
 612:	51                   	push   %ecx
 613:	56                   	push   %esi
        putc(fd, *ap);
 614:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 617:	e8 7b fd ff ff       	call   397 <write>
 61c:	eb b5                	jmp    5d3 <printf+0xf3>
 61e:	66 90                	xchg   %ax,%ax
        s = (char*)*ap;
 620:	8b 07                	mov    (%edi),%eax
        ap++;
 622:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 625:	85 c0                	test   %eax,%eax
 627:	74 67                	je     690 <printf+0x1b0>
        while(*s != 0){
 629:	0f b6 10             	movzbl (%eax),%edx
 62c:	84 d2                	test   %dl,%dl
 62e:	74 6f                	je     69f <printf+0x1bf>
 630:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 633:	89 c7                	mov    %eax,%edi
 635:	89 d0                	mov    %edx,%eax
 637:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 63a:	89 fb                	mov    %edi,%ebx
 63c:	8d 7d e7             	lea    -0x19(%ebp),%edi
 63f:	90                   	nop
  write(fd, &c, 1);
 640:	83 ec 04             	sub    $0x4,%esp
          s++;
 643:	83 c3 01             	add    $0x1,%ebx
 646:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 649:	6a 01                	push   $0x1
 64b:	57                   	push   %edi
 64c:	56                   	push   %esi
 64d:	e8 45 fd ff ff       	call   397 <write>
        while(*s != 0){
 652:	0f b6 03             	movzbl (%ebx),%eax
 655:	83 c4 10             	add    $0x10,%esp
 658:	84 c0                	test   %al,%al
 65a:	75 e4                	jne    640 <printf+0x160>
 65c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
 65f:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
 663:	83 c3 02             	add    $0x2,%ebx
 666:	84 c0                	test   %al,%al
 668:	0f 85 9b fe ff ff    	jne    509 <printf+0x29>
 66e:	e9 3d ff ff ff       	jmp    5b0 <printf+0xd0>
 673:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 678:	83 ec 04             	sub    $0x4,%esp
 67b:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 67f:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 682:	6a 01                	push   $0x1
 684:	e9 07 ff ff ff       	jmp    590 <printf+0xb0>
 689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
          s = "(null)";
 690:	89 7d d4             	mov    %edi,-0x2c(%ebp)
        if(s == 0)
 693:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 698:	bf c0 08 00 00       	mov    $0x8c0,%edi
 69d:	eb 98                	jmp    637 <printf+0x157>
  for(i = 0; fmt[i]; i++){
 69f:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
 6a3:	83 c3 02             	add    $0x2,%ebx
 6a6:	84 c0                	test   %al,%al
 6a8:	0f 85 8a fe ff ff    	jne    538 <printf+0x58>
 6ae:	e9 fd fe ff ff       	jmp    5b0 <printf+0xd0>
 6b3:	66 90                	xchg   %ax,%ax
 6b5:	66 90                	xchg   %ax,%ax
 6b7:	66 90                	xchg   %ax,%ax
 6b9:	66 90                	xchg   %ax,%ax
 6bb:	66 90                	xchg   %ax,%ax
 6bd:	66 90                	xchg   %ax,%ax
 6bf:	90                   	nop

000006c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c1:	a1 60 0e 00 00       	mov    0xe60,%eax
{
 6c6:	89 e5                	mov    %esp,%ebp
 6c8:	57                   	push   %edi
 6c9:	56                   	push   %esi
 6ca:	53                   	push   %ebx
 6cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 6df:	00 
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e0:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e2:	39 c8                	cmp    %ecx,%eax
 6e4:	73 32                	jae    718 <free+0x58>
 6e6:	39 d1                	cmp    %edx,%ecx
 6e8:	72 04                	jb     6ee <free+0x2e>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ea:	39 d0                	cmp    %edx,%eax
 6ec:	72 32                	jb     720 <free+0x60>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6ee:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6f1:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6f4:	39 fa                	cmp    %edi,%edx
 6f6:	74 30                	je     728 <free+0x68>
 6f8:	89 53 f8             	mov    %edx,-0x8(%ebx)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6fb:	8b 50 04             	mov    0x4(%eax),%edx
 6fe:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 701:	39 f1                	cmp    %esi,%ecx
 703:	74 3a                	je     73f <free+0x7f>
 705:	89 08                	mov    %ecx,(%eax)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
}
 707:	5b                   	pop    %ebx
  freep = p;
 708:	a3 60 0e 00 00       	mov    %eax,0xe60
}
 70d:	5e                   	pop    %esi
 70e:	5f                   	pop    %edi
 70f:	5d                   	pop    %ebp
 710:	c3                   	ret
 711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 718:	39 d0                	cmp    %edx,%eax
 71a:	72 04                	jb     720 <free+0x60>
 71c:	39 d1                	cmp    %edx,%ecx
 71e:	72 ce                	jb     6ee <free+0x2e>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 720:	89 d0                	mov    %edx,%eax
 722:	eb bc                	jmp    6e0 <free+0x20>
 724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 728:	03 72 04             	add    0x4(%edx),%esi
 72b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 72e:	8b 10                	mov    (%eax),%edx
 730:	8b 12                	mov    (%edx),%edx
 732:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 735:	8b 50 04             	mov    0x4(%eax),%edx
 738:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 73b:	39 f1                	cmp    %esi,%ecx
 73d:	75 c6                	jne    705 <free+0x45>
    p->s.size += bp->s.size;
 73f:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 742:	a3 60 0e 00 00       	mov    %eax,0xe60
    p->s.size += bp->s.size;
 747:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 74a:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 74d:	89 08                	mov    %ecx,(%eax)
}
 74f:	5b                   	pop    %ebx
 750:	5e                   	pop    %esi
 751:	5f                   	pop    %edi
 752:	5d                   	pop    %ebp
 753:	c3                   	ret
 754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 758:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 75f:	00 

00000760 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 766:	8b 45 08             	mov    0x8(%ebp),%eax
{
 769:	89 7d fc             	mov    %edi,-0x4(%ebp)
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 76c:	8d 78 07             	lea    0x7(%eax),%edi
  if((prevp = freep) == 0){
 76f:	a1 60 0e 00 00       	mov    0xe60,%eax
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 774:	c1 ef 03             	shr    $0x3,%edi
 777:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 77a:	85 c0                	test   %eax,%eax
 77c:	0f 84 c6 00 00 00    	je     848 <malloc+0xe8>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 782:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 784:	8b 4a 04             	mov    0x4(%edx),%ecx
 787:	39 f9                	cmp    %edi,%ecx
 789:	0f 83 87 00 00 00    	jae    816 <malloc+0xb6>
 78f:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 792:	89 75 f8             	mov    %esi,-0x8(%ebp)
  if(nu < 4096)
 795:	bb 00 10 00 00       	mov    $0x1000,%ebx
 79a:	39 df                	cmp    %ebx,%edi
 79c:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 79f:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7a6:	eb 21                	jmp    7c9 <malloc+0x69>
 7a8:	eb 16                	jmp    7c0 <malloc+0x60>
 7aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 7b0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 7b7:	00 
 7b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 7bf:	00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 7c2:	8b 4a 04             	mov    0x4(%edx),%ecx
 7c5:	39 f9                	cmp    %edi,%ecx
 7c7:	73 47                	jae    810 <malloc+0xb0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7c9:	89 d0                	mov    %edx,%eax
 7cb:	39 15 60 0e 00 00    	cmp    %edx,0xe60
 7d1:	75 ed                	jne    7c0 <malloc+0x60>
  p = sbrk(nu * sizeof(Header));
 7d3:	83 ec 0c             	sub    $0xc,%esp
 7d6:	56                   	push   %esi
 7d7:	e8 23 fc ff ff       	call   3ff <sbrk>
  if(p == (char*)-1)
 7dc:	83 c4 10             	add    $0x10,%esp
 7df:	83 f8 ff             	cmp    $0xffffffff,%eax
 7e2:	74 54                	je     838 <malloc+0xd8>
  hp->s.size = nu;
 7e4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7e7:	83 ec 0c             	sub    $0xc,%esp
 7ea:	83 c0 08             	add    $0x8,%eax
 7ed:	50                   	push   %eax
 7ee:	e8 cd fe ff ff       	call   6c0 <free>
  return freep;
 7f3:	a1 60 0e 00 00       	mov    0xe60,%eax
      if((p = morecore(nunits)) == 0)
 7f8:	83 c4 10             	add    $0x10,%esp
 7fb:	85 c0                	test   %eax,%eax
 7fd:	75 c1                	jne    7c0 <malloc+0x60>
 7ff:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 802:	8b 75 f8             	mov    -0x8(%ebp),%esi
 805:	eb 26                	jmp    82d <malloc+0xcd>
 807:	90                   	nop
 808:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 80f:	00 
 810:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 813:	8b 75 f8             	mov    -0x8(%ebp),%esi
      if(p->s.size == nunits)
 816:	39 cf                	cmp    %ecx,%edi
 818:	74 66                	je     880 <malloc+0x120>
        p->s.size -= nunits;
 81a:	29 f9                	sub    %edi,%ecx
 81c:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 81f:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 822:	89 7a 04             	mov    %edi,0x4(%edx)
      freep = prevp;
 825:	a3 60 0e 00 00       	mov    %eax,0xe60
      return (void*)(p + 1);
 82a:	8d 42 08             	lea    0x8(%edx),%eax
        return 0;
  }
}
 82d:	8b 7d fc             	mov    -0x4(%ebp),%edi
 830:	c9                   	leave
 831:	c3                   	ret
 832:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        return 0;
 838:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 83b:	8b 75 f8             	mov    -0x8(%ebp),%esi
 83e:	31 c0                	xor    %eax,%eax
}
 840:	8b 7d fc             	mov    -0x4(%ebp),%edi
 843:	c9                   	leave
 844:	c3                   	ret
 845:	8d 76 00             	lea    0x0(%esi),%esi
 848:	89 5d f4             	mov    %ebx,-0xc(%ebp)
    base.s.size = 0;
 84b:	ba 64 0e 00 00       	mov    $0xe64,%edx
 850:	89 75 f8             	mov    %esi,-0x8(%ebp)
    base.s.ptr = freep = prevp = &base;
 853:	c7 05 60 0e 00 00 64 	movl   $0xe64,0xe60
 85a:	0e 00 00 
 85d:	c7 05 64 0e 00 00 64 	movl   $0xe64,0xe64
 864:	0e 00 00 
    base.s.size = 0;
 867:	c7 05 68 0e 00 00 00 	movl   $0x0,0xe68
 86e:	00 00 00 
    if(p->s.size >= nunits){
 871:	e9 1f ff ff ff       	jmp    795 <malloc+0x35>
 876:	66 90                	xchg   %ax,%ax
 878:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 87f:	00 
        prevp->s.ptr = p->s.ptr;
 880:	8b 0a                	mov    (%edx),%ecx
 882:	89 08                	mov    %ecx,(%eax)
 884:	eb 9f                	jmp    825 <malloc+0xc5>
