
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
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
   f:	53                   	push   %ebx
  10:	bb 01 00 00 00       	mov    $0x1,%ebx
  15:	51                   	push   %ecx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 31                	mov    (%ecx),%esi
  1b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  1e:	83 fe 01             	cmp    $0x1,%esi
  21:	7e 27                	jle    4a <main+0x4a>
  23:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  28:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  2f:	00 
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 34 9f             	push   (%edi,%ebx,4)
  for(i=1; i<argc; i++)
  36:	83 c3 01             	add    $0x1,%ebx
    ls(argv[i]);
  39:	e8 c2 00 00 00       	call   100 <ls>
  for(i=1; i<argc; i++)
  3e:	83 c4 10             	add    $0x10,%esp
  41:	39 de                	cmp    %ebx,%esi
  43:	75 eb                	jne    30 <main+0x30>
  exit();
  45:	e8 6d 05 00 00       	call   5b7 <exit>
    ls(".");
  4a:	83 ec 0c             	sub    $0xc,%esp
  4d:	68 10 0b 00 00       	push   $0xb10
  52:	e8 a9 00 00 00       	call   100 <ls>
    exit();
  57:	e8 5b 05 00 00       	call   5b7 <exit>
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <fmtname>:
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	56                   	push   %esi
  64:	53                   	push   %ebx
  65:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  68:	83 ec 0c             	sub    $0xc,%esp
  6b:	56                   	push   %esi
  6c:	e8 7f 03 00 00       	call   3f0 <strlen>
  71:	83 c4 10             	add    $0x10,%esp
  74:	01 f0                	add    %esi,%eax
  76:	89 c3                	mov    %eax,%ebx
  78:	73 0f                	jae    89 <fmtname+0x29>
  7a:	eb 12                	jmp    8e <fmtname+0x2e>
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	8d 43 ff             	lea    -0x1(%ebx),%eax
  83:	39 f0                	cmp    %esi,%eax
  85:	72 0a                	jb     91 <fmtname+0x31>
  87:	89 c3                	mov    %eax,%ebx
  89:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  8c:	75 f2                	jne    80 <fmtname+0x20>
  p++;
  8e:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
  91:	83 ec 0c             	sub    $0xc,%esp
  94:	53                   	push   %ebx
  95:	e8 56 03 00 00       	call   3f0 <strlen>
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	83 f8 0d             	cmp    $0xd,%eax
  a0:	77 4a                	ja     ec <fmtname+0x8c>
  memmove(buf, p, strlen(p));
  a2:	83 ec 0c             	sub    $0xc,%esp
  a5:	53                   	push   %ebx
  a6:	e8 45 03 00 00       	call   3f0 <strlen>
  ab:	83 c4 0c             	add    $0xc,%esp
  ae:	50                   	push   %eax
  af:	53                   	push   %ebx
  b0:	68 f0 0e 00 00       	push   $0xef0
  b5:	e8 c6 04 00 00       	call   580 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ba:	89 1c 24             	mov    %ebx,(%esp)
  bd:	e8 2e 03 00 00       	call   3f0 <strlen>
  c2:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
  c5:	bb f0 0e 00 00       	mov    $0xef0,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ca:	89 c6                	mov    %eax,%esi
  cc:	e8 1f 03 00 00       	call   3f0 <strlen>
  d1:	ba 0e 00 00 00       	mov    $0xe,%edx
  d6:	83 c4 0c             	add    $0xc,%esp
  d9:	29 f2                	sub    %esi,%edx
  db:	05 f0 0e 00 00       	add    $0xef0,%eax
  e0:	52                   	push   %edx
  e1:	6a 20                	push   $0x20
  e3:	50                   	push   %eax
  e4:	e8 37 03 00 00       	call   420 <memset>
  return buf;
  e9:	83 c4 10             	add    $0x10,%esp
}
  ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
  ef:	89 d8                	mov    %ebx,%eax
  f1:	5b                   	pop    %ebx
  f2:	5e                   	pop    %esi
  f3:	5d                   	pop    %ebp
  f4:	c3                   	ret
  f5:	8d 76 00             	lea    0x0(%esi),%esi
  f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  ff:	00 

00000100 <ls>:
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	81 ec 70 02 00 00    	sub    $0x270,%esp
 109:	89 7d fc             	mov    %edi,-0x4(%ebp)
 10c:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 10f:	6a 00                	push   $0x0
 111:	57                   	push   %edi
 112:	e8 e0 04 00 00       	call   5f7 <open>
 117:	83 c4 10             	add    $0x10,%esp
 11a:	85 c0                	test   %eax,%eax
 11c:	0f 88 9e 01 00 00    	js     2c0 <ls+0x1c0>
  if(fstat(fd, &st) < 0){
 122:	83 ec 08             	sub    $0x8,%esp
 125:	89 75 f8             	mov    %esi,-0x8(%ebp)
 128:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 12e:	56                   	push   %esi
 12f:	50                   	push   %eax
 130:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 133:	89 c3                	mov    %eax,%ebx
 135:	e8 d5 04 00 00       	call   60f <fstat>
 13a:	83 c4 10             	add    $0x10,%esp
 13d:	85 c0                	test   %eax,%eax
 13f:	0f 88 bb 01 00 00    	js     300 <ls+0x200>
  switch(st.type){
 145:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 14c:	66 83 f8 01          	cmp    $0x1,%ax
 150:	74 5e                	je     1b0 <ls+0xb0>
 152:	66 83 f8 02          	cmp    $0x2,%ax
 156:	75 37                	jne    18f <ls+0x8f>
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 158:	83 ec 0c             	sub    $0xc,%esp
 15b:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 161:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 167:	57                   	push   %edi
 168:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 16e:	e8 ed fe ff ff       	call   60 <fmtname>
 173:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 179:	59                   	pop    %ecx
 17a:	5f                   	pop    %edi
 17b:	52                   	push   %edx
 17c:	56                   	push   %esi
 17d:	6a 02                	push   $0x2
 17f:	50                   	push   %eax
 180:	68 f0 0a 00 00       	push   $0xaf0
 185:	6a 01                	push   $0x1
 187:	e8 94 05 00 00       	call   720 <printf>
    break;
 18c:	83 c4 20             	add    $0x20,%esp
  close(fd);
 18f:	83 ec 0c             	sub    $0xc,%esp
 192:	53                   	push   %ebx
 193:	e8 47 04 00 00       	call   5df <close>
 198:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 19b:	8b 75 f8             	mov    -0x8(%ebp),%esi
 19e:	83 c4 10             	add    $0x10,%esp
}
 1a1:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1a4:	c9                   	leave
 1a5:	c3                   	ret
 1a6:	66 90                	xchg   %ax,%ax
 1a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1af:	00 
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 1b0:	83 ec 0c             	sub    $0xc,%esp
 1b3:	57                   	push   %edi
 1b4:	e8 37 02 00 00       	call   3f0 <strlen>
 1b9:	83 c4 10             	add    $0x10,%esp
 1bc:	83 c0 10             	add    $0x10,%eax
 1bf:	3d 00 02 00 00       	cmp    $0x200,%eax
 1c4:	0f 87 16 01 00 00    	ja     2e0 <ls+0x1e0>
    strcpy(buf, path);
 1ca:	83 ec 08             	sub    $0x8,%esp
 1cd:	57                   	push   %edi
 1ce:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 1d4:	57                   	push   %edi
 1d5:	e8 86 01 00 00       	call   360 <strcpy>
    p = buf+strlen(buf);
 1da:	89 3c 24             	mov    %edi,(%esp)
 1dd:	e8 0e 02 00 00       	call   3f0 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1e2:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 1e5:	01 f8                	add    %edi,%eax
    *p++ = '/';
 1e7:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 1ea:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
 1f0:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 1f6:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	83 ec 04             	sub    $0x4,%esp
 203:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 209:	6a 10                	push   $0x10
 20b:	50                   	push   %eax
 20c:	53                   	push   %ebx
 20d:	e8 bd 03 00 00       	call   5cf <read>
 212:	83 c4 10             	add    $0x10,%esp
 215:	83 f8 10             	cmp    $0x10,%eax
 218:	0f 85 71 ff ff ff    	jne    18f <ls+0x8f>
      if(de.inum == 0)
 21e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 225:	00 
 226:	74 d8                	je     200 <ls+0x100>
      memmove(p, de.name, DIRSIZ);
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 231:	6a 0e                	push   $0xe
 233:	50                   	push   %eax
 234:	ff b5 a4 fd ff ff    	push   -0x25c(%ebp)
 23a:	e8 41 03 00 00       	call   580 <memmove>
      p[DIRSIZ] = 0;
 23f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 245:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 249:	58                   	pop    %eax
 24a:	5a                   	pop    %edx
 24b:	56                   	push   %esi
 24c:	57                   	push   %edi
 24d:	e8 9e 02 00 00       	call   4f0 <stat>
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	0f 88 d3 00 00 00    	js     330 <ls+0x230>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 25d:	83 ec 0c             	sub    $0xc,%esp
 260:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 266:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 26c:	57                   	push   %edi
 26d:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 274:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 27a:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 280:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 286:	e8 d5 fd ff ff       	call   60 <fmtname>
 28b:	5a                   	pop    %edx
 28c:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 292:	59                   	pop    %ecx
 293:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 299:	51                   	push   %ecx
 29a:	52                   	push   %edx
 29b:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 2a1:	50                   	push   %eax
 2a2:	68 f0 0a 00 00       	push   $0xaf0
 2a7:	6a 01                	push   $0x1
 2a9:	e8 72 04 00 00       	call   720 <printf>
 2ae:	83 c4 20             	add    $0x20,%esp
 2b1:	e9 4a ff ff ff       	jmp    200 <ls+0x100>
 2b6:	66 90                	xchg   %ax,%ax
 2b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2bf:	00 
    printf(2, "ls: cannot open %s\n", path);
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	57                   	push   %edi
 2c4:	68 c8 0a 00 00       	push   $0xac8
 2c9:	6a 02                	push   $0x2
 2cb:	e8 50 04 00 00       	call   720 <printf>
}
 2d0:	8b 7d fc             	mov    -0x4(%ebp),%edi
    return;
 2d3:	83 c4 10             	add    $0x10,%esp
}
 2d6:	c9                   	leave
 2d7:	c3                   	ret
 2d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2df:	00 
      printf(1, "ls: path too long\n");
 2e0:	83 ec 08             	sub    $0x8,%esp
 2e3:	68 fd 0a 00 00       	push   $0xafd
 2e8:	6a 01                	push   $0x1
 2ea:	e8 31 04 00 00       	call   720 <printf>
      break;
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	e9 98 fe ff ff       	jmp    18f <ls+0x8f>
 2f7:	90                   	nop
 2f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2ff:	00 
    printf(2, "ls: cannot stat %s\n", path);
 300:	83 ec 04             	sub    $0x4,%esp
 303:	57                   	push   %edi
 304:	68 dc 0a 00 00       	push   $0xadc
 309:	6a 02                	push   $0x2
 30b:	e8 10 04 00 00       	call   720 <printf>
    close(fd);
 310:	89 1c 24             	mov    %ebx,(%esp)
 313:	e8 c7 02 00 00       	call   5df <close>
    return;
 318:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 31b:	8b 75 f8             	mov    -0x8(%ebp),%esi
 31e:	83 c4 10             	add    $0x10,%esp
}
 321:	8b 7d fc             	mov    -0x4(%ebp),%edi
 324:	c9                   	leave
 325:	c3                   	ret
 326:	66 90                	xchg   %ax,%ax
 328:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 32f:	00 
        printf(1, "ls: cannot stat %s\n", buf);
 330:	83 ec 04             	sub    $0x4,%esp
 333:	57                   	push   %edi
 334:	68 dc 0a 00 00       	push   $0xadc
 339:	6a 01                	push   $0x1
 33b:	e8 e0 03 00 00       	call   720 <printf>
        continue;
 340:	83 c4 10             	add    $0x10,%esp
 343:	e9 b8 fe ff ff       	jmp    200 <ls+0x100>
 348:	66 90                	xchg   %ax,%ax
 34a:	66 90                	xchg   %ax,%ax
 34c:	66 90                	xchg   %ax,%ax
 34e:	66 90                	xchg   %ax,%ax
 350:	66 90                	xchg   %ax,%ax
 352:	66 90                	xchg   %ax,%ax
 354:	66 90                	xchg   %ax,%ax
 356:	66 90                	xchg   %ax,%ax
 358:	66 90                	xchg   %ax,%ax
 35a:	66 90                	xchg   %ax,%ax
 35c:	66 90                	xchg   %ax,%ax
 35e:	66 90                	xchg   %ax,%ax

00000360 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 360:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 361:	31 c0                	xor    %eax,%eax
{
 363:	89 e5                	mov    %esp,%ebp
 365:	53                   	push   %ebx
 366:	8b 4d 08             	mov    0x8(%ebp),%ecx
 369:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 36c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 370:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 374:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 377:	83 c0 01             	add    $0x1,%eax
 37a:	84 d2                	test   %dl,%dl
 37c:	75 f2                	jne    370 <strcpy+0x10>
    ;
  return os;
}
 37e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 381:	89 c8                	mov    %ecx,%eax
 383:	c9                   	leave
 384:	c3                   	ret
 385:	8d 76 00             	lea    0x0(%esi),%esi
 388:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 38f:	00 

00000390 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	53                   	push   %ebx
 394:	8b 55 08             	mov    0x8(%ebp),%edx
 397:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 39a:	0f b6 02             	movzbl (%edx),%eax
 39d:	84 c0                	test   %al,%al
 39f:	75 2d                	jne    3ce <strcmp+0x3e>
 3a1:	eb 3d                	jmp    3e0 <strcmp+0x50>
 3a3:	eb 1b                	jmp    3c0 <strcmp+0x30>
 3a5:	8d 76 00             	lea    0x0(%esi),%esi
 3a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3af:	00 
 3b0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3b7:	00 
 3b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3bf:	00 
 3c0:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 3c4:	83 c2 01             	add    $0x1,%edx
 3c7:	83 c1 01             	add    $0x1,%ecx
  while(*p && *p == *q)
 3ca:	84 c0                	test   %al,%al
 3cc:	74 12                	je     3e0 <strcmp+0x50>
 3ce:	0f b6 19             	movzbl (%ecx),%ebx
 3d1:	38 c3                	cmp    %al,%bl
 3d3:	74 eb                	je     3c0 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
 3d5:	29 d8                	sub    %ebx,%eax
}
 3d7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3da:	c9                   	leave
 3db:	c3                   	ret
 3dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return (uchar)*p - (uchar)*q;
 3e0:	0f b6 19             	movzbl (%ecx),%ebx
 3e3:	31 c0                	xor    %eax,%eax
 3e5:	29 d8                	sub    %ebx,%eax
}
 3e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3ea:	c9                   	leave
 3eb:	c3                   	ret
 3ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003f0 <strlen>:

uint
strlen(const char *s)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 3f6:	80 3a 00             	cmpb   $0x0,(%edx)
 3f9:	74 15                	je     410 <strlen+0x20>
 3fb:	31 c0                	xor    %eax,%eax
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
 400:	83 c0 01             	add    $0x1,%eax
 403:	89 c1                	mov    %eax,%ecx
 405:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 409:	75 f5                	jne    400 <strlen+0x10>
    ;
  return n;
}
 40b:	89 c8                	mov    %ecx,%eax
 40d:	5d                   	pop    %ebp
 40e:	c3                   	ret
 40f:	90                   	nop
  for(n = 0; s[n]; n++)
 410:	31 c9                	xor    %ecx,%ecx
}
 412:	5d                   	pop    %ebp
 413:	89 c8                	mov    %ecx,%eax
 415:	c3                   	ret
 416:	66 90                	xchg   %ax,%ax
 418:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 41f:	00 

00000420 <memset>:

void*
memset(void *dst, int c, uint n)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 424:	8b 4d 10             	mov    0x10(%ebp),%ecx
 427:	8b 45 0c             	mov    0xc(%ebp),%eax
 42a:	8b 7d 08             	mov    0x8(%ebp),%edi
 42d:	fc                   	cld
 42e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 430:	8b 45 08             	mov    0x8(%ebp),%eax
 433:	8b 7d fc             	mov    -0x4(%ebp),%edi
 436:	c9                   	leave
 437:	c3                   	ret
 438:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 43f:	00 

00000440 <strchr>:

char*
strchr(const char *s, char c)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	8b 45 08             	mov    0x8(%ebp),%eax
 446:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 44a:	0f b6 10             	movzbl (%eax),%edx
 44d:	84 d2                	test   %dl,%dl
 44f:	75 1a                	jne    46b <strchr+0x2b>
 451:	eb 25                	jmp    478 <strchr+0x38>
 453:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 458:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 45f:	00 
 460:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 464:	83 c0 01             	add    $0x1,%eax
 467:	84 d2                	test   %dl,%dl
 469:	74 0d                	je     478 <strchr+0x38>
    if(*s == c)
 46b:	38 d1                	cmp    %dl,%cl
 46d:	75 f1                	jne    460 <strchr+0x20>
      return (char*)s;
  return 0;
}
 46f:	5d                   	pop    %ebp
 470:	c3                   	ret
 471:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 478:	31 c0                	xor    %eax,%eax
}
 47a:	5d                   	pop    %ebp
 47b:	c3                   	ret
 47c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000480 <gets>:

char*
gets(char *buf, int max)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 485:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 488:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 489:	31 db                	xor    %ebx,%ebx
{
 48b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 48e:	eb 27                	jmp    4b7 <gets+0x37>
    cc = read(0, &c, 1);
 490:	83 ec 04             	sub    $0x4,%esp
 493:	6a 01                	push   $0x1
 495:	57                   	push   %edi
 496:	6a 00                	push   $0x0
 498:	e8 32 01 00 00       	call   5cf <read>
    if(cc < 1)
 49d:	83 c4 10             	add    $0x10,%esp
 4a0:	85 c0                	test   %eax,%eax
 4a2:	7e 1d                	jle    4c1 <gets+0x41>
      break;
    buf[i++] = c;
 4a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4a8:	8b 55 08             	mov    0x8(%ebp),%edx
 4ab:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 4af:	3c 0a                	cmp    $0xa,%al
 4b1:	74 1d                	je     4d0 <gets+0x50>
 4b3:	3c 0d                	cmp    $0xd,%al
 4b5:	74 19                	je     4d0 <gets+0x50>
  for(i=0; i+1 < max; ){
 4b7:	89 de                	mov    %ebx,%esi
 4b9:	83 c3 01             	add    $0x1,%ebx
 4bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4bf:	7c cf                	jl     490 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 4c1:	8b 45 08             	mov    0x8(%ebp),%eax
 4c4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 4c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4cb:	5b                   	pop    %ebx
 4cc:	5e                   	pop    %esi
 4cd:	5f                   	pop    %edi
 4ce:	5d                   	pop    %ebp
 4cf:	c3                   	ret
  buf[i] = '\0';
 4d0:	8b 45 08             	mov    0x8(%ebp),%eax
    buf[i++] = c;
 4d3:	89 de                	mov    %ebx,%esi
  buf[i] = '\0';
 4d5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 4d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4dc:	5b                   	pop    %ebx
 4dd:	5e                   	pop    %esi
 4de:	5f                   	pop    %edi
 4df:	5d                   	pop    %ebp
 4e0:	c3                   	ret
 4e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4ef:	00 

000004f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4f6:	6a 00                	push   $0x0
 4f8:	ff 75 08             	push   0x8(%ebp)
{
 4fb:	89 75 fc             	mov    %esi,-0x4(%ebp)
  fd = open(n, O_RDONLY);
 4fe:	e8 f4 00 00 00       	call   5f7 <open>
  if(fd < 0)
 503:	83 c4 10             	add    $0x10,%esp
 506:	85 c0                	test   %eax,%eax
 508:	78 2e                	js     538 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 50a:	83 ec 08             	sub    $0x8,%esp
 50d:	ff 75 0c             	push   0xc(%ebp)
 510:	50                   	push   %eax
 511:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 514:	89 c3                	mov    %eax,%ebx
 516:	e8 f4 00 00 00       	call   60f <fstat>
  close(fd);
 51b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 51e:	89 c6                	mov    %eax,%esi
  close(fd);
 520:	e8 ba 00 00 00       	call   5df <close>
  return r;
 525:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 528:	83 c4 10             	add    $0x10,%esp
}
 52b:	89 f0                	mov    %esi,%eax
 52d:	8b 75 fc             	mov    -0x4(%ebp),%esi
 530:	c9                   	leave
 531:	c3                   	ret
 532:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
 538:	be ff ff ff ff       	mov    $0xffffffff,%esi
 53d:	eb ec                	jmp    52b <stat+0x3b>
 53f:	90                   	nop

00000540 <atoi>:

int
atoi(const char *s)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	53                   	push   %ebx
 544:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 547:	0f be 02             	movsbl (%edx),%eax
 54a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 54d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 550:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 555:	77 1e                	ja     575 <atoi+0x35>
 557:	90                   	nop
 558:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 55f:	00 
    n = n*10 + *s++ - '0';
 560:	83 c2 01             	add    $0x1,%edx
 563:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 566:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 56a:	0f be 02             	movsbl (%edx),%eax
 56d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 570:	80 fb 09             	cmp    $0x9,%bl
 573:	76 eb                	jbe    560 <atoi+0x20>
  return n;
}
 575:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 578:	89 c8                	mov    %ecx,%eax
 57a:	c9                   	leave
 57b:	c3                   	ret
 57c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000580 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	83 ec 08             	sub    $0x8,%esp
 586:	8b 45 10             	mov    0x10(%ebp),%eax
 589:	8b 55 08             	mov    0x8(%ebp),%edx
 58c:	89 75 f8             	mov    %esi,-0x8(%ebp)
 58f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 592:	85 c0                	test   %eax,%eax
 594:	7e 12                	jle    5a8 <memmove+0x28>
 596:	89 7d fc             	mov    %edi,-0x4(%ebp)
 599:	01 d0                	add    %edx,%eax
  dst = vdst;
 59b:	89 d7                	mov    %edx,%edi
 59d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 5a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 5a1:	39 f8                	cmp    %edi,%eax
 5a3:	75 fb                	jne    5a0 <memmove+0x20>
 5a5:	8b 7d fc             	mov    -0x4(%ebp),%edi
  return vdst;
}
 5a8:	8b 75 f8             	mov    -0x8(%ebp),%esi
 5ab:	89 d0                	mov    %edx,%eax
 5ad:	c9                   	leave
 5ae:	c3                   	ret

000005af <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5af:	b8 01 00 00 00       	mov    $0x1,%eax
 5b4:	cd 40                	int    $0x40
 5b6:	c3                   	ret

000005b7 <exit>:
SYSCALL(exit)
 5b7:	b8 02 00 00 00       	mov    $0x2,%eax
 5bc:	cd 40                	int    $0x40
 5be:	c3                   	ret

000005bf <wait>:
SYSCALL(wait)
 5bf:	b8 03 00 00 00       	mov    $0x3,%eax
 5c4:	cd 40                	int    $0x40
 5c6:	c3                   	ret

000005c7 <pipe>:
SYSCALL(pipe)
 5c7:	b8 04 00 00 00       	mov    $0x4,%eax
 5cc:	cd 40                	int    $0x40
 5ce:	c3                   	ret

000005cf <read>:
SYSCALL(read)
 5cf:	b8 05 00 00 00       	mov    $0x5,%eax
 5d4:	cd 40                	int    $0x40
 5d6:	c3                   	ret

000005d7 <write>:
SYSCALL(write)
 5d7:	b8 10 00 00 00       	mov    $0x10,%eax
 5dc:	cd 40                	int    $0x40
 5de:	c3                   	ret

000005df <close>:
SYSCALL(close)
 5df:	b8 15 00 00 00       	mov    $0x15,%eax
 5e4:	cd 40                	int    $0x40
 5e6:	c3                   	ret

000005e7 <kill>:
SYSCALL(kill)
 5e7:	b8 06 00 00 00       	mov    $0x6,%eax
 5ec:	cd 40                	int    $0x40
 5ee:	c3                   	ret

000005ef <exec>:
SYSCALL(exec)
 5ef:	b8 07 00 00 00       	mov    $0x7,%eax
 5f4:	cd 40                	int    $0x40
 5f6:	c3                   	ret

000005f7 <open>:
SYSCALL(open)
 5f7:	b8 0f 00 00 00       	mov    $0xf,%eax
 5fc:	cd 40                	int    $0x40
 5fe:	c3                   	ret

000005ff <mknod>:
SYSCALL(mknod)
 5ff:	b8 11 00 00 00       	mov    $0x11,%eax
 604:	cd 40                	int    $0x40
 606:	c3                   	ret

00000607 <unlink>:
SYSCALL(unlink)
 607:	b8 12 00 00 00       	mov    $0x12,%eax
 60c:	cd 40                	int    $0x40
 60e:	c3                   	ret

0000060f <fstat>:
SYSCALL(fstat)
 60f:	b8 08 00 00 00       	mov    $0x8,%eax
 614:	cd 40                	int    $0x40
 616:	c3                   	ret

00000617 <link>:
SYSCALL(link)
 617:	b8 13 00 00 00       	mov    $0x13,%eax
 61c:	cd 40                	int    $0x40
 61e:	c3                   	ret

0000061f <mkdir>:
SYSCALL(mkdir)
 61f:	b8 14 00 00 00       	mov    $0x14,%eax
 624:	cd 40                	int    $0x40
 626:	c3                   	ret

00000627 <chdir>:
SYSCALL(chdir)
 627:	b8 09 00 00 00       	mov    $0x9,%eax
 62c:	cd 40                	int    $0x40
 62e:	c3                   	ret

0000062f <dup>:
SYSCALL(dup)
 62f:	b8 0a 00 00 00       	mov    $0xa,%eax
 634:	cd 40                	int    $0x40
 636:	c3                   	ret

00000637 <getpid>:
SYSCALL(getpid)
 637:	b8 0b 00 00 00       	mov    $0xb,%eax
 63c:	cd 40                	int    $0x40
 63e:	c3                   	ret

0000063f <sbrk>:
SYSCALL(sbrk)
 63f:	b8 0c 00 00 00       	mov    $0xc,%eax
 644:	cd 40                	int    $0x40
 646:	c3                   	ret

00000647 <sleep>:
SYSCALL(sleep)
 647:	b8 0d 00 00 00       	mov    $0xd,%eax
 64c:	cd 40                	int    $0x40
 64e:	c3                   	ret

0000064f <uptime>:
SYSCALL(uptime)
 64f:	b8 0e 00 00 00       	mov    $0xe,%eax
 654:	cd 40                	int    $0x40
 656:	c3                   	ret
 657:	66 90                	xchg   %ax,%ax
 659:	66 90                	xchg   %ax,%ax
 65b:	66 90                	xchg   %ax,%ax
 65d:	66 90                	xchg   %ax,%ax
 65f:	90                   	nop

00000660 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	57                   	push   %edi
 664:	56                   	push   %esi
 665:	53                   	push   %ebx
 666:	89 cb                	mov    %ecx,%ebx
 668:	83 ec 3c             	sub    $0x3c,%esp
 66b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 66e:	85 d2                	test   %edx,%edx
 670:	0f 89 9a 00 00 00    	jns    710 <printint+0xb0>
 676:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 67a:	0f 84 90 00 00 00    	je     710 <printint+0xb0>
    neg = 1;
    x = -xx;
 680:	f7 da                	neg    %edx
    neg = 1;
 682:	b8 01 00 00 00       	mov    $0x1,%eax
 687:	89 45 c0             	mov    %eax,-0x40(%ebp)
 68a:	89 d1                	mov    %edx,%ecx
  } else {
    x = xx;
  }

  i = 0;
 68c:	31 f6                	xor    %esi,%esi
 68e:	66 90                	xchg   %ax,%ax
 690:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 697:	00 
 698:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 69f:	00 
  do{
    buf[i++] = digits[x % base];
 6a0:	89 c8                	mov    %ecx,%eax
 6a2:	31 d2                	xor    %edx,%edx
 6a4:	89 f7                	mov    %esi,%edi
 6a6:	f7 f3                	div    %ebx
 6a8:	8d 76 01             	lea    0x1(%esi),%esi
  }while((x /= base) != 0);
 6ab:	39 d9                	cmp    %ebx,%ecx
    buf[i++] = digits[x % base];
 6ad:	0f b6 92 74 0b 00 00 	movzbl 0xb74(%edx),%edx
  }while((x /= base) != 0);
 6b4:	89 c1                	mov    %eax,%ecx
    buf[i++] = digits[x % base];
 6b6:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 6ba:	73 e4                	jae    6a0 <printint+0x40>
  if(neg)
 6bc:	8b 45 c0             	mov    -0x40(%ebp),%eax
 6bf:	85 c0                	test   %eax,%eax
 6c1:	74 07                	je     6ca <printint+0x6a>
    buf[i++] = '-';
 6c3:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 6c8:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
 6ca:	8d 74 3d d8          	lea    -0x28(%ebp,%edi,1),%esi
 6ce:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 6d1:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 6d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 6df:	00 
    putc(fd, buf[i]);
 6e0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 6e3:	83 ec 04             	sub    $0x4,%esp
  while(--i >= 0)
 6e6:	83 ee 01             	sub    $0x1,%esi
 6e9:	88 45 d7             	mov    %al,-0x29(%ebp)
  write(fd, &c, 1);
 6ec:	8d 45 d7             	lea    -0x29(%ebp),%eax
 6ef:	6a 01                	push   $0x1
 6f1:	50                   	push   %eax
 6f2:	57                   	push   %edi
 6f3:	e8 df fe ff ff       	call   5d7 <write>
  while(--i >= 0)
 6f8:	83 c4 10             	add    $0x10,%esp
 6fb:	39 f3                	cmp    %esi,%ebx
 6fd:	75 e1                	jne    6e0 <printint+0x80>
}
 6ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
 702:	5b                   	pop    %ebx
 703:	5e                   	pop    %esi
 704:	5f                   	pop    %edi
 705:	5d                   	pop    %ebp
 706:	c3                   	ret
 707:	90                   	nop
 708:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 70f:	00 
  neg = 0;
 710:	31 c0                	xor    %eax,%eax
 712:	e9 70 ff ff ff       	jmp    687 <printint+0x27>
 717:	90                   	nop
 718:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 71f:	00 

00000720 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 720:	55                   	push   %ebp
 721:	89 e5                	mov    %esp,%ebp
 723:	83 ec 38             	sub    $0x38,%esp
 726:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 729:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 72c:	89 75 f8             	mov    %esi,-0x8(%ebp)
 72f:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 732:	0f b6 03             	movzbl (%ebx),%eax
 735:	84 c0                	test   %al,%al
 737:	0f 84 b6 00 00 00    	je     7f3 <printf+0xd3>
  ap = (uint*)(void*)&fmt + 1;
 73d:	8d 4d 10             	lea    0x10(%ebp),%ecx
 740:	89 7d fc             	mov    %edi,-0x4(%ebp)
 743:	83 c3 01             	add    $0x1,%ebx
 746:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
 749:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 74c:	0f b6 d0             	movzbl %al,%edx
    if(state == 0){
 74f:	eb 2a                	jmp    77b <printf+0x5b>
 751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 758:	83 ec 04             	sub    $0x4,%esp
 75b:	88 45 e7             	mov    %al,-0x19(%ebp)
 75e:	8d 45 e7             	lea    -0x19(%ebp),%eax
  for(i = 0; fmt[i]; i++){
 761:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 764:	6a 01                	push   $0x1
 766:	50                   	push   %eax
 767:	56                   	push   %esi
 768:	e8 6a fe ff ff       	call   5d7 <write>
  for(i = 0; fmt[i]; i++){
 76d:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
 771:	83 c4 10             	add    $0x10,%esp
 774:	84 c0                	test   %al,%al
 776:	74 78                	je     7f0 <printf+0xd0>
    c = fmt[i] & 0xff;
 778:	0f b6 d0             	movzbl %al,%edx
      if(c == '%'){
 77b:	83 fa 25             	cmp    $0x25,%edx
 77e:	75 d8                	jne    758 <printf+0x38>
  for(i = 0; fmt[i]; i++){
 780:	0f b6 13             	movzbl (%ebx),%edx
 783:	84 d2                	test   %dl,%dl
 785:	74 69                	je     7f0 <printf+0xd0>
    c = fmt[i] & 0xff;
 787:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 78a:	80 fa 25             	cmp    $0x25,%dl
 78d:	0f 84 25 01 00 00    	je     8b8 <printf+0x198>
 793:	83 e8 63             	sub    $0x63,%eax
 796:	83 f8 15             	cmp    $0x15,%eax
 799:	77 0d                	ja     7a8 <printf+0x88>
 79b:	ff 24 85 1c 0b 00 00 	jmp    *0xb1c(,%eax,4)
 7a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 7a8:	83 ec 04             	sub    $0x4,%esp
 7ab:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 7ae:	88 55 d0             	mov    %dl,-0x30(%ebp)
 7b1:	6a 01                	push   $0x1
 7b3:	51                   	push   %ecx
 7b4:	56                   	push   %esi
 7b5:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 7b8:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 7bc:	e8 16 fe ff ff       	call   5d7 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 7c1:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 7c5:	83 c4 0c             	add    $0xc,%esp
 7c8:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 7cb:	6a 01                	push   $0x1
 7cd:	88 55 e7             	mov    %dl,-0x19(%ebp)
 7d0:	51                   	push   %ecx
  for(i = 0; fmt[i]; i++){
 7d1:	83 c3 02             	add    $0x2,%ebx
  write(fd, &c, 1);
 7d4:	56                   	push   %esi
 7d5:	e8 fd fd ff ff       	call   5d7 <write>
  for(i = 0; fmt[i]; i++){
 7da:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
 7de:	83 c4 10             	add    $0x10,%esp
 7e1:	84 c0                	test   %al,%al
 7e3:	75 93                	jne    778 <printf+0x58>
 7e5:	8d 76 00             	lea    0x0(%esi),%esi
 7e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 7ef:	00 
 7f0:	8b 7d fc             	mov    -0x4(%ebp),%edi
      }
      state = 0;
    }
  }
}
 7f3:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 7f6:	8b 75 f8             	mov    -0x8(%ebp),%esi
 7f9:	c9                   	leave
 7fa:	c3                   	ret
 7fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 16, 0);
 800:	83 ec 0c             	sub    $0xc,%esp
 803:	8b 17                	mov    (%edi),%edx
 805:	b9 10 00 00 00       	mov    $0x10,%ecx
 80a:	89 f0                	mov    %esi,%eax
 80c:	6a 00                	push   $0x0
 80e:	e8 4d fe ff ff       	call   660 <printint>
  for(i = 0; fmt[i]; i++){
 813:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
 817:	83 c3 02             	add    $0x2,%ebx
 81a:	83 c4 10             	add    $0x10,%esp
 81d:	84 c0                	test   %al,%al
 81f:	74 cf                	je     7f0 <printf+0xd0>
        ap++;
 821:	83 c7 04             	add    $0x4,%edi
 824:	e9 4f ff ff ff       	jmp    778 <printf+0x58>
 829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 830:	83 ec 0c             	sub    $0xc,%esp
 833:	8b 17                	mov    (%edi),%edx
 835:	b9 0a 00 00 00       	mov    $0xa,%ecx
 83a:	89 f0                	mov    %esi,%eax
 83c:	6a 01                	push   $0x1
 83e:	e8 1d fe ff ff       	call   660 <printint>
  for(i = 0; fmt[i]; i++){
 843:	eb ce                	jmp    813 <printf+0xf3>
 845:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 848:	83 ec 04             	sub    $0x4,%esp
 84b:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        putc(fd, *ap);
 84e:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 850:	6a 01                	push   $0x1
 852:	51                   	push   %ecx
 853:	56                   	push   %esi
        putc(fd, *ap);
 854:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 857:	e8 7b fd ff ff       	call   5d7 <write>
 85c:	eb b5                	jmp    813 <printf+0xf3>
 85e:	66 90                	xchg   %ax,%ax
        s = (char*)*ap;
 860:	8b 07                	mov    (%edi),%eax
        ap++;
 862:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 865:	85 c0                	test   %eax,%eax
 867:	74 67                	je     8d0 <printf+0x1b0>
        while(*s != 0){
 869:	0f b6 10             	movzbl (%eax),%edx
 86c:	84 d2                	test   %dl,%dl
 86e:	74 6f                	je     8df <printf+0x1bf>
 870:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 873:	89 c7                	mov    %eax,%edi
 875:	89 d0                	mov    %edx,%eax
 877:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 87a:	89 fb                	mov    %edi,%ebx
 87c:	8d 7d e7             	lea    -0x19(%ebp),%edi
 87f:	90                   	nop
  write(fd, &c, 1);
 880:	83 ec 04             	sub    $0x4,%esp
          s++;
 883:	83 c3 01             	add    $0x1,%ebx
 886:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 889:	6a 01                	push   $0x1
 88b:	57                   	push   %edi
 88c:	56                   	push   %esi
 88d:	e8 45 fd ff ff       	call   5d7 <write>
        while(*s != 0){
 892:	0f b6 03             	movzbl (%ebx),%eax
 895:	83 c4 10             	add    $0x10,%esp
 898:	84 c0                	test   %al,%al
 89a:	75 e4                	jne    880 <printf+0x160>
 89c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
 89f:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
 8a3:	83 c3 02             	add    $0x2,%ebx
 8a6:	84 c0                	test   %al,%al
 8a8:	0f 85 9b fe ff ff    	jne    749 <printf+0x29>
 8ae:	e9 3d ff ff ff       	jmp    7f0 <printf+0xd0>
 8b3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 8b8:	83 ec 04             	sub    $0x4,%esp
 8bb:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 8bf:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 8c2:	6a 01                	push   $0x1
 8c4:	e9 07 ff ff ff       	jmp    7d0 <printf+0xb0>
 8c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
          s = "(null)";
 8d0:	89 7d d4             	mov    %edi,-0x2c(%ebp)
        if(s == 0)
 8d3:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 8d8:	bf 12 0b 00 00       	mov    $0xb12,%edi
 8dd:	eb 98                	jmp    877 <printf+0x157>
  for(i = 0; fmt[i]; i++){
 8df:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
 8e3:	83 c3 02             	add    $0x2,%ebx
 8e6:	84 c0                	test   %al,%al
 8e8:	0f 85 8a fe ff ff    	jne    778 <printf+0x58>
 8ee:	e9 fd fe ff ff       	jmp    7f0 <printf+0xd0>
 8f3:	66 90                	xchg   %ax,%ax
 8f5:	66 90                	xchg   %ax,%ax
 8f7:	66 90                	xchg   %ax,%ax
 8f9:	66 90                	xchg   %ax,%ax
 8fb:	66 90                	xchg   %ax,%ax
 8fd:	66 90                	xchg   %ax,%ax
 8ff:	90                   	nop

00000900 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 900:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 901:	a1 00 0f 00 00       	mov    0xf00,%eax
{
 906:	89 e5                	mov    %esp,%ebp
 908:	57                   	push   %edi
 909:	56                   	push   %esi
 90a:	53                   	push   %ebx
 90b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 90e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 911:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 918:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 91f:	00 
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 920:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 922:	39 c8                	cmp    %ecx,%eax
 924:	73 32                	jae    958 <free+0x58>
 926:	39 d1                	cmp    %edx,%ecx
 928:	72 04                	jb     92e <free+0x2e>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 92a:	39 d0                	cmp    %edx,%eax
 92c:	72 32                	jb     960 <free+0x60>
      break;
  if(bp + bp->s.size == p->s.ptr){
 92e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 931:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 934:	39 fa                	cmp    %edi,%edx
 936:	74 30                	je     968 <free+0x68>
 938:	89 53 f8             	mov    %edx,-0x8(%ebx)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 93b:	8b 50 04             	mov    0x4(%eax),%edx
 93e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 941:	39 f1                	cmp    %esi,%ecx
 943:	74 3a                	je     97f <free+0x7f>
 945:	89 08                	mov    %ecx,(%eax)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
}
 947:	5b                   	pop    %ebx
  freep = p;
 948:	a3 00 0f 00 00       	mov    %eax,0xf00
}
 94d:	5e                   	pop    %esi
 94e:	5f                   	pop    %edi
 94f:	5d                   	pop    %ebp
 950:	c3                   	ret
 951:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 958:	39 d0                	cmp    %edx,%eax
 95a:	72 04                	jb     960 <free+0x60>
 95c:	39 d1                	cmp    %edx,%ecx
 95e:	72 ce                	jb     92e <free+0x2e>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 960:	89 d0                	mov    %edx,%eax
 962:	eb bc                	jmp    920 <free+0x20>
 964:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 968:	03 72 04             	add    0x4(%edx),%esi
 96b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 96e:	8b 10                	mov    (%eax),%edx
 970:	8b 12                	mov    (%edx),%edx
 972:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 975:	8b 50 04             	mov    0x4(%eax),%edx
 978:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 97b:	39 f1                	cmp    %esi,%ecx
 97d:	75 c6                	jne    945 <free+0x45>
    p->s.size += bp->s.size;
 97f:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 982:	a3 00 0f 00 00       	mov    %eax,0xf00
    p->s.size += bp->s.size;
 987:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 98a:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 98d:	89 08                	mov    %ecx,(%eax)
}
 98f:	5b                   	pop    %ebx
 990:	5e                   	pop    %esi
 991:	5f                   	pop    %edi
 992:	5d                   	pop    %ebp
 993:	c3                   	ret
 994:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 998:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 99f:	00 

000009a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9a0:	55                   	push   %ebp
 9a1:	89 e5                	mov    %esp,%ebp
 9a3:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9a6:	8b 45 08             	mov    0x8(%ebp),%eax
{
 9a9:	89 7d fc             	mov    %edi,-0x4(%ebp)
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9ac:	8d 78 07             	lea    0x7(%eax),%edi
  if((prevp = freep) == 0){
 9af:	a1 00 0f 00 00       	mov    0xf00,%eax
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9b4:	c1 ef 03             	shr    $0x3,%edi
 9b7:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 9ba:	85 c0                	test   %eax,%eax
 9bc:	0f 84 c6 00 00 00    	je     a88 <malloc+0xe8>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9c2:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 9c4:	8b 4a 04             	mov    0x4(%edx),%ecx
 9c7:	39 f9                	cmp    %edi,%ecx
 9c9:	0f 83 87 00 00 00    	jae    a56 <malloc+0xb6>
 9cf:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 9d2:	89 75 f8             	mov    %esi,-0x8(%ebp)
  if(nu < 4096)
 9d5:	bb 00 10 00 00       	mov    $0x1000,%ebx
 9da:	39 df                	cmp    %ebx,%edi
 9dc:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 9df:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 9e6:	eb 21                	jmp    a09 <malloc+0x69>
 9e8:	eb 16                	jmp    a00 <malloc+0x60>
 9ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 9f0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 9f7:	00 
 9f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 9ff:	00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a00:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 a02:	8b 4a 04             	mov    0x4(%edx),%ecx
 a05:	39 f9                	cmp    %edi,%ecx
 a07:	73 47                	jae    a50 <malloc+0xb0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a09:	89 d0                	mov    %edx,%eax
 a0b:	39 15 00 0f 00 00    	cmp    %edx,0xf00
 a11:	75 ed                	jne    a00 <malloc+0x60>
  p = sbrk(nu * sizeof(Header));
 a13:	83 ec 0c             	sub    $0xc,%esp
 a16:	56                   	push   %esi
 a17:	e8 23 fc ff ff       	call   63f <sbrk>
  if(p == (char*)-1)
 a1c:	83 c4 10             	add    $0x10,%esp
 a1f:	83 f8 ff             	cmp    $0xffffffff,%eax
 a22:	74 54                	je     a78 <malloc+0xd8>
  hp->s.size = nu;
 a24:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a27:	83 ec 0c             	sub    $0xc,%esp
 a2a:	83 c0 08             	add    $0x8,%eax
 a2d:	50                   	push   %eax
 a2e:	e8 cd fe ff ff       	call   900 <free>
  return freep;
 a33:	a1 00 0f 00 00       	mov    0xf00,%eax
      if((p = morecore(nunits)) == 0)
 a38:	83 c4 10             	add    $0x10,%esp
 a3b:	85 c0                	test   %eax,%eax
 a3d:	75 c1                	jne    a00 <malloc+0x60>
 a3f:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 a42:	8b 75 f8             	mov    -0x8(%ebp),%esi
 a45:	eb 26                	jmp    a6d <malloc+0xcd>
 a47:	90                   	nop
 a48:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 a4f:	00 
 a50:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 a53:	8b 75 f8             	mov    -0x8(%ebp),%esi
      if(p->s.size == nunits)
 a56:	39 cf                	cmp    %ecx,%edi
 a58:	74 66                	je     ac0 <malloc+0x120>
        p->s.size -= nunits;
 a5a:	29 f9                	sub    %edi,%ecx
 a5c:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 a5f:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 a62:	89 7a 04             	mov    %edi,0x4(%edx)
      freep = prevp;
 a65:	a3 00 0f 00 00       	mov    %eax,0xf00
      return (void*)(p + 1);
 a6a:	8d 42 08             	lea    0x8(%edx),%eax
        return 0;
  }
}
 a6d:	8b 7d fc             	mov    -0x4(%ebp),%edi
 a70:	c9                   	leave
 a71:	c3                   	ret
 a72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        return 0;
 a78:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 a7b:	8b 75 f8             	mov    -0x8(%ebp),%esi
 a7e:	31 c0                	xor    %eax,%eax
}
 a80:	8b 7d fc             	mov    -0x4(%ebp),%edi
 a83:	c9                   	leave
 a84:	c3                   	ret
 a85:	8d 76 00             	lea    0x0(%esi),%esi
 a88:	89 5d f4             	mov    %ebx,-0xc(%ebp)
    base.s.size = 0;
 a8b:	ba 04 0f 00 00       	mov    $0xf04,%edx
 a90:	89 75 f8             	mov    %esi,-0x8(%ebp)
    base.s.ptr = freep = prevp = &base;
 a93:	c7 05 00 0f 00 00 04 	movl   $0xf04,0xf00
 a9a:	0f 00 00 
 a9d:	c7 05 04 0f 00 00 04 	movl   $0xf04,0xf04
 aa4:	0f 00 00 
    base.s.size = 0;
 aa7:	c7 05 08 0f 00 00 00 	movl   $0x0,0xf08
 aae:	00 00 00 
    if(p->s.size >= nunits){
 ab1:	e9 1f ff ff ff       	jmp    9d5 <malloc+0x35>
 ab6:	66 90                	xchg   %ax,%ax
 ab8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 abf:	00 
        prevp->s.ptr = p->s.ptr;
 ac0:	8b 0a                	mov    (%edx),%ecx
 ac2:	89 08                	mov    %ecx,(%eax)
 ac4:	eb 9f                	jmp    a65 <malloc+0xc5>
