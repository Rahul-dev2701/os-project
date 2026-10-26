
_grep:     file format elf32-i386


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
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 01                	mov    (%ecx),%eax
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;
  char *pattern;

  if(argc <= 1){
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	7e 6f                	jle    90 <main+0x90>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  21:	8b 43 04             	mov    0x4(%ebx),%eax
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  24:	be 02 00 00 00       	mov    $0x2,%esi
  29:	83 c3 08             	add    $0x8,%ebx
  pattern = argv[1];
  2c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(argc <= 2){
  2f:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
  33:	74 6e                	je     a3 <main+0xa3>
  35:	8d 76 00             	lea    0x0(%esi),%esi
  38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  3f:	00 
    if((fd = open(argv[i], 0)) < 0){
  40:	83 ec 08             	sub    $0x8,%esp
  43:	6a 00                	push   $0x0
  45:	ff 33                	push   (%ebx)
  47:	e8 eb 05 00 00       	call   637 <open>
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	89 c7                	mov    %eax,%edi
  51:	85 c0                	test   %eax,%eax
  53:	78 27                	js     7c <main+0x7c>
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  55:	83 ec 08             	sub    $0x8,%esp
  for(i = 2; i < argc; i++){
  58:	83 c6 01             	add    $0x1,%esi
  5b:	83 c3 04             	add    $0x4,%ebx
    grep(pattern, fd);
  5e:	50                   	push   %eax
  5f:	ff 75 e0             	push   -0x20(%ebp)
  62:	e8 89 01 00 00       	call   1f0 <grep>
    close(fd);
  67:	89 3c 24             	mov    %edi,(%esp)
  6a:	e8 b0 05 00 00       	call   61f <close>
  for(i = 2; i < argc; i++){
  6f:	83 c4 10             	add    $0x10,%esp
  72:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  75:	7f c9                	jg     40 <main+0x40>
  }
  exit();
  77:	e8 7b 05 00 00       	call   5f7 <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
  7c:	50                   	push   %eax
  7d:	ff 33                	push   (%ebx)
  7f:	68 28 0b 00 00       	push   $0xb28
  84:	6a 01                	push   $0x1
  86:	e8 d5 06 00 00       	call   760 <printf>
      exit();
  8b:	e8 67 05 00 00       	call   5f7 <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  90:	51                   	push   %ecx
  91:	51                   	push   %ecx
  92:	68 08 0b 00 00       	push   $0xb08
  97:	6a 02                	push   $0x2
  99:	e8 c2 06 00 00       	call   760 <printf>
    exit();
  9e:	e8 54 05 00 00       	call   5f7 <exit>
    grep(pattern, 0);
  a3:	52                   	push   %edx
  a4:	52                   	push   %edx
  a5:	6a 00                	push   $0x0
  a7:	50                   	push   %eax
  a8:	e8 43 01 00 00       	call   1f0 <grep>
    exit();
  ad:	e8 45 05 00 00       	call   5f7 <exit>
  b2:	66 90                	xchg   %ax,%ax
  b4:	66 90                	xchg   %ax,%ax
  b6:	66 90                	xchg   %ax,%ax
  b8:	66 90                	xchg   %ax,%ax
  ba:	66 90                	xchg   %ax,%ax
  bc:	66 90                	xchg   %ax,%ax
  be:	66 90                	xchg   %ax,%ax

000000c0 <matchhere>:
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	83 ec 28             	sub    $0x28,%esp
  c6:	89 75 f8             	mov    %esi,-0x8(%ebp)
  c9:	8b 75 08             	mov    0x8(%ebp),%esi
  cc:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  cf:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '\0')
  d2:	0f b6 16             	movzbl (%esi),%edx
  d5:	84 d2                	test   %dl,%dl
  d7:	75 20                	jne    f9 <matchhere+0x39>
  d9:	eb 55                	jmp    130 <matchhere+0x70>
  db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  e0:	84 c9                	test   %cl,%cl
  e2:	74 3c                	je     120 <matchhere+0x60>
  e4:	80 fa 2e             	cmp    $0x2e,%dl
  e7:	74 04                	je     ed <matchhere+0x2d>
  e9:	38 d1                	cmp    %dl,%cl
  eb:	75 33                	jne    120 <matchhere+0x60>
  if(re[0] == '\0')
  ed:	84 c0                	test   %al,%al
  ef:	74 3f                	je     130 <matchhere+0x70>
    return matchhere(re+1, text+1);
  f1:	83 c3 01             	add    $0x1,%ebx
  f4:	83 c6 01             	add    $0x1,%esi
{
  f7:	89 c2                	mov    %eax,%edx
  if(re[1] == '*')
  f9:	0f b6 46 01          	movzbl 0x1(%esi),%eax
  fd:	3c 2a                	cmp    $0x2a,%al
  ff:	74 3f                	je     140 <matchhere+0x80>
    return *text == '\0';
 101:	0f b6 0b             	movzbl (%ebx),%ecx
  if(re[0] == '$' && re[1] == '\0')
 104:	80 fa 24             	cmp    $0x24,%dl
 107:	75 d7                	jne    e0 <matchhere+0x20>
 109:	84 c0                	test   %al,%al
 10b:	74 7a                	je     187 <matchhere+0xc7>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 10d:	84 c9                	test   %cl,%cl
 10f:	74 0f                	je     120 <matchhere+0x60>
 111:	80 f9 24             	cmp    $0x24,%cl
 114:	74 db                	je     f1 <matchhere+0x31>
 116:	66 90                	xchg   %ax,%ax
 118:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 11f:	00 
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  return 0;
 120:	31 c0                	xor    %eax,%eax
}
 122:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 125:	8b 75 f8             	mov    -0x8(%ebp),%esi
 128:	c9                   	leave
 129:	c3                   	ret
 12a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 130:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 133:	8b 75 f8             	mov    -0x8(%ebp),%esi
    return 1;
 136:	b8 01 00 00 00       	mov    $0x1,%eax
}
 13b:	c9                   	leave
 13c:	c3                   	ret
 13d:	8d 76 00             	lea    0x0(%esi),%esi
    return matchstar(re[0], re+2, text);
 140:	83 c6 02             	add    $0x2,%esi
  }while(*text!='\0' && (*text++==c || c=='.'));
 143:	80 fa 2e             	cmp    $0x2e,%dl
 146:	89 7d fc             	mov    %edi,-0x4(%ebp)
 149:	0f 94 c0             	sete   %al
 14c:	89 c7                	mov    %eax,%edi
 14e:	66 90                	xchg   %ax,%ax
    if(matchhere(re, text))
 150:	83 ec 08             	sub    $0x8,%esp
 153:	88 55 e7             	mov    %dl,-0x19(%ebp)
 156:	53                   	push   %ebx
 157:	56                   	push   %esi
 158:	e8 63 ff ff ff       	call   c0 <matchhere>
 15d:	83 c4 10             	add    $0x10,%esp
 160:	85 c0                	test   %eax,%eax
 162:	75 18                	jne    17c <matchhere+0xbc>
  }while(*text!='\0' && (*text++==c || c=='.'));
 164:	0f b6 0b             	movzbl (%ebx),%ecx
 167:	84 c9                	test   %cl,%cl
 169:	74 11                	je     17c <matchhere+0xbc>
 16b:	0f b6 55 e7          	movzbl -0x19(%ebp),%edx
 16f:	83 c3 01             	add    $0x1,%ebx
 172:	38 d1                	cmp    %dl,%cl
 174:	74 da                	je     150 <matchhere+0x90>
 176:	89 f9                	mov    %edi,%ecx
 178:	84 c9                	test   %cl,%cl
 17a:	75 d4                	jne    150 <matchhere+0x90>
 17c:	8b 7d fc             	mov    -0x4(%ebp),%edi
}
 17f:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 182:	8b 75 f8             	mov    -0x8(%ebp),%esi
 185:	c9                   	leave
 186:	c3                   	ret
    return *text == '\0';
 187:	31 c0                	xor    %eax,%eax
 189:	84 c9                	test   %cl,%cl
 18b:	0f 94 c0             	sete   %al
 18e:	eb 92                	jmp    122 <matchhere+0x62>

00000190 <match>:
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	56                   	push   %esi
 194:	53                   	push   %ebx
 195:	8b 75 08             	mov    0x8(%ebp),%esi
 198:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
 19b:	80 3e 5e             	cmpb   $0x5e,(%esi)
 19e:	75 11                	jne    1b1 <match+0x21>
 1a0:	eb 2e                	jmp    1d0 <match+0x40>
 1a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
 1a8:	83 c3 01             	add    $0x1,%ebx
 1ab:	80 7b ff 00          	cmpb   $0x0,-0x1(%ebx)
 1af:	74 11                	je     1c2 <match+0x32>
    if(matchhere(re, text))
 1b1:	83 ec 08             	sub    $0x8,%esp
 1b4:	53                   	push   %ebx
 1b5:	56                   	push   %esi
 1b6:	e8 05 ff ff ff       	call   c0 <matchhere>
 1bb:	83 c4 10             	add    $0x10,%esp
 1be:	85 c0                	test   %eax,%eax
 1c0:	74 e6                	je     1a8 <match+0x18>
}
 1c2:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1c5:	5b                   	pop    %ebx
 1c6:	5e                   	pop    %esi
 1c7:	5d                   	pop    %ebp
 1c8:	c3                   	ret
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return matchhere(re+1, text);
 1d0:	83 c6 01             	add    $0x1,%esi
 1d3:	89 75 08             	mov    %esi,0x8(%ebp)
}
 1d6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1d9:	5b                   	pop    %ebx
 1da:	5e                   	pop    %esi
 1db:	5d                   	pop    %ebp
    return matchhere(re+1, text);
 1dc:	e9 df fe ff ff       	jmp    c0 <matchhere>
 1e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1ef:	00 

000001f0 <grep>:
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	57                   	push   %edi
 1f4:	56                   	push   %esi
 1f5:	53                   	push   %ebx
 1f6:	83 ec 1c             	sub    $0x1c,%esp
 1f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
 1fc:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    return matchhere(re+1, text);
 203:	8d 43 01             	lea    0x1(%ebx),%eax
 206:	89 45 dc             	mov    %eax,-0x24(%ebp)
 209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 210:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 213:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 218:	83 ec 04             	sub    $0x4,%esp
 21b:	29 c8                	sub    %ecx,%eax
 21d:	50                   	push   %eax
 21e:	8d 81 80 0f 00 00    	lea    0xf80(%ecx),%eax
 224:	50                   	push   %eax
 225:	ff 75 0c             	push   0xc(%ebp)
 228:	e8 e2 03 00 00       	call   60f <read>
 22d:	83 c4 10             	add    $0x10,%esp
 230:	85 c0                	test   %eax,%eax
 232:	0f 8e fd 00 00 00    	jle    335 <grep+0x145>
    m += n;
 238:	01 45 e0             	add    %eax,-0x20(%ebp)
 23b:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    buf[m] = '\0';
 23e:	bf 80 0f 00 00       	mov    $0xf80,%edi
 243:	89 de                	mov    %ebx,%esi
 245:	c6 81 80 0f 00 00 00 	movb   $0x0,0xf80(%ecx)
    while((q = strchr(p, '\n')) != 0){
 24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 250:	83 ec 08             	sub    $0x8,%esp
 253:	6a 0a                	push   $0xa
 255:	57                   	push   %edi
 256:	e8 25 02 00 00       	call   480 <strchr>
 25b:	83 c4 10             	add    $0x10,%esp
 25e:	89 c2                	mov    %eax,%edx
 260:	85 c0                	test   %eax,%eax
 262:	0f 84 88 00 00 00    	je     2f0 <grep+0x100>
      *q = 0;
 268:	c6 02 00             	movb   $0x0,(%edx)
  if(re[0] == '^')
 26b:	80 3e 5e             	cmpb   $0x5e,(%esi)
 26e:	74 58                	je     2c8 <grep+0xd8>
 270:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 273:	89 d3                	mov    %edx,%ebx
 275:	eb 12                	jmp    289 <grep+0x99>
 277:	90                   	nop
 278:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 27f:	00 
  }while(*text++ != '\0');
 280:	83 c7 01             	add    $0x1,%edi
 283:	80 7f ff 00          	cmpb   $0x0,-0x1(%edi)
 287:	74 37                	je     2c0 <grep+0xd0>
    if(matchhere(re, text))
 289:	83 ec 08             	sub    $0x8,%esp
 28c:	57                   	push   %edi
 28d:	56                   	push   %esi
 28e:	e8 2d fe ff ff       	call   c0 <matchhere>
 293:	83 c4 10             	add    $0x10,%esp
 296:	85 c0                	test   %eax,%eax
 298:	74 e6                	je     280 <grep+0x90>
        write(1, p, q+1 - p);
 29a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 29d:	89 da                	mov    %ebx,%edx
 29f:	8d 5b 01             	lea    0x1(%ebx),%ebx
 2a2:	89 d8                	mov    %ebx,%eax
 2a4:	83 ec 04             	sub    $0x4,%esp
        *q = '\n';
 2a7:	c6 02 0a             	movb   $0xa,(%edx)
        write(1, p, q+1 - p);
 2aa:	29 f8                	sub    %edi,%eax
 2ac:	50                   	push   %eax
 2ad:	57                   	push   %edi
 2ae:	89 df                	mov    %ebx,%edi
 2b0:	6a 01                	push   $0x1
 2b2:	e8 60 03 00 00       	call   617 <write>
 2b7:	83 c4 10             	add    $0x10,%esp
 2ba:	eb 94                	jmp    250 <grep+0x60>
 2bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2c0:	8d 7b 01             	lea    0x1(%ebx),%edi
      p = q+1;
 2c3:	eb 8b                	jmp    250 <grep+0x60>
 2c5:	8d 76 00             	lea    0x0(%esi),%esi
    return matchhere(re+1, text);
 2c8:	83 ec 08             	sub    $0x8,%esp
 2cb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 2ce:	57                   	push   %edi
 2cf:	ff 75 dc             	push   -0x24(%ebp)
 2d2:	e8 e9 fd ff ff       	call   c0 <matchhere>
        write(1, p, q+1 - p);
 2d7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    return matchhere(re+1, text);
 2da:	83 c4 10             	add    $0x10,%esp
        write(1, p, q+1 - p);
 2dd:	8d 5a 01             	lea    0x1(%edx),%ebx
      if(match(pattern, p)){
 2e0:	85 c0                	test   %eax,%eax
 2e2:	75 be                	jne    2a2 <grep+0xb2>
        write(1, p, q+1 - p);
 2e4:	89 df                	mov    %ebx,%edi
 2e6:	e9 65 ff ff ff       	jmp    250 <grep+0x60>
 2eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    if(p == buf)
 2f0:	89 f3                	mov    %esi,%ebx
 2f2:	81 ff 80 0f 00 00    	cmp    $0xf80,%edi
 2f8:	74 2f                	je     329 <grep+0x139>
    if(m > 0){
 2fa:	8b 45 e0             	mov    -0x20(%ebp),%eax
 2fd:	85 c0                	test   %eax,%eax
 2ff:	0f 8e 0b ff ff ff    	jle    210 <grep+0x20>
      m -= p - buf;
 305:	89 f8                	mov    %edi,%eax
      memmove(buf, p, m);
 307:	83 ec 04             	sub    $0x4,%esp
      m -= p - buf;
 30a:	2d 80 0f 00 00       	sub    $0xf80,%eax
 30f:	29 45 e0             	sub    %eax,-0x20(%ebp)
 312:	8b 4d e0             	mov    -0x20(%ebp),%ecx
      memmove(buf, p, m);
 315:	51                   	push   %ecx
 316:	57                   	push   %edi
 317:	68 80 0f 00 00       	push   $0xf80
 31c:	e8 9f 02 00 00       	call   5c0 <memmove>
 321:	83 c4 10             	add    $0x10,%esp
 324:	e9 e7 fe ff ff       	jmp    210 <grep+0x20>
      m = 0;
 329:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 330:	e9 db fe ff ff       	jmp    210 <grep+0x20>
}
 335:	8d 65 f4             	lea    -0xc(%ebp),%esp
 338:	5b                   	pop    %ebx
 339:	5e                   	pop    %esi
 33a:	5f                   	pop    %edi
 33b:	5d                   	pop    %ebp
 33c:	c3                   	ret
 33d:	8d 76 00             	lea    0x0(%esi),%esi

00000340 <matchstar>:
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	57                   	push   %edi
 344:	56                   	push   %esi
 345:	53                   	push   %ebx
 346:	83 ec 1c             	sub    $0x1c,%esp
 349:	8b 5d 08             	mov    0x8(%ebp),%ebx
 34c:	8b 75 0c             	mov    0xc(%ebp),%esi
 34f:	8b 7d 10             	mov    0x10(%ebp),%edi
  }while(*text!='\0' && (*text++==c || c=='.'));
 352:	83 fb 2e             	cmp    $0x2e,%ebx
 355:	0f 94 45 e7          	sete   -0x19(%ebp)
 359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(matchhere(re, text))
 360:	83 ec 08             	sub    $0x8,%esp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
 365:	e8 56 fd ff ff       	call   c0 <matchhere>
 36a:	83 c4 10             	add    $0x10,%esp
 36d:	89 c1                	mov    %eax,%ecx
 36f:	85 c0                	test   %eax,%eax
 371:	75 14                	jne    387 <matchstar+0x47>
  }while(*text!='\0' && (*text++==c || c=='.'));
 373:	0f be 07             	movsbl (%edi),%eax
 376:	84 c0                	test   %al,%al
 378:	74 0d                	je     387 <matchstar+0x47>
 37a:	83 c7 01             	add    $0x1,%edi
 37d:	39 d8                	cmp    %ebx,%eax
 37f:	74 df                	je     360 <matchstar+0x20>
 381:	80 7d e7 00          	cmpb   $0x0,-0x19(%ebp)
 385:	75 d9                	jne    360 <matchstar+0x20>
}
 387:	8d 65 f4             	lea    -0xc(%ebp),%esp
 38a:	89 c8                	mov    %ecx,%eax
 38c:	5b                   	pop    %ebx
 38d:	5e                   	pop    %esi
 38e:	5f                   	pop    %edi
 38f:	5d                   	pop    %ebp
 390:	c3                   	ret
 391:	66 90                	xchg   %ax,%ax
 393:	66 90                	xchg   %ax,%ax
 395:	66 90                	xchg   %ax,%ax
 397:	66 90                	xchg   %ax,%ax
 399:	66 90                	xchg   %ax,%ax
 39b:	66 90                	xchg   %ax,%ax
 39d:	66 90                	xchg   %ax,%ax
 39f:	90                   	nop

000003a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 3a0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3a1:	31 c0                	xor    %eax,%eax
{
 3a3:	89 e5                	mov    %esp,%ebp
 3a5:	53                   	push   %ebx
 3a6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 3b0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 3b4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 3b7:	83 c0 01             	add    $0x1,%eax
 3ba:	84 d2                	test   %dl,%dl
 3bc:	75 f2                	jne    3b0 <strcpy+0x10>
    ;
  return os;
}
 3be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3c1:	89 c8                	mov    %ecx,%eax
 3c3:	c9                   	leave
 3c4:	c3                   	ret
 3c5:	8d 76 00             	lea    0x0(%esi),%esi
 3c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3cf:	00 

000003d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	53                   	push   %ebx
 3d4:	8b 55 08             	mov    0x8(%ebp),%edx
 3d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 3da:	0f b6 02             	movzbl (%edx),%eax
 3dd:	84 c0                	test   %al,%al
 3df:	75 2d                	jne    40e <strcmp+0x3e>
 3e1:	eb 3d                	jmp    420 <strcmp+0x50>
 3e3:	eb 1b                	jmp    400 <strcmp+0x30>
 3e5:	8d 76 00             	lea    0x0(%esi),%esi
 3e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ef:	00 
 3f0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3f7:	00 
 3f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ff:	00 
 400:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 404:	83 c2 01             	add    $0x1,%edx
 407:	83 c1 01             	add    $0x1,%ecx
  while(*p && *p == *q)
 40a:	84 c0                	test   %al,%al
 40c:	74 12                	je     420 <strcmp+0x50>
 40e:	0f b6 19             	movzbl (%ecx),%ebx
 411:	38 c3                	cmp    %al,%bl
 413:	74 eb                	je     400 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
 415:	29 d8                	sub    %ebx,%eax
}
 417:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 41a:	c9                   	leave
 41b:	c3                   	ret
 41c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return (uchar)*p - (uchar)*q;
 420:	0f b6 19             	movzbl (%ecx),%ebx
 423:	31 c0                	xor    %eax,%eax
 425:	29 d8                	sub    %ebx,%eax
}
 427:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 42a:	c9                   	leave
 42b:	c3                   	ret
 42c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000430 <strlen>:

uint
strlen(const char *s)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 436:	80 3a 00             	cmpb   $0x0,(%edx)
 439:	74 15                	je     450 <strlen+0x20>
 43b:	31 c0                	xor    %eax,%eax
 43d:	8d 76 00             	lea    0x0(%esi),%esi
 440:	83 c0 01             	add    $0x1,%eax
 443:	89 c1                	mov    %eax,%ecx
 445:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 449:	75 f5                	jne    440 <strlen+0x10>
    ;
  return n;
}
 44b:	89 c8                	mov    %ecx,%eax
 44d:	5d                   	pop    %ebp
 44e:	c3                   	ret
 44f:	90                   	nop
  for(n = 0; s[n]; n++)
 450:	31 c9                	xor    %ecx,%ecx
}
 452:	5d                   	pop    %ebp
 453:	89 c8                	mov    %ecx,%eax
 455:	c3                   	ret
 456:	66 90                	xchg   %ax,%ax
 458:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 45f:	00 

00000460 <memset>:

void*
memset(void *dst, int c, uint n)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 464:	8b 4d 10             	mov    0x10(%ebp),%ecx
 467:	8b 45 0c             	mov    0xc(%ebp),%eax
 46a:	8b 7d 08             	mov    0x8(%ebp),%edi
 46d:	fc                   	cld
 46e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 470:	8b 45 08             	mov    0x8(%ebp),%eax
 473:	8b 7d fc             	mov    -0x4(%ebp),%edi
 476:	c9                   	leave
 477:	c3                   	ret
 478:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 47f:	00 

00000480 <strchr>:

char*
strchr(const char *s, char c)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	8b 45 08             	mov    0x8(%ebp),%eax
 486:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 48a:	0f b6 10             	movzbl (%eax),%edx
 48d:	84 d2                	test   %dl,%dl
 48f:	75 1a                	jne    4ab <strchr+0x2b>
 491:	eb 25                	jmp    4b8 <strchr+0x38>
 493:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 498:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 49f:	00 
 4a0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 4a4:	83 c0 01             	add    $0x1,%eax
 4a7:	84 d2                	test   %dl,%dl
 4a9:	74 0d                	je     4b8 <strchr+0x38>
    if(*s == c)
 4ab:	38 d1                	cmp    %dl,%cl
 4ad:	75 f1                	jne    4a0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 4af:	5d                   	pop    %ebp
 4b0:	c3                   	ret
 4b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 4b8:	31 c0                	xor    %eax,%eax
}
 4ba:	5d                   	pop    %ebp
 4bb:	c3                   	ret
 4bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004c0 <gets>:

char*
gets(char *buf, int max)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	57                   	push   %edi
 4c4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 4c5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 4c8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 4c9:	31 db                	xor    %ebx,%ebx
{
 4cb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 4ce:	eb 27                	jmp    4f7 <gets+0x37>
    cc = read(0, &c, 1);
 4d0:	83 ec 04             	sub    $0x4,%esp
 4d3:	6a 01                	push   $0x1
 4d5:	57                   	push   %edi
 4d6:	6a 00                	push   $0x0
 4d8:	e8 32 01 00 00       	call   60f <read>
    if(cc < 1)
 4dd:	83 c4 10             	add    $0x10,%esp
 4e0:	85 c0                	test   %eax,%eax
 4e2:	7e 1d                	jle    501 <gets+0x41>
      break;
    buf[i++] = c;
 4e4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4e8:	8b 55 08             	mov    0x8(%ebp),%edx
 4eb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 4ef:	3c 0a                	cmp    $0xa,%al
 4f1:	74 1d                	je     510 <gets+0x50>
 4f3:	3c 0d                	cmp    $0xd,%al
 4f5:	74 19                	je     510 <gets+0x50>
  for(i=0; i+1 < max; ){
 4f7:	89 de                	mov    %ebx,%esi
 4f9:	83 c3 01             	add    $0x1,%ebx
 4fc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4ff:	7c cf                	jl     4d0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 501:	8b 45 08             	mov    0x8(%ebp),%eax
 504:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 508:	8d 65 f4             	lea    -0xc(%ebp),%esp
 50b:	5b                   	pop    %ebx
 50c:	5e                   	pop    %esi
 50d:	5f                   	pop    %edi
 50e:	5d                   	pop    %ebp
 50f:	c3                   	ret
  buf[i] = '\0';
 510:	8b 45 08             	mov    0x8(%ebp),%eax
    buf[i++] = c;
 513:	89 de                	mov    %ebx,%esi
  buf[i] = '\0';
 515:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 519:	8d 65 f4             	lea    -0xc(%ebp),%esp
 51c:	5b                   	pop    %ebx
 51d:	5e                   	pop    %esi
 51e:	5f                   	pop    %edi
 51f:	5d                   	pop    %ebp
 520:	c3                   	ret
 521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 528:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 52f:	00 

00000530 <stat>:

int
stat(const char *n, struct stat *st)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 536:	6a 00                	push   $0x0
 538:	ff 75 08             	push   0x8(%ebp)
{
 53b:	89 75 fc             	mov    %esi,-0x4(%ebp)
  fd = open(n, O_RDONLY);
 53e:	e8 f4 00 00 00       	call   637 <open>
  if(fd < 0)
 543:	83 c4 10             	add    $0x10,%esp
 546:	85 c0                	test   %eax,%eax
 548:	78 2e                	js     578 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 54a:	83 ec 08             	sub    $0x8,%esp
 54d:	ff 75 0c             	push   0xc(%ebp)
 550:	50                   	push   %eax
 551:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 554:	89 c3                	mov    %eax,%ebx
 556:	e8 f4 00 00 00       	call   64f <fstat>
  close(fd);
 55b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 55e:	89 c6                	mov    %eax,%esi
  close(fd);
 560:	e8 ba 00 00 00       	call   61f <close>
  return r;
 565:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 568:	83 c4 10             	add    $0x10,%esp
}
 56b:	89 f0                	mov    %esi,%eax
 56d:	8b 75 fc             	mov    -0x4(%ebp),%esi
 570:	c9                   	leave
 571:	c3                   	ret
 572:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
 578:	be ff ff ff ff       	mov    $0xffffffff,%esi
 57d:	eb ec                	jmp    56b <stat+0x3b>
 57f:	90                   	nop

00000580 <atoi>:

int
atoi(const char *s)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	53                   	push   %ebx
 584:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 587:	0f be 02             	movsbl (%edx),%eax
 58a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 58d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 590:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 595:	77 1e                	ja     5b5 <atoi+0x35>
 597:	90                   	nop
 598:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 59f:	00 
    n = n*10 + *s++ - '0';
 5a0:	83 c2 01             	add    $0x1,%edx
 5a3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 5a6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 5aa:	0f be 02             	movsbl (%edx),%eax
 5ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5b0:	80 fb 09             	cmp    $0x9,%bl
 5b3:	76 eb                	jbe    5a0 <atoi+0x20>
  return n;
}
 5b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5b8:	89 c8                	mov    %ecx,%eax
 5ba:	c9                   	leave
 5bb:	c3                   	ret
 5bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	83 ec 08             	sub    $0x8,%esp
 5c6:	8b 45 10             	mov    0x10(%ebp),%eax
 5c9:	8b 55 08             	mov    0x8(%ebp),%edx
 5cc:	89 75 f8             	mov    %esi,-0x8(%ebp)
 5cf:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5d2:	85 c0                	test   %eax,%eax
 5d4:	7e 12                	jle    5e8 <memmove+0x28>
 5d6:	89 7d fc             	mov    %edi,-0x4(%ebp)
 5d9:	01 d0                	add    %edx,%eax
  dst = vdst;
 5db:	89 d7                	mov    %edx,%edi
 5dd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 5e0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 5e1:	39 f8                	cmp    %edi,%eax
 5e3:	75 fb                	jne    5e0 <memmove+0x20>
 5e5:	8b 7d fc             	mov    -0x4(%ebp),%edi
  return vdst;
}
 5e8:	8b 75 f8             	mov    -0x8(%ebp),%esi
 5eb:	89 d0                	mov    %edx,%eax
 5ed:	c9                   	leave
 5ee:	c3                   	ret

000005ef <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5ef:	b8 01 00 00 00       	mov    $0x1,%eax
 5f4:	cd 40                	int    $0x40
 5f6:	c3                   	ret

000005f7 <exit>:
SYSCALL(exit)
 5f7:	b8 02 00 00 00       	mov    $0x2,%eax
 5fc:	cd 40                	int    $0x40
 5fe:	c3                   	ret

000005ff <wait>:
SYSCALL(wait)
 5ff:	b8 03 00 00 00       	mov    $0x3,%eax
 604:	cd 40                	int    $0x40
 606:	c3                   	ret

00000607 <pipe>:
SYSCALL(pipe)
 607:	b8 04 00 00 00       	mov    $0x4,%eax
 60c:	cd 40                	int    $0x40
 60e:	c3                   	ret

0000060f <read>:
SYSCALL(read)
 60f:	b8 05 00 00 00       	mov    $0x5,%eax
 614:	cd 40                	int    $0x40
 616:	c3                   	ret

00000617 <write>:
SYSCALL(write)
 617:	b8 10 00 00 00       	mov    $0x10,%eax
 61c:	cd 40                	int    $0x40
 61e:	c3                   	ret

0000061f <close>:
SYSCALL(close)
 61f:	b8 15 00 00 00       	mov    $0x15,%eax
 624:	cd 40                	int    $0x40
 626:	c3                   	ret

00000627 <kill>:
SYSCALL(kill)
 627:	b8 06 00 00 00       	mov    $0x6,%eax
 62c:	cd 40                	int    $0x40
 62e:	c3                   	ret

0000062f <exec>:
SYSCALL(exec)
 62f:	b8 07 00 00 00       	mov    $0x7,%eax
 634:	cd 40                	int    $0x40
 636:	c3                   	ret

00000637 <open>:
SYSCALL(open)
 637:	b8 0f 00 00 00       	mov    $0xf,%eax
 63c:	cd 40                	int    $0x40
 63e:	c3                   	ret

0000063f <mknod>:
SYSCALL(mknod)
 63f:	b8 11 00 00 00       	mov    $0x11,%eax
 644:	cd 40                	int    $0x40
 646:	c3                   	ret

00000647 <unlink>:
SYSCALL(unlink)
 647:	b8 12 00 00 00       	mov    $0x12,%eax
 64c:	cd 40                	int    $0x40
 64e:	c3                   	ret

0000064f <fstat>:
SYSCALL(fstat)
 64f:	b8 08 00 00 00       	mov    $0x8,%eax
 654:	cd 40                	int    $0x40
 656:	c3                   	ret

00000657 <link>:
SYSCALL(link)
 657:	b8 13 00 00 00       	mov    $0x13,%eax
 65c:	cd 40                	int    $0x40
 65e:	c3                   	ret

0000065f <mkdir>:
SYSCALL(mkdir)
 65f:	b8 14 00 00 00       	mov    $0x14,%eax
 664:	cd 40                	int    $0x40
 666:	c3                   	ret

00000667 <chdir>:
SYSCALL(chdir)
 667:	b8 09 00 00 00       	mov    $0x9,%eax
 66c:	cd 40                	int    $0x40
 66e:	c3                   	ret

0000066f <dup>:
SYSCALL(dup)
 66f:	b8 0a 00 00 00       	mov    $0xa,%eax
 674:	cd 40                	int    $0x40
 676:	c3                   	ret

00000677 <getpid>:
SYSCALL(getpid)
 677:	b8 0b 00 00 00       	mov    $0xb,%eax
 67c:	cd 40                	int    $0x40
 67e:	c3                   	ret

0000067f <sbrk>:
SYSCALL(sbrk)
 67f:	b8 0c 00 00 00       	mov    $0xc,%eax
 684:	cd 40                	int    $0x40
 686:	c3                   	ret

00000687 <sleep>:
SYSCALL(sleep)
 687:	b8 0d 00 00 00       	mov    $0xd,%eax
 68c:	cd 40                	int    $0x40
 68e:	c3                   	ret

0000068f <uptime>:
SYSCALL(uptime)
 68f:	b8 0e 00 00 00       	mov    $0xe,%eax
 694:	cd 40                	int    $0x40
 696:	c3                   	ret
 697:	66 90                	xchg   %ax,%ax
 699:	66 90                	xchg   %ax,%ax
 69b:	66 90                	xchg   %ax,%ax
 69d:	66 90                	xchg   %ax,%ax
 69f:	90                   	nop

000006a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	57                   	push   %edi
 6a4:	56                   	push   %esi
 6a5:	53                   	push   %ebx
 6a6:	89 cb                	mov    %ecx,%ebx
 6a8:	83 ec 3c             	sub    $0x3c,%esp
 6ab:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6ae:	85 d2                	test   %edx,%edx
 6b0:	0f 89 9a 00 00 00    	jns    750 <printint+0xb0>
 6b6:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 6ba:	0f 84 90 00 00 00    	je     750 <printint+0xb0>
    neg = 1;
    x = -xx;
 6c0:	f7 da                	neg    %edx
    neg = 1;
 6c2:	b8 01 00 00 00       	mov    $0x1,%eax
 6c7:	89 45 c0             	mov    %eax,-0x40(%ebp)
 6ca:	89 d1                	mov    %edx,%ecx
  } else {
    x = xx;
  }

  i = 0;
 6cc:	31 f6                	xor    %esi,%esi
 6ce:	66 90                	xchg   %ax,%ax
 6d0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 6d7:	00 
 6d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 6df:	00 
  do{
    buf[i++] = digits[x % base];
 6e0:	89 c8                	mov    %ecx,%eax
 6e2:	31 d2                	xor    %edx,%edx
 6e4:	89 f7                	mov    %esi,%edi
 6e6:	f7 f3                	div    %ebx
 6e8:	8d 76 01             	lea    0x1(%esi),%esi
  }while((x /= base) != 0);
 6eb:	39 d9                	cmp    %ebx,%ecx
    buf[i++] = digits[x % base];
 6ed:	0f b6 92 a0 0b 00 00 	movzbl 0xba0(%edx),%edx
  }while((x /= base) != 0);
 6f4:	89 c1                	mov    %eax,%ecx
    buf[i++] = digits[x % base];
 6f6:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 6fa:	73 e4                	jae    6e0 <printint+0x40>
  if(neg)
 6fc:	8b 45 c0             	mov    -0x40(%ebp),%eax
 6ff:	85 c0                	test   %eax,%eax
 701:	74 07                	je     70a <printint+0x6a>
    buf[i++] = '-';
 703:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 708:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
 70a:	8d 74 3d d8          	lea    -0x28(%ebp,%edi,1),%esi
 70e:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 711:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 718:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 71f:	00 
    putc(fd, buf[i]);
 720:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 723:	83 ec 04             	sub    $0x4,%esp
  while(--i >= 0)
 726:	83 ee 01             	sub    $0x1,%esi
 729:	88 45 d7             	mov    %al,-0x29(%ebp)
  write(fd, &c, 1);
 72c:	8d 45 d7             	lea    -0x29(%ebp),%eax
 72f:	6a 01                	push   $0x1
 731:	50                   	push   %eax
 732:	57                   	push   %edi
 733:	e8 df fe ff ff       	call   617 <write>
  while(--i >= 0)
 738:	83 c4 10             	add    $0x10,%esp
 73b:	39 f3                	cmp    %esi,%ebx
 73d:	75 e1                	jne    720 <printint+0x80>
}
 73f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 742:	5b                   	pop    %ebx
 743:	5e                   	pop    %esi
 744:	5f                   	pop    %edi
 745:	5d                   	pop    %ebp
 746:	c3                   	ret
 747:	90                   	nop
 748:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 74f:	00 
  neg = 0;
 750:	31 c0                	xor    %eax,%eax
 752:	e9 70 ff ff ff       	jmp    6c7 <printint+0x27>
 757:	90                   	nop
 758:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 75f:	00 

00000760 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	83 ec 38             	sub    $0x38,%esp
 766:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 769:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 76c:	89 75 f8             	mov    %esi,-0x8(%ebp)
 76f:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 772:	0f b6 03             	movzbl (%ebx),%eax
 775:	84 c0                	test   %al,%al
 777:	0f 84 b6 00 00 00    	je     833 <printf+0xd3>
  ap = (uint*)(void*)&fmt + 1;
 77d:	8d 4d 10             	lea    0x10(%ebp),%ecx
 780:	89 7d fc             	mov    %edi,-0x4(%ebp)
 783:	83 c3 01             	add    $0x1,%ebx
 786:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
 789:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 78c:	0f b6 d0             	movzbl %al,%edx
    if(state == 0){
 78f:	eb 2a                	jmp    7bb <printf+0x5b>
 791:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 798:	83 ec 04             	sub    $0x4,%esp
 79b:	88 45 e7             	mov    %al,-0x19(%ebp)
 79e:	8d 45 e7             	lea    -0x19(%ebp),%eax
  for(i = 0; fmt[i]; i++){
 7a1:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 7a4:	6a 01                	push   $0x1
 7a6:	50                   	push   %eax
 7a7:	56                   	push   %esi
 7a8:	e8 6a fe ff ff       	call   617 <write>
  for(i = 0; fmt[i]; i++){
 7ad:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
 7b1:	83 c4 10             	add    $0x10,%esp
 7b4:	84 c0                	test   %al,%al
 7b6:	74 78                	je     830 <printf+0xd0>
    c = fmt[i] & 0xff;
 7b8:	0f b6 d0             	movzbl %al,%edx
      if(c == '%'){
 7bb:	83 fa 25             	cmp    $0x25,%edx
 7be:	75 d8                	jne    798 <printf+0x38>
  for(i = 0; fmt[i]; i++){
 7c0:	0f b6 13             	movzbl (%ebx),%edx
 7c3:	84 d2                	test   %dl,%dl
 7c5:	74 69                	je     830 <printf+0xd0>
    c = fmt[i] & 0xff;
 7c7:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 7ca:	80 fa 25             	cmp    $0x25,%dl
 7cd:	0f 84 25 01 00 00    	je     8f8 <printf+0x198>
 7d3:	83 e8 63             	sub    $0x63,%eax
 7d6:	83 f8 15             	cmp    $0x15,%eax
 7d9:	77 0d                	ja     7e8 <printf+0x88>
 7db:	ff 24 85 48 0b 00 00 	jmp    *0xb48(,%eax,4)
 7e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 7e8:	83 ec 04             	sub    $0x4,%esp
 7eb:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 7ee:	88 55 d0             	mov    %dl,-0x30(%ebp)
 7f1:	6a 01                	push   $0x1
 7f3:	51                   	push   %ecx
 7f4:	56                   	push   %esi
 7f5:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 7f8:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 7fc:	e8 16 fe ff ff       	call   617 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 801:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 805:	83 c4 0c             	add    $0xc,%esp
 808:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 80b:	6a 01                	push   $0x1
 80d:	88 55 e7             	mov    %dl,-0x19(%ebp)
 810:	51                   	push   %ecx
  for(i = 0; fmt[i]; i++){
 811:	83 c3 02             	add    $0x2,%ebx
  write(fd, &c, 1);
 814:	56                   	push   %esi
 815:	e8 fd fd ff ff       	call   617 <write>
  for(i = 0; fmt[i]; i++){
 81a:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
 81e:	83 c4 10             	add    $0x10,%esp
 821:	84 c0                	test   %al,%al
 823:	75 93                	jne    7b8 <printf+0x58>
 825:	8d 76 00             	lea    0x0(%esi),%esi
 828:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 82f:	00 
 830:	8b 7d fc             	mov    -0x4(%ebp),%edi
      }
      state = 0;
    }
  }
}
 833:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 836:	8b 75 f8             	mov    -0x8(%ebp),%esi
 839:	c9                   	leave
 83a:	c3                   	ret
 83b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 16, 0);
 840:	83 ec 0c             	sub    $0xc,%esp
 843:	8b 17                	mov    (%edi),%edx
 845:	b9 10 00 00 00       	mov    $0x10,%ecx
 84a:	89 f0                	mov    %esi,%eax
 84c:	6a 00                	push   $0x0
 84e:	e8 4d fe ff ff       	call   6a0 <printint>
  for(i = 0; fmt[i]; i++){
 853:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
 857:	83 c3 02             	add    $0x2,%ebx
 85a:	83 c4 10             	add    $0x10,%esp
 85d:	84 c0                	test   %al,%al
 85f:	74 cf                	je     830 <printf+0xd0>
        ap++;
 861:	83 c7 04             	add    $0x4,%edi
 864:	e9 4f ff ff ff       	jmp    7b8 <printf+0x58>
 869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 870:	83 ec 0c             	sub    $0xc,%esp
 873:	8b 17                	mov    (%edi),%edx
 875:	b9 0a 00 00 00       	mov    $0xa,%ecx
 87a:	89 f0                	mov    %esi,%eax
 87c:	6a 01                	push   $0x1
 87e:	e8 1d fe ff ff       	call   6a0 <printint>
  for(i = 0; fmt[i]; i++){
 883:	eb ce                	jmp    853 <printf+0xf3>
 885:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 888:	83 ec 04             	sub    $0x4,%esp
 88b:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        putc(fd, *ap);
 88e:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 890:	6a 01                	push   $0x1
 892:	51                   	push   %ecx
 893:	56                   	push   %esi
        putc(fd, *ap);
 894:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 897:	e8 7b fd ff ff       	call   617 <write>
 89c:	eb b5                	jmp    853 <printf+0xf3>
 89e:	66 90                	xchg   %ax,%ax
        s = (char*)*ap;
 8a0:	8b 07                	mov    (%edi),%eax
        ap++;
 8a2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 8a5:	85 c0                	test   %eax,%eax
 8a7:	74 67                	je     910 <printf+0x1b0>
        while(*s != 0){
 8a9:	0f b6 10             	movzbl (%eax),%edx
 8ac:	84 d2                	test   %dl,%dl
 8ae:	74 6f                	je     91f <printf+0x1bf>
 8b0:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 8b3:	89 c7                	mov    %eax,%edi
 8b5:	89 d0                	mov    %edx,%eax
 8b7:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 8ba:	89 fb                	mov    %edi,%ebx
 8bc:	8d 7d e7             	lea    -0x19(%ebp),%edi
 8bf:	90                   	nop
  write(fd, &c, 1);
 8c0:	83 ec 04             	sub    $0x4,%esp
          s++;
 8c3:	83 c3 01             	add    $0x1,%ebx
 8c6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8c9:	6a 01                	push   $0x1
 8cb:	57                   	push   %edi
 8cc:	56                   	push   %esi
 8cd:	e8 45 fd ff ff       	call   617 <write>
        while(*s != 0){
 8d2:	0f b6 03             	movzbl (%ebx),%eax
 8d5:	83 c4 10             	add    $0x10,%esp
 8d8:	84 c0                	test   %al,%al
 8da:	75 e4                	jne    8c0 <printf+0x160>
 8dc:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
 8df:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
 8e3:	83 c3 02             	add    $0x2,%ebx
 8e6:	84 c0                	test   %al,%al
 8e8:	0f 85 9b fe ff ff    	jne    789 <printf+0x29>
 8ee:	e9 3d ff ff ff       	jmp    830 <printf+0xd0>
 8f3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 8f8:	83 ec 04             	sub    $0x4,%esp
 8fb:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 8ff:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 902:	6a 01                	push   $0x1
 904:	e9 07 ff ff ff       	jmp    810 <printf+0xb0>
 909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
          s = "(null)";
 910:	89 7d d4             	mov    %edi,-0x2c(%ebp)
        if(s == 0)
 913:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 918:	bf 3e 0b 00 00       	mov    $0xb3e,%edi
 91d:	eb 98                	jmp    8b7 <printf+0x157>
  for(i = 0; fmt[i]; i++){
 91f:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
 923:	83 c3 02             	add    $0x2,%ebx
 926:	84 c0                	test   %al,%al
 928:	0f 85 8a fe ff ff    	jne    7b8 <printf+0x58>
 92e:	e9 fd fe ff ff       	jmp    830 <printf+0xd0>
 933:	66 90                	xchg   %ax,%ax
 935:	66 90                	xchg   %ax,%ax
 937:	66 90                	xchg   %ax,%ax
 939:	66 90                	xchg   %ax,%ax
 93b:	66 90                	xchg   %ax,%ax
 93d:	66 90                	xchg   %ax,%ax
 93f:	90                   	nop

00000940 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 940:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 941:	a1 80 13 00 00       	mov    0x1380,%eax
{
 946:	89 e5                	mov    %esp,%ebp
 948:	57                   	push   %edi
 949:	56                   	push   %esi
 94a:	53                   	push   %ebx
 94b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 94e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 951:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 958:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 95f:	00 
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 960:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 962:	39 c8                	cmp    %ecx,%eax
 964:	73 32                	jae    998 <free+0x58>
 966:	39 d1                	cmp    %edx,%ecx
 968:	72 04                	jb     96e <free+0x2e>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 96a:	39 d0                	cmp    %edx,%eax
 96c:	72 32                	jb     9a0 <free+0x60>
      break;
  if(bp + bp->s.size == p->s.ptr){
 96e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 971:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 974:	39 fa                	cmp    %edi,%edx
 976:	74 30                	je     9a8 <free+0x68>
 978:	89 53 f8             	mov    %edx,-0x8(%ebx)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 97b:	8b 50 04             	mov    0x4(%eax),%edx
 97e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 981:	39 f1                	cmp    %esi,%ecx
 983:	74 3a                	je     9bf <free+0x7f>
 985:	89 08                	mov    %ecx,(%eax)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
}
 987:	5b                   	pop    %ebx
  freep = p;
 988:	a3 80 13 00 00       	mov    %eax,0x1380
}
 98d:	5e                   	pop    %esi
 98e:	5f                   	pop    %edi
 98f:	5d                   	pop    %ebp
 990:	c3                   	ret
 991:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 998:	39 d0                	cmp    %edx,%eax
 99a:	72 04                	jb     9a0 <free+0x60>
 99c:	39 d1                	cmp    %edx,%ecx
 99e:	72 ce                	jb     96e <free+0x2e>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9a0:	89 d0                	mov    %edx,%eax
 9a2:	eb bc                	jmp    960 <free+0x20>
 9a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 9a8:	03 72 04             	add    0x4(%edx),%esi
 9ab:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9ae:	8b 10                	mov    (%eax),%edx
 9b0:	8b 12                	mov    (%edx),%edx
 9b2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9b5:	8b 50 04             	mov    0x4(%eax),%edx
 9b8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9bb:	39 f1                	cmp    %esi,%ecx
 9bd:	75 c6                	jne    985 <free+0x45>
    p->s.size += bp->s.size;
 9bf:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 9c2:	a3 80 13 00 00       	mov    %eax,0x1380
    p->s.size += bp->s.size;
 9c7:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9ca:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 9cd:	89 08                	mov    %ecx,(%eax)
}
 9cf:	5b                   	pop    %ebx
 9d0:	5e                   	pop    %esi
 9d1:	5f                   	pop    %edi
 9d2:	5d                   	pop    %ebp
 9d3:	c3                   	ret
 9d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 9df:	00 

000009e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9e0:	55                   	push   %ebp
 9e1:	89 e5                	mov    %esp,%ebp
 9e3:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9e6:	8b 45 08             	mov    0x8(%ebp),%eax
{
 9e9:	89 7d fc             	mov    %edi,-0x4(%ebp)
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9ec:	8d 78 07             	lea    0x7(%eax),%edi
  if((prevp = freep) == 0){
 9ef:	a1 80 13 00 00       	mov    0x1380,%eax
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9f4:	c1 ef 03             	shr    $0x3,%edi
 9f7:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 9fa:	85 c0                	test   %eax,%eax
 9fc:	0f 84 c6 00 00 00    	je     ac8 <malloc+0xe8>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a02:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 a04:	8b 4a 04             	mov    0x4(%edx),%ecx
 a07:	39 f9                	cmp    %edi,%ecx
 a09:	0f 83 87 00 00 00    	jae    a96 <malloc+0xb6>
 a0f:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 a12:	89 75 f8             	mov    %esi,-0x8(%ebp)
  if(nu < 4096)
 a15:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a1a:	39 df                	cmp    %ebx,%edi
 a1c:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 a1f:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 a26:	eb 21                	jmp    a49 <malloc+0x69>
 a28:	eb 16                	jmp    a40 <malloc+0x60>
 a2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 a30:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 a37:	00 
 a38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 a3f:	00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a40:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 a42:	8b 4a 04             	mov    0x4(%edx),%ecx
 a45:	39 f9                	cmp    %edi,%ecx
 a47:	73 47                	jae    a90 <malloc+0xb0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a49:	89 d0                	mov    %edx,%eax
 a4b:	39 15 80 13 00 00    	cmp    %edx,0x1380
 a51:	75 ed                	jne    a40 <malloc+0x60>
  p = sbrk(nu * sizeof(Header));
 a53:	83 ec 0c             	sub    $0xc,%esp
 a56:	56                   	push   %esi
 a57:	e8 23 fc ff ff       	call   67f <sbrk>
  if(p == (char*)-1)
 a5c:	83 c4 10             	add    $0x10,%esp
 a5f:	83 f8 ff             	cmp    $0xffffffff,%eax
 a62:	74 54                	je     ab8 <malloc+0xd8>
  hp->s.size = nu;
 a64:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a67:	83 ec 0c             	sub    $0xc,%esp
 a6a:	83 c0 08             	add    $0x8,%eax
 a6d:	50                   	push   %eax
 a6e:	e8 cd fe ff ff       	call   940 <free>
  return freep;
 a73:	a1 80 13 00 00       	mov    0x1380,%eax
      if((p = morecore(nunits)) == 0)
 a78:	83 c4 10             	add    $0x10,%esp
 a7b:	85 c0                	test   %eax,%eax
 a7d:	75 c1                	jne    a40 <malloc+0x60>
 a7f:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 a82:	8b 75 f8             	mov    -0x8(%ebp),%esi
 a85:	eb 26                	jmp    aad <malloc+0xcd>
 a87:	90                   	nop
 a88:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 a8f:	00 
 a90:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 a93:	8b 75 f8             	mov    -0x8(%ebp),%esi
      if(p->s.size == nunits)
 a96:	39 cf                	cmp    %ecx,%edi
 a98:	74 66                	je     b00 <malloc+0x120>
        p->s.size -= nunits;
 a9a:	29 f9                	sub    %edi,%ecx
 a9c:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 a9f:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 aa2:	89 7a 04             	mov    %edi,0x4(%edx)
      freep = prevp;
 aa5:	a3 80 13 00 00       	mov    %eax,0x1380
      return (void*)(p + 1);
 aaa:	8d 42 08             	lea    0x8(%edx),%eax
        return 0;
  }
}
 aad:	8b 7d fc             	mov    -0x4(%ebp),%edi
 ab0:	c9                   	leave
 ab1:	c3                   	ret
 ab2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        return 0;
 ab8:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 abb:	8b 75 f8             	mov    -0x8(%ebp),%esi
 abe:	31 c0                	xor    %eax,%eax
}
 ac0:	8b 7d fc             	mov    -0x4(%ebp),%edi
 ac3:	c9                   	leave
 ac4:	c3                   	ret
 ac5:	8d 76 00             	lea    0x0(%esi),%esi
 ac8:	89 5d f4             	mov    %ebx,-0xc(%ebp)
    base.s.size = 0;
 acb:	ba 84 13 00 00       	mov    $0x1384,%edx
 ad0:	89 75 f8             	mov    %esi,-0x8(%ebp)
    base.s.ptr = freep = prevp = &base;
 ad3:	c7 05 80 13 00 00 84 	movl   $0x1384,0x1380
 ada:	13 00 00 
 add:	c7 05 84 13 00 00 84 	movl   $0x1384,0x1384
 ae4:	13 00 00 
    base.s.size = 0;
 ae7:	c7 05 88 13 00 00 00 	movl   $0x0,0x1388
 aee:	00 00 00 
    if(p->s.size >= nunits){
 af1:	e9 1f ff ff ff       	jmp    a15 <malloc+0x35>
 af6:	66 90                	xchg   %ax,%ax
 af8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 aff:	00 
        prevp->s.ptr = p->s.ptr;
 b00:	8b 0a                	mov    (%edx),%ecx
 b02:	89 08                	mov    %ecx,(%eax)
 b04:	eb 9f                	jmp    aa5 <malloc+0xc5>
