
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
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
   e:	bf 01 00 00 00       	mov    $0x1,%edi
  13:	56                   	push   %esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 71 04             	mov    0x4(%ecx),%esi
  1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;

  if(argc <= 1){
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	7e 58                	jle    7e <main+0x7e>
  26:	66 90                	xchg   %ax,%ax
  28:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  2f:	00 
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 34 be             	push   (%esi,%edi,4)
  38:	e8 da 03 00 00       	call   417 <open>
  3d:	83 c4 10             	add    $0x10,%esp
  40:	89 c3                	mov    %eax,%ebx
      printf(1, "wc: cannot open %s\n", argv[i]);
  42:	8b 04 be             	mov    (%esi,%edi,4),%eax
    if((fd = open(argv[i], 0)) < 0){
  45:	85 db                	test   %ebx,%ebx
  47:	78 22                	js     6b <main+0x6b>
      exit();
    }
    wc(fd, argv[i]);
  49:	83 ec 08             	sub    $0x8,%esp
  for(i = 1; i < argc; i++){
  4c:	83 c7 01             	add    $0x1,%edi
    wc(fd, argv[i]);
  4f:	50                   	push   %eax
  50:	53                   	push   %ebx
  51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
  56:	89 1c 24             	mov    %ebx,(%esp)
  59:	e8 a1 03 00 00       	call   3ff <close>
  for(i = 1; i < argc; i++){
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
  }
  exit();
  66:	e8 6c 03 00 00       	call   3d7 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  6b:	52                   	push   %edx
  6c:	50                   	push   %eax
  6d:	68 0b 09 00 00       	push   $0x90b
  72:	6a 01                	push   $0x1
  74:	e8 c7 04 00 00       	call   540 <printf>
      exit();
  79:	e8 59 03 00 00       	call   3d7 <exit>
    wc(0, "");
  7e:	51                   	push   %ecx
  7f:	51                   	push   %ecx
  80:	68 fd 08 00 00       	push   $0x8fd
  85:	6a 00                	push   $0x0
  87:	e8 14 00 00 00       	call   a0 <wc>
    exit();
  8c:	e8 46 03 00 00       	call   3d7 <exit>
  91:	66 90                	xchg   %ax,%ax
  93:	66 90                	xchg   %ax,%ax
  95:	66 90                	xchg   %ax,%ax
  97:	66 90                	xchg   %ax,%ax
  99:	66 90                	xchg   %ax,%ax
  9b:	66 90                	xchg   %ax,%ax
  9d:	66 90                	xchg   %ax,%ax
  9f:	90                   	nop

000000a0 <wc>:
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	57                   	push   %edi
  a4:	56                   	push   %esi
  inword = 0;
  a5:	31 f6                	xor    %esi,%esi
{
  a7:	53                   	push   %ebx
  l = w = c = 0;
  a8:	31 db                	xor    %ebx,%ebx
{
  aa:	83 ec 1c             	sub    $0x1c,%esp
  l = w = c = 0;
  ad:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  b4:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c0:	83 ec 04             	sub    $0x4,%esp
  c3:	68 00 02 00 00       	push   $0x200
  c8:	68 c0 0c 00 00       	push   $0xcc0
  cd:	ff 75 08             	push   0x8(%ebp)
  d0:	e8 1a 03 00 00       	call   3ef <read>
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	85 c0                	test   %eax,%eax
  da:	7e 64                	jle    140 <wc+0xa0>
    for(i=0; i<n; i++){
  dc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  df:	31 ff                	xor    %edi,%edi
  e1:	eb 0f                	jmp    f2 <wc+0x52>
  e3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        inword = 0;
  e8:	31 f6                	xor    %esi,%esi
    for(i=0; i<n; i++){
  ea:	83 c7 01             	add    $0x1,%edi
  ed:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
  f0:	74 43                	je     135 <wc+0x95>
      if(buf[i] == '\n')
  f2:	0f be 87 c0 0c 00 00 	movsbl 0xcc0(%edi),%eax
        l++;
  f9:	31 c9                	xor    %ecx,%ecx
  fb:	3c 0a                	cmp    $0xa,%al
  fd:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 100:	83 ec 08             	sub    $0x8,%esp
 103:	50                   	push   %eax
        l++;
 104:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 106:	68 e8 08 00 00       	push   $0x8e8
 10b:	e8 50 01 00 00       	call   260 <strchr>
 110:	83 c4 10             	add    $0x10,%esp
 113:	85 c0                	test   %eax,%eax
 115:	75 d1                	jne    e8 <wc+0x48>
        inword = 1;
 117:	8b 55 e0             	mov    -0x20(%ebp),%edx
 11a:	85 f6                	test   %esi,%esi
 11c:	8d 42 01             	lea    0x1(%edx),%eax
 11f:	0f 45 c2             	cmovne %edx,%eax
 122:	89 45 e0             	mov    %eax,-0x20(%ebp)
 125:	b8 01 00 00 00       	mov    $0x1,%eax
 12a:	0f 44 f0             	cmove  %eax,%esi
    for(i=0; i<n; i++){
 12d:	83 c7 01             	add    $0x1,%edi
 130:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
 133:	75 bd                	jne    f2 <wc+0x52>
 135:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 138:	01 4d dc             	add    %ecx,-0x24(%ebp)
 13b:	eb 83                	jmp    c0 <wc+0x20>
 13d:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
 140:	8b 55 dc             	mov    -0x24(%ebp),%edx
 143:	75 22                	jne    167 <wc+0xc7>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 145:	83 ec 08             	sub    $0x8,%esp
 148:	ff 75 0c             	push   0xc(%ebp)
 14b:	52                   	push   %edx
 14c:	ff 75 e0             	push   -0x20(%ebp)
 14f:	53                   	push   %ebx
 150:	68 fe 08 00 00       	push   $0x8fe
 155:	6a 01                	push   $0x1
 157:	e8 e4 03 00 00       	call   540 <printf>
}
 15c:	83 c4 20             	add    $0x20,%esp
 15f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 162:	5b                   	pop    %ebx
 163:	5e                   	pop    %esi
 164:	5f                   	pop    %edi
 165:	5d                   	pop    %ebp
 166:	c3                   	ret
    printf(1, "wc: read error\n");
 167:	50                   	push   %eax
 168:	50                   	push   %eax
 169:	68 ee 08 00 00       	push   $0x8ee
 16e:	6a 01                	push   $0x1
 170:	e8 cb 03 00 00       	call   540 <printf>
    exit();
 175:	e8 5d 02 00 00       	call   3d7 <exit>
 17a:	66 90                	xchg   %ax,%ax
 17c:	66 90                	xchg   %ax,%ax
 17e:	66 90                	xchg   %ax,%ax

00000180 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 180:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 181:	31 c0                	xor    %eax,%eax
{
 183:	89 e5                	mov    %esp,%ebp
 185:	53                   	push   %ebx
 186:	8b 4d 08             	mov    0x8(%ebp),%ecx
 189:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 190:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 194:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 197:	83 c0 01             	add    $0x1,%eax
 19a:	84 d2                	test   %dl,%dl
 19c:	75 f2                	jne    190 <strcpy+0x10>
    ;
  return os;
}
 19e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a1:	89 c8                	mov    %ecx,%eax
 1a3:	c9                   	leave
 1a4:	c3                   	ret
 1a5:	8d 76 00             	lea    0x0(%esi),%esi
 1a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1af:	00 

000001b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	53                   	push   %ebx
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
 1b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ba:	0f b6 02             	movzbl (%edx),%eax
 1bd:	84 c0                	test   %al,%al
 1bf:	75 2d                	jne    1ee <strcmp+0x3e>
 1c1:	eb 3d                	jmp    200 <strcmp+0x50>
 1c3:	eb 1b                	jmp    1e0 <strcmp+0x30>
 1c5:	8d 76 00             	lea    0x0(%esi),%esi
 1c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1cf:	00 
 1d0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1d7:	00 
 1d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1df:	00 
 1e0:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1e4:	83 c2 01             	add    $0x1,%edx
 1e7:	83 c1 01             	add    $0x1,%ecx
  while(*p && *p == *q)
 1ea:	84 c0                	test   %al,%al
 1ec:	74 12                	je     200 <strcmp+0x50>
 1ee:	0f b6 19             	movzbl (%ecx),%ebx
 1f1:	38 c3                	cmp    %al,%bl
 1f3:	74 eb                	je     1e0 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
 1f5:	29 d8                	sub    %ebx,%eax
}
 1f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1fa:	c9                   	leave
 1fb:	c3                   	ret
 1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return (uchar)*p - (uchar)*q;
 200:	0f b6 19             	movzbl (%ecx),%ebx
 203:	31 c0                	xor    %eax,%eax
 205:	29 d8                	sub    %ebx,%eax
}
 207:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 20a:	c9                   	leave
 20b:	c3                   	ret
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000210 <strlen>:

uint
strlen(const char *s)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 216:	80 3a 00             	cmpb   $0x0,(%edx)
 219:	74 15                	je     230 <strlen+0x20>
 21b:	31 c0                	xor    %eax,%eax
 21d:	8d 76 00             	lea    0x0(%esi),%esi
 220:	83 c0 01             	add    $0x1,%eax
 223:	89 c1                	mov    %eax,%ecx
 225:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 229:	75 f5                	jne    220 <strlen+0x10>
    ;
  return n;
}
 22b:	89 c8                	mov    %ecx,%eax
 22d:	5d                   	pop    %ebp
 22e:	c3                   	ret
 22f:	90                   	nop
  for(n = 0; s[n]; n++)
 230:	31 c9                	xor    %ecx,%ecx
}
 232:	5d                   	pop    %ebp
 233:	89 c8                	mov    %ecx,%eax
 235:	c3                   	ret
 236:	66 90                	xchg   %ax,%ax
 238:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 23f:	00 

00000240 <memset>:

void*
memset(void *dst, int c, uint n)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 244:	8b 4d 10             	mov    0x10(%ebp),%ecx
 247:	8b 45 0c             	mov    0xc(%ebp),%eax
 24a:	8b 7d 08             	mov    0x8(%ebp),%edi
 24d:	fc                   	cld
 24e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 250:	8b 45 08             	mov    0x8(%ebp),%eax
 253:	8b 7d fc             	mov    -0x4(%ebp),%edi
 256:	c9                   	leave
 257:	c3                   	ret
 258:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 25f:	00 

00000260 <strchr>:

char*
strchr(const char *s, char c)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 45 08             	mov    0x8(%ebp),%eax
 266:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 26a:	0f b6 10             	movzbl (%eax),%edx
 26d:	84 d2                	test   %dl,%dl
 26f:	75 1a                	jne    28b <strchr+0x2b>
 271:	eb 25                	jmp    298 <strchr+0x38>
 273:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 278:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 27f:	00 
 280:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 284:	83 c0 01             	add    $0x1,%eax
 287:	84 d2                	test   %dl,%dl
 289:	74 0d                	je     298 <strchr+0x38>
    if(*s == c)
 28b:	38 d1                	cmp    %dl,%cl
 28d:	75 f1                	jne    280 <strchr+0x20>
      return (char*)s;
  return 0;
}
 28f:	5d                   	pop    %ebp
 290:	c3                   	ret
 291:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 298:	31 c0                	xor    %eax,%eax
}
 29a:	5d                   	pop    %ebp
 29b:	c3                   	ret
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002a0 <gets>:

char*
gets(char *buf, int max)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2a5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 2a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2a9:	31 db                	xor    %ebx,%ebx
{
 2ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2ae:	eb 27                	jmp    2d7 <gets+0x37>
    cc = read(0, &c, 1);
 2b0:	83 ec 04             	sub    $0x4,%esp
 2b3:	6a 01                	push   $0x1
 2b5:	57                   	push   %edi
 2b6:	6a 00                	push   $0x0
 2b8:	e8 32 01 00 00       	call   3ef <read>
    if(cc < 1)
 2bd:	83 c4 10             	add    $0x10,%esp
 2c0:	85 c0                	test   %eax,%eax
 2c2:	7e 1d                	jle    2e1 <gets+0x41>
      break;
    buf[i++] = c;
 2c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2c8:	8b 55 08             	mov    0x8(%ebp),%edx
 2cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2cf:	3c 0a                	cmp    $0xa,%al
 2d1:	74 1d                	je     2f0 <gets+0x50>
 2d3:	3c 0d                	cmp    $0xd,%al
 2d5:	74 19                	je     2f0 <gets+0x50>
  for(i=0; i+1 < max; ){
 2d7:	89 de                	mov    %ebx,%esi
 2d9:	83 c3 01             	add    $0x1,%ebx
 2dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2df:	7c cf                	jl     2b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 2e1:	8b 45 08             	mov    0x8(%ebp),%eax
 2e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2eb:	5b                   	pop    %ebx
 2ec:	5e                   	pop    %esi
 2ed:	5f                   	pop    %edi
 2ee:	5d                   	pop    %ebp
 2ef:	c3                   	ret
  buf[i] = '\0';
 2f0:	8b 45 08             	mov    0x8(%ebp),%eax
    buf[i++] = c;
 2f3:	89 de                	mov    %ebx,%esi
  buf[i] = '\0';
 2f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 2f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2fc:	5b                   	pop    %ebx
 2fd:	5e                   	pop    %esi
 2fe:	5f                   	pop    %edi
 2ff:	5d                   	pop    %ebp
 300:	c3                   	ret
 301:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 308:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 30f:	00 

00000310 <stat>:

int
stat(const char *n, struct stat *st)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 316:	6a 00                	push   $0x0
 318:	ff 75 08             	push   0x8(%ebp)
{
 31b:	89 75 fc             	mov    %esi,-0x4(%ebp)
  fd = open(n, O_RDONLY);
 31e:	e8 f4 00 00 00       	call   417 <open>
  if(fd < 0)
 323:	83 c4 10             	add    $0x10,%esp
 326:	85 c0                	test   %eax,%eax
 328:	78 2e                	js     358 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 32a:	83 ec 08             	sub    $0x8,%esp
 32d:	ff 75 0c             	push   0xc(%ebp)
 330:	50                   	push   %eax
 331:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 334:	89 c3                	mov    %eax,%ebx
 336:	e8 f4 00 00 00       	call   42f <fstat>
  close(fd);
 33b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 33e:	89 c6                	mov    %eax,%esi
  close(fd);
 340:	e8 ba 00 00 00       	call   3ff <close>
  return r;
 345:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 348:	83 c4 10             	add    $0x10,%esp
}
 34b:	89 f0                	mov    %esi,%eax
 34d:	8b 75 fc             	mov    -0x4(%ebp),%esi
 350:	c9                   	leave
 351:	c3                   	ret
 352:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
 358:	be ff ff ff ff       	mov    $0xffffffff,%esi
 35d:	eb ec                	jmp    34b <stat+0x3b>
 35f:	90                   	nop

00000360 <atoi>:

int
atoi(const char *s)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 367:	0f be 02             	movsbl (%edx),%eax
 36a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 36d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 370:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 375:	77 1e                	ja     395 <atoi+0x35>
 377:	90                   	nop
 378:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 37f:	00 
    n = n*10 + *s++ - '0';
 380:	83 c2 01             	add    $0x1,%edx
 383:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 386:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 38a:	0f be 02             	movsbl (%edx),%eax
 38d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 390:	80 fb 09             	cmp    $0x9,%bl
 393:	76 eb                	jbe    380 <atoi+0x20>
  return n;
}
 395:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 398:	89 c8                	mov    %ecx,%eax
 39a:	c9                   	leave
 39b:	c3                   	ret
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	83 ec 08             	sub    $0x8,%esp
 3a6:	8b 45 10             	mov    0x10(%ebp),%eax
 3a9:	8b 55 08             	mov    0x8(%ebp),%edx
 3ac:	89 75 f8             	mov    %esi,-0x8(%ebp)
 3af:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3b2:	85 c0                	test   %eax,%eax
 3b4:	7e 12                	jle    3c8 <memmove+0x28>
 3b6:	89 7d fc             	mov    %edi,-0x4(%ebp)
 3b9:	01 d0                	add    %edx,%eax
  dst = vdst;
 3bb:	89 d7                	mov    %edx,%edi
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3c1:	39 f8                	cmp    %edi,%eax
 3c3:	75 fb                	jne    3c0 <memmove+0x20>
 3c5:	8b 7d fc             	mov    -0x4(%ebp),%edi
  return vdst;
}
 3c8:	8b 75 f8             	mov    -0x8(%ebp),%esi
 3cb:	89 d0                	mov    %edx,%eax
 3cd:	c9                   	leave
 3ce:	c3                   	ret

000003cf <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3cf:	b8 01 00 00 00       	mov    $0x1,%eax
 3d4:	cd 40                	int    $0x40
 3d6:	c3                   	ret

000003d7 <exit>:
SYSCALL(exit)
 3d7:	b8 02 00 00 00       	mov    $0x2,%eax
 3dc:	cd 40                	int    $0x40
 3de:	c3                   	ret

000003df <wait>:
SYSCALL(wait)
 3df:	b8 03 00 00 00       	mov    $0x3,%eax
 3e4:	cd 40                	int    $0x40
 3e6:	c3                   	ret

000003e7 <pipe>:
SYSCALL(pipe)
 3e7:	b8 04 00 00 00       	mov    $0x4,%eax
 3ec:	cd 40                	int    $0x40
 3ee:	c3                   	ret

000003ef <read>:
SYSCALL(read)
 3ef:	b8 05 00 00 00       	mov    $0x5,%eax
 3f4:	cd 40                	int    $0x40
 3f6:	c3                   	ret

000003f7 <write>:
SYSCALL(write)
 3f7:	b8 10 00 00 00       	mov    $0x10,%eax
 3fc:	cd 40                	int    $0x40
 3fe:	c3                   	ret

000003ff <close>:
SYSCALL(close)
 3ff:	b8 15 00 00 00       	mov    $0x15,%eax
 404:	cd 40                	int    $0x40
 406:	c3                   	ret

00000407 <kill>:
SYSCALL(kill)
 407:	b8 06 00 00 00       	mov    $0x6,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret

0000040f <exec>:
SYSCALL(exec)
 40f:	b8 07 00 00 00       	mov    $0x7,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret

00000417 <open>:
SYSCALL(open)
 417:	b8 0f 00 00 00       	mov    $0xf,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret

0000041f <mknod>:
SYSCALL(mknod)
 41f:	b8 11 00 00 00       	mov    $0x11,%eax
 424:	cd 40                	int    $0x40
 426:	c3                   	ret

00000427 <unlink>:
SYSCALL(unlink)
 427:	b8 12 00 00 00       	mov    $0x12,%eax
 42c:	cd 40                	int    $0x40
 42e:	c3                   	ret

0000042f <fstat>:
SYSCALL(fstat)
 42f:	b8 08 00 00 00       	mov    $0x8,%eax
 434:	cd 40                	int    $0x40
 436:	c3                   	ret

00000437 <link>:
SYSCALL(link)
 437:	b8 13 00 00 00       	mov    $0x13,%eax
 43c:	cd 40                	int    $0x40
 43e:	c3                   	ret

0000043f <mkdir>:
SYSCALL(mkdir)
 43f:	b8 14 00 00 00       	mov    $0x14,%eax
 444:	cd 40                	int    $0x40
 446:	c3                   	ret

00000447 <chdir>:
SYSCALL(chdir)
 447:	b8 09 00 00 00       	mov    $0x9,%eax
 44c:	cd 40                	int    $0x40
 44e:	c3                   	ret

0000044f <dup>:
SYSCALL(dup)
 44f:	b8 0a 00 00 00       	mov    $0xa,%eax
 454:	cd 40                	int    $0x40
 456:	c3                   	ret

00000457 <getpid>:
SYSCALL(getpid)
 457:	b8 0b 00 00 00       	mov    $0xb,%eax
 45c:	cd 40                	int    $0x40
 45e:	c3                   	ret

0000045f <sbrk>:
SYSCALL(sbrk)
 45f:	b8 0c 00 00 00       	mov    $0xc,%eax
 464:	cd 40                	int    $0x40
 466:	c3                   	ret

00000467 <sleep>:
SYSCALL(sleep)
 467:	b8 0d 00 00 00       	mov    $0xd,%eax
 46c:	cd 40                	int    $0x40
 46e:	c3                   	ret

0000046f <uptime>:
SYSCALL(uptime)
 46f:	b8 0e 00 00 00       	mov    $0xe,%eax
 474:	cd 40                	int    $0x40
 476:	c3                   	ret
 477:	66 90                	xchg   %ax,%ax
 479:	66 90                	xchg   %ax,%ax
 47b:	66 90                	xchg   %ax,%ax
 47d:	66 90                	xchg   %ax,%ax
 47f:	90                   	nop

00000480 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
 485:	53                   	push   %ebx
 486:	89 cb                	mov    %ecx,%ebx
 488:	83 ec 3c             	sub    $0x3c,%esp
 48b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 48e:	85 d2                	test   %edx,%edx
 490:	0f 89 9a 00 00 00    	jns    530 <printint+0xb0>
 496:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 49a:	0f 84 90 00 00 00    	je     530 <printint+0xb0>
    neg = 1;
    x = -xx;
 4a0:	f7 da                	neg    %edx
    neg = 1;
 4a2:	b8 01 00 00 00       	mov    $0x1,%eax
 4a7:	89 45 c0             	mov    %eax,-0x40(%ebp)
 4aa:	89 d1                	mov    %edx,%ecx
  } else {
    x = xx;
  }

  i = 0;
 4ac:	31 f6                	xor    %esi,%esi
 4ae:	66 90                	xchg   %ax,%ax
 4b0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4b7:	00 
 4b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4bf:	00 
  do{
    buf[i++] = digits[x % base];
 4c0:	89 c8                	mov    %ecx,%eax
 4c2:	31 d2                	xor    %edx,%edx
 4c4:	89 f7                	mov    %esi,%edi
 4c6:	f7 f3                	div    %ebx
 4c8:	8d 76 01             	lea    0x1(%esi),%esi
  }while((x /= base) != 0);
 4cb:	39 d9                	cmp    %ebx,%ecx
    buf[i++] = digits[x % base];
 4cd:	0f b6 92 80 09 00 00 	movzbl 0x980(%edx),%edx
  }while((x /= base) != 0);
 4d4:	89 c1                	mov    %eax,%ecx
    buf[i++] = digits[x % base];
 4d6:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 4da:	73 e4                	jae    4c0 <printint+0x40>
  if(neg)
 4dc:	8b 45 c0             	mov    -0x40(%ebp),%eax
 4df:	85 c0                	test   %eax,%eax
 4e1:	74 07                	je     4ea <printint+0x6a>
    buf[i++] = '-';
 4e3:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 4e8:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
 4ea:	8d 74 3d d8          	lea    -0x28(%ebp,%edi,1),%esi
 4ee:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 4f1:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 4f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4ff:	00 
    putc(fd, buf[i]);
 500:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 503:	83 ec 04             	sub    $0x4,%esp
  while(--i >= 0)
 506:	83 ee 01             	sub    $0x1,%esi
 509:	88 45 d7             	mov    %al,-0x29(%ebp)
  write(fd, &c, 1);
 50c:	8d 45 d7             	lea    -0x29(%ebp),%eax
 50f:	6a 01                	push   $0x1
 511:	50                   	push   %eax
 512:	57                   	push   %edi
 513:	e8 df fe ff ff       	call   3f7 <write>
  while(--i >= 0)
 518:	83 c4 10             	add    $0x10,%esp
 51b:	39 f3                	cmp    %esi,%ebx
 51d:	75 e1                	jne    500 <printint+0x80>
}
 51f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 522:	5b                   	pop    %ebx
 523:	5e                   	pop    %esi
 524:	5f                   	pop    %edi
 525:	5d                   	pop    %ebp
 526:	c3                   	ret
 527:	90                   	nop
 528:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 52f:	00 
  neg = 0;
 530:	31 c0                	xor    %eax,%eax
 532:	e9 70 ff ff ff       	jmp    4a7 <printint+0x27>
 537:	90                   	nop
 538:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 53f:	00 

00000540 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	83 ec 38             	sub    $0x38,%esp
 546:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 549:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 54c:	89 75 f8             	mov    %esi,-0x8(%ebp)
 54f:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 552:	0f b6 03             	movzbl (%ebx),%eax
 555:	84 c0                	test   %al,%al
 557:	0f 84 b6 00 00 00    	je     613 <printf+0xd3>
  ap = (uint*)(void*)&fmt + 1;
 55d:	8d 4d 10             	lea    0x10(%ebp),%ecx
 560:	89 7d fc             	mov    %edi,-0x4(%ebp)
 563:	83 c3 01             	add    $0x1,%ebx
 566:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
 569:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 56c:	0f b6 d0             	movzbl %al,%edx
    if(state == 0){
 56f:	eb 2a                	jmp    59b <printf+0x5b>
 571:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 578:	83 ec 04             	sub    $0x4,%esp
 57b:	88 45 e7             	mov    %al,-0x19(%ebp)
 57e:	8d 45 e7             	lea    -0x19(%ebp),%eax
  for(i = 0; fmt[i]; i++){
 581:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 584:	6a 01                	push   $0x1
 586:	50                   	push   %eax
 587:	56                   	push   %esi
 588:	e8 6a fe ff ff       	call   3f7 <write>
  for(i = 0; fmt[i]; i++){
 58d:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
 591:	83 c4 10             	add    $0x10,%esp
 594:	84 c0                	test   %al,%al
 596:	74 78                	je     610 <printf+0xd0>
    c = fmt[i] & 0xff;
 598:	0f b6 d0             	movzbl %al,%edx
      if(c == '%'){
 59b:	83 fa 25             	cmp    $0x25,%edx
 59e:	75 d8                	jne    578 <printf+0x38>
  for(i = 0; fmt[i]; i++){
 5a0:	0f b6 13             	movzbl (%ebx),%edx
 5a3:	84 d2                	test   %dl,%dl
 5a5:	74 69                	je     610 <printf+0xd0>
    c = fmt[i] & 0xff;
 5a7:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 5aa:	80 fa 25             	cmp    $0x25,%dl
 5ad:	0f 84 25 01 00 00    	je     6d8 <printf+0x198>
 5b3:	83 e8 63             	sub    $0x63,%eax
 5b6:	83 f8 15             	cmp    $0x15,%eax
 5b9:	77 0d                	ja     5c8 <printf+0x88>
 5bb:	ff 24 85 28 09 00 00 	jmp    *0x928(,%eax,4)
 5c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 5c8:	83 ec 04             	sub    $0x4,%esp
 5cb:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 5ce:	88 55 d0             	mov    %dl,-0x30(%ebp)
 5d1:	6a 01                	push   $0x1
 5d3:	51                   	push   %ecx
 5d4:	56                   	push   %esi
 5d5:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 5d8:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5dc:	e8 16 fe ff ff       	call   3f7 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 5e1:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 5e5:	83 c4 0c             	add    $0xc,%esp
 5e8:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 5eb:	6a 01                	push   $0x1
 5ed:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5f0:	51                   	push   %ecx
  for(i = 0; fmt[i]; i++){
 5f1:	83 c3 02             	add    $0x2,%ebx
  write(fd, &c, 1);
 5f4:	56                   	push   %esi
 5f5:	e8 fd fd ff ff       	call   3f7 <write>
  for(i = 0; fmt[i]; i++){
 5fa:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
 5fe:	83 c4 10             	add    $0x10,%esp
 601:	84 c0                	test   %al,%al
 603:	75 93                	jne    598 <printf+0x58>
 605:	8d 76 00             	lea    0x0(%esi),%esi
 608:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 60f:	00 
 610:	8b 7d fc             	mov    -0x4(%ebp),%edi
      }
      state = 0;
    }
  }
}
 613:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 616:	8b 75 f8             	mov    -0x8(%ebp),%esi
 619:	c9                   	leave
 61a:	c3                   	ret
 61b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 16, 0);
 620:	83 ec 0c             	sub    $0xc,%esp
 623:	8b 17                	mov    (%edi),%edx
 625:	b9 10 00 00 00       	mov    $0x10,%ecx
 62a:	89 f0                	mov    %esi,%eax
 62c:	6a 00                	push   $0x0
 62e:	e8 4d fe ff ff       	call   480 <printint>
  for(i = 0; fmt[i]; i++){
 633:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
 637:	83 c3 02             	add    $0x2,%ebx
 63a:	83 c4 10             	add    $0x10,%esp
 63d:	84 c0                	test   %al,%al
 63f:	74 cf                	je     610 <printf+0xd0>
        ap++;
 641:	83 c7 04             	add    $0x4,%edi
 644:	e9 4f ff ff ff       	jmp    598 <printf+0x58>
 649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 650:	83 ec 0c             	sub    $0xc,%esp
 653:	8b 17                	mov    (%edi),%edx
 655:	b9 0a 00 00 00       	mov    $0xa,%ecx
 65a:	89 f0                	mov    %esi,%eax
 65c:	6a 01                	push   $0x1
 65e:	e8 1d fe ff ff       	call   480 <printint>
  for(i = 0; fmt[i]; i++){
 663:	eb ce                	jmp    633 <printf+0xf3>
 665:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 668:	83 ec 04             	sub    $0x4,%esp
 66b:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        putc(fd, *ap);
 66e:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 670:	6a 01                	push   $0x1
 672:	51                   	push   %ecx
 673:	56                   	push   %esi
        putc(fd, *ap);
 674:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 677:	e8 7b fd ff ff       	call   3f7 <write>
 67c:	eb b5                	jmp    633 <printf+0xf3>
 67e:	66 90                	xchg   %ax,%ax
        s = (char*)*ap;
 680:	8b 07                	mov    (%edi),%eax
        ap++;
 682:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 685:	85 c0                	test   %eax,%eax
 687:	74 67                	je     6f0 <printf+0x1b0>
        while(*s != 0){
 689:	0f b6 10             	movzbl (%eax),%edx
 68c:	84 d2                	test   %dl,%dl
 68e:	74 6f                	je     6ff <printf+0x1bf>
 690:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 693:	89 c7                	mov    %eax,%edi
 695:	89 d0                	mov    %edx,%eax
 697:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 69a:	89 fb                	mov    %edi,%ebx
 69c:	8d 7d e7             	lea    -0x19(%ebp),%edi
 69f:	90                   	nop
  write(fd, &c, 1);
 6a0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6a3:	83 c3 01             	add    $0x1,%ebx
 6a6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6a9:	6a 01                	push   $0x1
 6ab:	57                   	push   %edi
 6ac:	56                   	push   %esi
 6ad:	e8 45 fd ff ff       	call   3f7 <write>
        while(*s != 0){
 6b2:	0f b6 03             	movzbl (%ebx),%eax
 6b5:	83 c4 10             	add    $0x10,%esp
 6b8:	84 c0                	test   %al,%al
 6ba:	75 e4                	jne    6a0 <printf+0x160>
 6bc:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
 6bf:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
 6c3:	83 c3 02             	add    $0x2,%ebx
 6c6:	84 c0                	test   %al,%al
 6c8:	0f 85 9b fe ff ff    	jne    569 <printf+0x29>
 6ce:	e9 3d ff ff ff       	jmp    610 <printf+0xd0>
 6d3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 6d8:	83 ec 04             	sub    $0x4,%esp
 6db:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6df:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 6e2:	6a 01                	push   $0x1
 6e4:	e9 07 ff ff ff       	jmp    5f0 <printf+0xb0>
 6e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
          s = "(null)";
 6f0:	89 7d d4             	mov    %edi,-0x2c(%ebp)
        if(s == 0)
 6f3:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 6f8:	bf 1f 09 00 00       	mov    $0x91f,%edi
 6fd:	eb 98                	jmp    697 <printf+0x157>
  for(i = 0; fmt[i]; i++){
 6ff:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
 703:	83 c3 02             	add    $0x2,%ebx
 706:	84 c0                	test   %al,%al
 708:	0f 85 8a fe ff ff    	jne    598 <printf+0x58>
 70e:	e9 fd fe ff ff       	jmp    610 <printf+0xd0>
 713:	66 90                	xchg   %ax,%ax
 715:	66 90                	xchg   %ax,%ax
 717:	66 90                	xchg   %ax,%ax
 719:	66 90                	xchg   %ax,%ax
 71b:	66 90                	xchg   %ax,%ax
 71d:	66 90                	xchg   %ax,%ax
 71f:	90                   	nop

00000720 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 720:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 721:	a1 c0 0e 00 00       	mov    0xec0,%eax
{
 726:	89 e5                	mov    %esp,%ebp
 728:	57                   	push   %edi
 729:	56                   	push   %esi
 72a:	53                   	push   %ebx
 72b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 72e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 731:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 738:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 73f:	00 
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 740:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 742:	39 c8                	cmp    %ecx,%eax
 744:	73 32                	jae    778 <free+0x58>
 746:	39 d1                	cmp    %edx,%ecx
 748:	72 04                	jb     74e <free+0x2e>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 74a:	39 d0                	cmp    %edx,%eax
 74c:	72 32                	jb     780 <free+0x60>
      break;
  if(bp + bp->s.size == p->s.ptr){
 74e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 751:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 754:	39 fa                	cmp    %edi,%edx
 756:	74 30                	je     788 <free+0x68>
 758:	89 53 f8             	mov    %edx,-0x8(%ebx)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 75b:	8b 50 04             	mov    0x4(%eax),%edx
 75e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 761:	39 f1                	cmp    %esi,%ecx
 763:	74 3a                	je     79f <free+0x7f>
 765:	89 08                	mov    %ecx,(%eax)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
}
 767:	5b                   	pop    %ebx
  freep = p;
 768:	a3 c0 0e 00 00       	mov    %eax,0xec0
}
 76d:	5e                   	pop    %esi
 76e:	5f                   	pop    %edi
 76f:	5d                   	pop    %ebp
 770:	c3                   	ret
 771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 778:	39 d0                	cmp    %edx,%eax
 77a:	72 04                	jb     780 <free+0x60>
 77c:	39 d1                	cmp    %edx,%ecx
 77e:	72 ce                	jb     74e <free+0x2e>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 780:	89 d0                	mov    %edx,%eax
 782:	eb bc                	jmp    740 <free+0x20>
 784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 788:	03 72 04             	add    0x4(%edx),%esi
 78b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 78e:	8b 10                	mov    (%eax),%edx
 790:	8b 12                	mov    (%edx),%edx
 792:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 795:	8b 50 04             	mov    0x4(%eax),%edx
 798:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 79b:	39 f1                	cmp    %esi,%ecx
 79d:	75 c6                	jne    765 <free+0x45>
    p->s.size += bp->s.size;
 79f:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7a2:	a3 c0 0e 00 00       	mov    %eax,0xec0
    p->s.size += bp->s.size;
 7a7:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7aa:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7ad:	89 08                	mov    %ecx,(%eax)
}
 7af:	5b                   	pop    %ebx
 7b0:	5e                   	pop    %esi
 7b1:	5f                   	pop    %edi
 7b2:	5d                   	pop    %ebp
 7b3:	c3                   	ret
 7b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 7bf:	00 

000007c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c6:	8b 45 08             	mov    0x8(%ebp),%eax
{
 7c9:	89 7d fc             	mov    %edi,-0x4(%ebp)
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7cc:	8d 78 07             	lea    0x7(%eax),%edi
  if((prevp = freep) == 0){
 7cf:	a1 c0 0e 00 00       	mov    0xec0,%eax
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d4:	c1 ef 03             	shr    $0x3,%edi
 7d7:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 7da:	85 c0                	test   %eax,%eax
 7dc:	0f 84 c6 00 00 00    	je     8a8 <malloc+0xe8>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e2:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 7e4:	8b 4a 04             	mov    0x4(%edx),%ecx
 7e7:	39 f9                	cmp    %edi,%ecx
 7e9:	0f 83 87 00 00 00    	jae    876 <malloc+0xb6>
 7ef:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 7f2:	89 75 f8             	mov    %esi,-0x8(%ebp)
  if(nu < 4096)
 7f5:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7fa:	39 df                	cmp    %ebx,%edi
 7fc:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7ff:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 806:	eb 21                	jmp    829 <malloc+0x69>
 808:	eb 16                	jmp    820 <malloc+0x60>
 80a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 810:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 817:	00 
 818:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 81f:	00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 820:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 822:	8b 4a 04             	mov    0x4(%edx),%ecx
 825:	39 f9                	cmp    %edi,%ecx
 827:	73 47                	jae    870 <malloc+0xb0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 829:	89 d0                	mov    %edx,%eax
 82b:	39 15 c0 0e 00 00    	cmp    %edx,0xec0
 831:	75 ed                	jne    820 <malloc+0x60>
  p = sbrk(nu * sizeof(Header));
 833:	83 ec 0c             	sub    $0xc,%esp
 836:	56                   	push   %esi
 837:	e8 23 fc ff ff       	call   45f <sbrk>
  if(p == (char*)-1)
 83c:	83 c4 10             	add    $0x10,%esp
 83f:	83 f8 ff             	cmp    $0xffffffff,%eax
 842:	74 54                	je     898 <malloc+0xd8>
  hp->s.size = nu;
 844:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 847:	83 ec 0c             	sub    $0xc,%esp
 84a:	83 c0 08             	add    $0x8,%eax
 84d:	50                   	push   %eax
 84e:	e8 cd fe ff ff       	call   720 <free>
  return freep;
 853:	a1 c0 0e 00 00       	mov    0xec0,%eax
      if((p = morecore(nunits)) == 0)
 858:	83 c4 10             	add    $0x10,%esp
 85b:	85 c0                	test   %eax,%eax
 85d:	75 c1                	jne    820 <malloc+0x60>
 85f:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 862:	8b 75 f8             	mov    -0x8(%ebp),%esi
 865:	eb 26                	jmp    88d <malloc+0xcd>
 867:	90                   	nop
 868:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 86f:	00 
 870:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 873:	8b 75 f8             	mov    -0x8(%ebp),%esi
      if(p->s.size == nunits)
 876:	39 cf                	cmp    %ecx,%edi
 878:	74 66                	je     8e0 <malloc+0x120>
        p->s.size -= nunits;
 87a:	29 f9                	sub    %edi,%ecx
 87c:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 87f:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 882:	89 7a 04             	mov    %edi,0x4(%edx)
      freep = prevp;
 885:	a3 c0 0e 00 00       	mov    %eax,0xec0
      return (void*)(p + 1);
 88a:	8d 42 08             	lea    0x8(%edx),%eax
        return 0;
  }
}
 88d:	8b 7d fc             	mov    -0x4(%ebp),%edi
 890:	c9                   	leave
 891:	c3                   	ret
 892:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        return 0;
 898:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 89b:	8b 75 f8             	mov    -0x8(%ebp),%esi
 89e:	31 c0                	xor    %eax,%eax
}
 8a0:	8b 7d fc             	mov    -0x4(%ebp),%edi
 8a3:	c9                   	leave
 8a4:	c3                   	ret
 8a5:	8d 76 00             	lea    0x0(%esi),%esi
 8a8:	89 5d f4             	mov    %ebx,-0xc(%ebp)
    base.s.size = 0;
 8ab:	ba c4 0e 00 00       	mov    $0xec4,%edx
 8b0:	89 75 f8             	mov    %esi,-0x8(%ebp)
    base.s.ptr = freep = prevp = &base;
 8b3:	c7 05 c0 0e 00 00 c4 	movl   $0xec4,0xec0
 8ba:	0e 00 00 
 8bd:	c7 05 c4 0e 00 00 c4 	movl   $0xec4,0xec4
 8c4:	0e 00 00 
    base.s.size = 0;
 8c7:	c7 05 c8 0e 00 00 00 	movl   $0x0,0xec8
 8ce:	00 00 00 
    if(p->s.size >= nunits){
 8d1:	e9 1f ff ff ff       	jmp    7f5 <malloc+0x35>
 8d6:	66 90                	xchg   %ax,%ax
 8d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 8df:	00 
        prevp->s.ptr = p->s.ptr;
 8e0:	8b 0a                	mov    (%edx),%ecx
 8e2:	89 08                	mov    %ecx,(%eax)
 8e4:	eb 9f                	jmp    885 <malloc+0xc5>
