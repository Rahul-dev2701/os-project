
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

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
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      11:	eb 0e                	jmp    21 <main+0x21>
      13:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f 96 00 00 00    	jg     b7 <main+0xb7>
  while((fd = open("console", O_RDWR)) >= 0){
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 e9 13 00 00       	push   $0x13e9
      2b:	e8 47 0e 00 00       	call   e77 <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
      37:	eb 2e                	jmp    67 <main+0x67>
      39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      40:	80 3d c2 1a 00 00 20 	cmpb   $0x20,0x1ac2
      47:	0f 84 8d 00 00 00    	je     da <main+0xda>
      4d:	8d 76 00             	lea    0x0(%esi),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
      50:	e8 da 0d 00 00       	call   e2f <fork>
  if(pid == -1)
      55:	83 f8 ff             	cmp    $0xffffffff,%eax
      58:	0f 84 c1 00 00 00    	je     11f <main+0x11f>
    if(fork1() == 0)
      5e:	85 c0                	test   %eax,%eax
      60:	74 63                	je     c5 <main+0xc5>
    wait();
      62:	e8 d8 0d 00 00       	call   e3f <wait>
  printf(2, "$ ");
      67:	83 ec 08             	sub    $0x8,%esp
      6a:	68 48 13 00 00       	push   $0x1348
      6f:	6a 02                	push   $0x2
      71:	e8 2a 0f 00 00       	call   fa0 <printf>
  memset(buf, 0, nbuf);
      76:	83 c4 0c             	add    $0xc,%esp
      79:	6a 64                	push   $0x64
      7b:	6a 00                	push   $0x0
      7d:	68 c0 1a 00 00       	push   $0x1ac0
      82:	e8 19 0c 00 00       	call   ca0 <memset>
  gets(buf, nbuf);
      87:	58                   	pop    %eax
      88:	5a                   	pop    %edx
      89:	6a 64                	push   $0x64
      8b:	68 c0 1a 00 00       	push   $0x1ac0
      90:	e8 6b 0c 00 00       	call   d00 <gets>
  if(buf[0] == 0) // EOF
      95:	0f b6 05 c0 1a 00 00 	movzbl 0x1ac0,%eax
      9c:	83 c4 10             	add    $0x10,%esp
      9f:	84 c0                	test   %al,%al
      a1:	74 0f                	je     b2 <main+0xb2>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      a3:	3c 63                	cmp    $0x63,%al
      a5:	75 a9                	jne    50 <main+0x50>
      a7:	80 3d c1 1a 00 00 64 	cmpb   $0x64,0x1ac1
      ae:	75 a0                	jne    50 <main+0x50>
      b0:	eb 8e                	jmp    40 <main+0x40>
  exit();
      b2:	e8 80 0d 00 00       	call   e37 <exit>
      close(fd);
      b7:	83 ec 0c             	sub    $0xc,%esp
      ba:	50                   	push   %eax
      bb:	e8 9f 0d 00 00       	call   e5f <close>
      break;
      c0:	83 c4 10             	add    $0x10,%esp
      c3:	eb a2                	jmp    67 <main+0x67>
      runcmd(parsecmd(buf));
      c5:	83 ec 0c             	sub    $0xc,%esp
      c8:	68 c0 1a 00 00       	push   $0x1ac0
      cd:	e8 8e 0a 00 00       	call   b60 <parsecmd>
      d2:	89 04 24             	mov    %eax,(%esp)
      d5:	e8 d6 00 00 00       	call   1b0 <runcmd>
      buf[strlen(buf)-1] = 0;  // chop \n
      da:	83 ec 0c             	sub    $0xc,%esp
      dd:	68 c0 1a 00 00       	push   $0x1ac0
      e2:	e8 89 0b 00 00       	call   c70 <strlen>
      e7:	c6 80 bf 1a 00 00 00 	movb   $0x0,0x1abf(%eax)
      if(chdir(buf+3) < 0)
      ee:	c7 04 24 c3 1a 00 00 	movl   $0x1ac3,(%esp)
      f5:	e8 ad 0d 00 00       	call   ea7 <chdir>
      fa:	83 c4 10             	add    $0x10,%esp
      fd:	85 c0                	test   %eax,%eax
      ff:	0f 89 62 ff ff ff    	jns    67 <main+0x67>
        printf(2, "cannot cd %s\n", buf+3);
     105:	51                   	push   %ecx
     106:	68 c3 1a 00 00       	push   $0x1ac3
     10b:	68 f1 13 00 00       	push   $0x13f1
     110:	6a 02                	push   $0x2
     112:	e8 89 0e 00 00       	call   fa0 <printf>
     117:	83 c4 10             	add    $0x10,%esp
     11a:	e9 48 ff ff ff       	jmp    67 <main+0x67>
    panic("fork");
     11f:	83 ec 0c             	sub    $0xc,%esp
     122:	68 4b 13 00 00       	push   $0x134b
     127:	e8 44 00 00 00       	call   170 <panic>
     12c:	66 90                	xchg   %ax,%ax
     12e:	66 90                	xchg   %ax,%ax

00000130 <getcmd>:
{
     130:	55                   	push   %ebp
     131:	89 e5                	mov    %esp,%ebp
     133:	53                   	push   %ebx
     134:	83 ec 0c             	sub    $0xc,%esp
     137:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
     13a:	68 48 13 00 00       	push   $0x1348
     13f:	6a 02                	push   $0x2
     141:	e8 5a 0e 00 00       	call   fa0 <printf>
  memset(buf, 0, nbuf);
     146:	83 c4 0c             	add    $0xc,%esp
     149:	ff 75 0c             	push   0xc(%ebp)
     14c:	6a 00                	push   $0x0
     14e:	53                   	push   %ebx
     14f:	e8 4c 0b 00 00       	call   ca0 <memset>
  gets(buf, nbuf);
     154:	58                   	pop    %eax
     155:	5a                   	pop    %edx
     156:	ff 75 0c             	push   0xc(%ebp)
     159:	53                   	push   %ebx
     15a:	e8 a1 0b 00 00       	call   d00 <gets>
  if(buf[0] == 0) // EOF
     15f:	83 c4 10             	add    $0x10,%esp
     162:	80 3b 01             	cmpb   $0x1,(%ebx)
}
     165:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     168:	c9                   	leave
  if(buf[0] == 0) // EOF
     169:	19 c0                	sbb    %eax,%eax
}
     16b:	c3                   	ret
     16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000170 <panic>:
{
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     176:	ff 75 08             	push   0x8(%ebp)
     179:	68 e5 13 00 00       	push   $0x13e5
     17e:	6a 02                	push   $0x2
     180:	e8 1b 0e 00 00       	call   fa0 <printf>
  exit();
     185:	e8 ad 0c 00 00       	call   e37 <exit>
     18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000190 <fork1>:
{
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     196:	e8 94 0c 00 00       	call   e2f <fork>
  if(pid == -1)
     19b:	83 f8 ff             	cmp    $0xffffffff,%eax
     19e:	74 02                	je     1a2 <fork1+0x12>
  return pid;
}
     1a0:	c9                   	leave
     1a1:	c3                   	ret
    panic("fork");
     1a2:	83 ec 0c             	sub    $0xc,%esp
     1a5:	68 4b 13 00 00       	push   $0x134b
     1aa:	e8 c1 ff ff ff       	call   170 <panic>
     1af:	90                   	nop

000001b0 <runcmd>:
{
     1b0:	55                   	push   %ebp
     1b1:	89 e5                	mov    %esp,%ebp
     1b3:	53                   	push   %ebx
     1b4:	83 ec 14             	sub    $0x14,%esp
     1b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     1ba:	85 db                	test   %ebx,%ebx
     1bc:	74 3a                	je     1f8 <runcmd+0x48>
  switch(cmd->type){
     1be:	83 3b 05             	cmpl   $0x5,(%ebx)
     1c1:	0f 87 e6 00 00 00    	ja     2ad <runcmd+0xfd>
     1c7:	8b 03                	mov    (%ebx),%eax
     1c9:	ff 24 85 08 14 00 00 	jmp    *0x1408(,%eax,4)
    if(ecmd->argv[0] == 0)
     1d0:	8b 43 04             	mov    0x4(%ebx),%eax
     1d3:	85 c0                	test   %eax,%eax
     1d5:	74 21                	je     1f8 <runcmd+0x48>
    exec(ecmd->argv[0], ecmd->argv);
     1d7:	8d 53 04             	lea    0x4(%ebx),%edx
     1da:	51                   	push   %ecx
     1db:	51                   	push   %ecx
     1dc:	52                   	push   %edx
     1dd:	50                   	push   %eax
     1de:	e8 8c 0c 00 00       	call   e6f <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     1e3:	83 c4 0c             	add    $0xc,%esp
     1e6:	ff 73 04             	push   0x4(%ebx)
     1e9:	68 57 13 00 00       	push   $0x1357
     1ee:	6a 02                	push   $0x2
     1f0:	e8 ab 0d 00 00       	call   fa0 <printf>
    break;
     1f5:	83 c4 10             	add    $0x10,%esp
    exit();
     1f8:	e8 3a 0c 00 00       	call   e37 <exit>
    if(fork1() == 0)
     1fd:	e8 8e ff ff ff       	call   190 <fork1>
     202:	85 c0                	test   %eax,%eax
     204:	75 f2                	jne    1f8 <runcmd+0x48>
     206:	e9 97 00 00 00       	jmp    2a2 <runcmd+0xf2>
    if(pipe(p) < 0)
     20b:	83 ec 0c             	sub    $0xc,%esp
     20e:	8d 45 f0             	lea    -0x10(%ebp),%eax
     211:	50                   	push   %eax
     212:	e8 30 0c 00 00       	call   e47 <pipe>
     217:	83 c4 10             	add    $0x10,%esp
     21a:	85 c0                	test   %eax,%eax
     21c:	0f 88 ad 00 00 00    	js     2cf <runcmd+0x11f>
    if(fork1() == 0){
     222:	e8 69 ff ff ff       	call   190 <fork1>
     227:	85 c0                	test   %eax,%eax
     229:	0f 84 ad 00 00 00    	je     2dc <runcmd+0x12c>
    if(fork1() == 0){
     22f:	e8 5c ff ff ff       	call   190 <fork1>
     234:	85 c0                	test   %eax,%eax
     236:	0f 85 ce 00 00 00    	jne    30a <runcmd+0x15a>
      close(0);
     23c:	83 ec 0c             	sub    $0xc,%esp
     23f:	6a 00                	push   $0x0
     241:	e8 19 0c 00 00       	call   e5f <close>
      dup(p[0]);
     246:	5a                   	pop    %edx
     247:	ff 75 f0             	push   -0x10(%ebp)
     24a:	e8 60 0c 00 00       	call   eaf <dup>
      close(p[0]);
     24f:	59                   	pop    %ecx
     250:	ff 75 f0             	push   -0x10(%ebp)
     253:	e8 07 0c 00 00       	call   e5f <close>
      close(p[1]);
     258:	58                   	pop    %eax
     259:	ff 75 f4             	push   -0xc(%ebp)
     25c:	e8 fe 0b 00 00       	call   e5f <close>
      runcmd(pcmd->right);
     261:	58                   	pop    %eax
     262:	ff 73 08             	push   0x8(%ebx)
     265:	e8 46 ff ff ff       	call   1b0 <runcmd>
    if(fork1() == 0)
     26a:	e8 21 ff ff ff       	call   190 <fork1>
     26f:	85 c0                	test   %eax,%eax
     271:	74 2f                	je     2a2 <runcmd+0xf2>
    wait();
     273:	e8 c7 0b 00 00       	call   e3f <wait>
    runcmd(lcmd->right);
     278:	83 ec 0c             	sub    $0xc,%esp
     27b:	ff 73 08             	push   0x8(%ebx)
     27e:	e8 2d ff ff ff       	call   1b0 <runcmd>
    close(rcmd->fd);
     283:	83 ec 0c             	sub    $0xc,%esp
     286:	ff 73 14             	push   0x14(%ebx)
     289:	e8 d1 0b 00 00       	call   e5f <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     28e:	58                   	pop    %eax
     28f:	5a                   	pop    %edx
     290:	ff 73 10             	push   0x10(%ebx)
     293:	ff 73 08             	push   0x8(%ebx)
     296:	e8 dc 0b 00 00       	call   e77 <open>
     29b:	83 c4 10             	add    $0x10,%esp
     29e:	85 c0                	test   %eax,%eax
     2a0:	78 18                	js     2ba <runcmd+0x10a>
      runcmd(bcmd->cmd);
     2a2:	83 ec 0c             	sub    $0xc,%esp
     2a5:	ff 73 04             	push   0x4(%ebx)
     2a8:	e8 03 ff ff ff       	call   1b0 <runcmd>
    panic("runcmd");
     2ad:	83 ec 0c             	sub    $0xc,%esp
     2b0:	68 50 13 00 00       	push   $0x1350
     2b5:	e8 b6 fe ff ff       	call   170 <panic>
      printf(2, "open %s failed\n", rcmd->file);
     2ba:	51                   	push   %ecx
     2bb:	ff 73 08             	push   0x8(%ebx)
     2be:	68 67 13 00 00       	push   $0x1367
     2c3:	6a 02                	push   $0x2
     2c5:	e8 d6 0c 00 00       	call   fa0 <printf>
      exit();
     2ca:	e8 68 0b 00 00       	call   e37 <exit>
      panic("pipe");
     2cf:	83 ec 0c             	sub    $0xc,%esp
     2d2:	68 77 13 00 00       	push   $0x1377
     2d7:	e8 94 fe ff ff       	call   170 <panic>
      close(1);
     2dc:	83 ec 0c             	sub    $0xc,%esp
     2df:	6a 01                	push   $0x1
     2e1:	e8 79 0b 00 00       	call   e5f <close>
      dup(p[1]);
     2e6:	58                   	pop    %eax
     2e7:	ff 75 f4             	push   -0xc(%ebp)
     2ea:	e8 c0 0b 00 00       	call   eaf <dup>
      close(p[0]);
     2ef:	58                   	pop    %eax
     2f0:	ff 75 f0             	push   -0x10(%ebp)
     2f3:	e8 67 0b 00 00       	call   e5f <close>
      close(p[1]);
     2f8:	58                   	pop    %eax
     2f9:	ff 75 f4             	push   -0xc(%ebp)
     2fc:	e8 5e 0b 00 00       	call   e5f <close>
      runcmd(pcmd->left);
     301:	5a                   	pop    %edx
     302:	ff 73 04             	push   0x4(%ebx)
     305:	e8 a6 fe ff ff       	call   1b0 <runcmd>
    close(p[0]);
     30a:	83 ec 0c             	sub    $0xc,%esp
     30d:	ff 75 f0             	push   -0x10(%ebp)
     310:	e8 4a 0b 00 00       	call   e5f <close>
    close(p[1]);
     315:	58                   	pop    %eax
     316:	ff 75 f4             	push   -0xc(%ebp)
     319:	e8 41 0b 00 00       	call   e5f <close>
    wait();
     31e:	e8 1c 0b 00 00       	call   e3f <wait>
    wait();
     323:	e8 17 0b 00 00       	call   e3f <wait>
    break;
     328:	83 c4 10             	add    $0x10,%esp
     32b:	e9 c8 fe ff ff       	jmp    1f8 <runcmd+0x48>

00000330 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     330:	55                   	push   %ebp
     331:	89 e5                	mov    %esp,%ebp
     333:	53                   	push   %ebx
     334:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     337:	6a 54                	push   $0x54
     339:	e8 e2 0e 00 00       	call   1220 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     33e:	83 c4 0c             	add    $0xc,%esp
     341:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
     343:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     345:	6a 00                	push   $0x0
     347:	50                   	push   %eax
     348:	e8 53 09 00 00       	call   ca0 <memset>
  cmd->type = EXEC;
     34d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     353:	89 d8                	mov    %ebx,%eax
     355:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     358:	c9                   	leave
     359:	c3                   	ret
     35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000360 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	53                   	push   %ebx
     364:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     367:	6a 18                	push   $0x18
     369:	e8 b2 0e 00 00       	call   1220 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     36e:	83 c4 0c             	add    $0xc,%esp
     371:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     373:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     375:	6a 00                	push   $0x0
     377:	50                   	push   %eax
     378:	e8 23 09 00 00       	call   ca0 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     37d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     380:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     386:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     389:	8b 45 0c             	mov    0xc(%ebp),%eax
     38c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     38f:	8b 45 10             	mov    0x10(%ebp),%eax
     392:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     395:	8b 45 14             	mov    0x14(%ebp),%eax
     398:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     39b:	8b 45 18             	mov    0x18(%ebp),%eax
     39e:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     3a1:	89 d8                	mov    %ebx,%eax
     3a3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3a6:	c9                   	leave
     3a7:	c3                   	ret
     3a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     3af:	00 

000003b0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     3b0:	55                   	push   %ebp
     3b1:	89 e5                	mov    %esp,%ebp
     3b3:	53                   	push   %ebx
     3b4:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3b7:	6a 0c                	push   $0xc
     3b9:	e8 62 0e 00 00       	call   1220 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3be:	83 c4 0c             	add    $0xc,%esp
     3c1:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     3c3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3c5:	6a 00                	push   $0x0
     3c7:	50                   	push   %eax
     3c8:	e8 d3 08 00 00       	call   ca0 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     3cd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     3d0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     3d6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     3d9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3dc:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     3df:	89 d8                	mov    %ebx,%eax
     3e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3e4:	c9                   	leave
     3e5:	c3                   	ret
     3e6:	66 90                	xchg   %ax,%ax
     3e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     3ef:	00 

000003f0 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     3f0:	55                   	push   %ebp
     3f1:	89 e5                	mov    %esp,%ebp
     3f3:	53                   	push   %ebx
     3f4:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3f7:	6a 0c                	push   $0xc
     3f9:	e8 22 0e 00 00       	call   1220 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3fe:	83 c4 0c             	add    $0xc,%esp
     401:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     403:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     405:	6a 00                	push   $0x0
     407:	50                   	push   %eax
     408:	e8 93 08 00 00       	call   ca0 <memset>
  cmd->type = LIST;
  cmd->left = left;
     40d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     410:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     416:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     419:	8b 45 0c             	mov    0xc(%ebp),%eax
     41c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     41f:	89 d8                	mov    %ebx,%eax
     421:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     424:	c9                   	leave
     425:	c3                   	ret
     426:	66 90                	xchg   %ax,%ax
     428:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     42f:	00 

00000430 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     430:	55                   	push   %ebp
     431:	89 e5                	mov    %esp,%ebp
     433:	53                   	push   %ebx
     434:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     437:	6a 08                	push   $0x8
     439:	e8 e2 0d 00 00       	call   1220 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     43e:	83 c4 0c             	add    $0xc,%esp
     441:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
     443:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     445:	6a 00                	push   $0x0
     447:	50                   	push   %eax
     448:	e8 53 08 00 00       	call   ca0 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     44d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     450:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     456:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     459:	89 d8                	mov    %ebx,%eax
     45b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     45e:	c9                   	leave
     45f:	c3                   	ret

00000460 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     460:	55                   	push   %ebp
     461:	89 e5                	mov    %esp,%ebp
     463:	57                   	push   %edi
     464:	56                   	push   %esi
     465:	53                   	push   %ebx
     466:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     469:	8b 45 08             	mov    0x8(%ebp),%eax
{
     46c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     46f:	8b 7d 10             	mov    0x10(%ebp),%edi
  s = *ps;
     472:	8b 30                	mov    (%eax),%esi
  while(s < es && strchr(whitespace, *s))
     474:	39 de                	cmp    %ebx,%esi
     476:	72 0f                	jb     487 <gettoken+0x27>
     478:	eb 25                	jmp    49f <gettoken+0x3f>
     47a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     480:	83 c6 01             	add    $0x1,%esi
  while(s < es && strchr(whitespace, *s))
     483:	39 f3                	cmp    %esi,%ebx
     485:	74 18                	je     49f <gettoken+0x3f>
     487:	0f be 06             	movsbl (%esi),%eax
     48a:	83 ec 08             	sub    $0x8,%esp
     48d:	50                   	push   %eax
     48e:	68 ac 1a 00 00       	push   $0x1aac
     493:	e8 28 08 00 00       	call   cc0 <strchr>
     498:	83 c4 10             	add    $0x10,%esp
     49b:	85 c0                	test   %eax,%eax
     49d:	75 e1                	jne    480 <gettoken+0x20>
  if(q)
     49f:	85 ff                	test   %edi,%edi
     4a1:	74 02                	je     4a5 <gettoken+0x45>
    *q = s;
     4a3:	89 37                	mov    %esi,(%edi)
  ret = *s;
     4a5:	0f b6 06             	movzbl (%esi),%eax
  switch(*s){
     4a8:	3c 3c                	cmp    $0x3c,%al
     4aa:	0f 8f d0 00 00 00    	jg     580 <gettoken+0x120>
     4b0:	3c 25                	cmp    $0x25,%al
     4b2:	7f 4c                	jg     500 <gettoken+0xa0>
     4b4:	31 ff                	xor    %edi,%edi
     4b6:	84 c0                	test   %al,%al
     4b8:	75 53                	jne    50d <gettoken+0xad>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     4ba:	8b 4d 14             	mov    0x14(%ebp),%ecx
     4bd:	85 c9                	test   %ecx,%ecx
     4bf:	74 05                	je     4c6 <gettoken+0x66>
    *eq = s;
     4c1:	8b 45 14             	mov    0x14(%ebp),%eax
     4c4:	89 30                	mov    %esi,(%eax)

  while(s < es && strchr(whitespace, *s))
     4c6:	39 de                	cmp    %ebx,%esi
     4c8:	72 0d                	jb     4d7 <gettoken+0x77>
     4ca:	eb 23                	jmp    4ef <gettoken+0x8f>
     4cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s++;
     4d0:	83 c6 01             	add    $0x1,%esi
  while(s < es && strchr(whitespace, *s))
     4d3:	39 f3                	cmp    %esi,%ebx
     4d5:	74 1a                	je     4f1 <gettoken+0x91>
     4d7:	0f be 06             	movsbl (%esi),%eax
     4da:	83 ec 08             	sub    $0x8,%esp
     4dd:	50                   	push   %eax
     4de:	68 ac 1a 00 00       	push   $0x1aac
     4e3:	e8 d8 07 00 00       	call   cc0 <strchr>
     4e8:	83 c4 10             	add    $0x10,%esp
     4eb:	85 c0                	test   %eax,%eax
     4ed:	75 e1                	jne    4d0 <gettoken+0x70>
     4ef:	89 f3                	mov    %esi,%ebx
  *ps = s;
     4f1:	8b 45 08             	mov    0x8(%ebp),%eax
     4f4:	89 18                	mov    %ebx,(%eax)
  return ret;
}
     4f6:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4f9:	89 f8                	mov    %edi,%eax
     4fb:	5b                   	pop    %ebx
     4fc:	5e                   	pop    %esi
     4fd:	5f                   	pop    %edi
     4fe:	5d                   	pop    %ebp
     4ff:	c3                   	ret
  switch(*s){
     500:	8d 50 da             	lea    -0x26(%eax),%edx
     503:	b9 0d 00 60 00       	mov    $0x60000d,%ecx
     508:	0f a3 d1             	bt     %edx,%ecx
     50b:	72 5f                	jb     56c <gettoken+0x10c>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     50d:	39 de                	cmp    %ebx,%esi
     50f:	72 2e                	jb     53f <gettoken+0xdf>
     511:	e9 a4 00 00 00       	jmp    5ba <gettoken+0x15a>
     516:	66 90                	xchg   %ax,%ax
     518:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     51f:	00 
     520:	0f be 06             	movsbl (%esi),%eax
     523:	83 ec 08             	sub    $0x8,%esp
     526:	50                   	push   %eax
     527:	68 a4 1a 00 00       	push   $0x1aa4
     52c:	e8 8f 07 00 00       	call   cc0 <strchr>
     531:	83 c4 10             	add    $0x10,%esp
     534:	85 c0                	test   %eax,%eax
     536:	75 1f                	jne    557 <gettoken+0xf7>
      s++;
     538:	83 c6 01             	add    $0x1,%esi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     53b:	39 f3                	cmp    %esi,%ebx
     53d:	74 65                	je     5a4 <gettoken+0x144>
     53f:	0f be 06             	movsbl (%esi),%eax
     542:	83 ec 08             	sub    $0x8,%esp
     545:	50                   	push   %eax
     546:	68 ac 1a 00 00       	push   $0x1aac
     54b:	e8 70 07 00 00       	call   cc0 <strchr>
     550:	83 c4 10             	add    $0x10,%esp
     553:	85 c0                	test   %eax,%eax
     555:	74 c9                	je     520 <gettoken+0xc0>
    ret = 'a';
     557:	bf 61 00 00 00       	mov    $0x61,%edi
     55c:	e9 59 ff ff ff       	jmp    4ba <gettoken+0x5a>
     561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     568:	3c 7c                	cmp    $0x7c,%al
     56a:	75 a1                	jne    50d <gettoken+0xad>
  ret = *s;
     56c:	0f be f8             	movsbl %al,%edi
    s++;
     56f:	83 c6 01             	add    $0x1,%esi
    break;
     572:	e9 43 ff ff ff       	jmp    4ba <gettoken+0x5a>
     577:	90                   	nop
     578:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     57f:	00 
  switch(*s){
     580:	3c 3e                	cmp    $0x3e,%al
     582:	75 e4                	jne    568 <gettoken+0x108>
    if(*s == '>'){
     584:	80 7e 01 3e          	cmpb   $0x3e,0x1(%esi)
     588:	74 0d                	je     597 <gettoken+0x137>
    s++;
     58a:	83 c6 01             	add    $0x1,%esi
  ret = *s;
     58d:	bf 3e 00 00 00       	mov    $0x3e,%edi
     592:	e9 23 ff ff ff       	jmp    4ba <gettoken+0x5a>
      s++;
     597:	83 c6 02             	add    $0x2,%esi
      ret = '+';
     59a:	bf 2b 00 00 00       	mov    $0x2b,%edi
     59f:	e9 16 ff ff ff       	jmp    4ba <gettoken+0x5a>
  if(eq)
     5a4:	8b 45 14             	mov    0x14(%ebp),%eax
     5a7:	85 c0                	test   %eax,%eax
     5a9:	74 05                	je     5b0 <gettoken+0x150>
    *eq = s;
     5ab:	8b 45 14             	mov    0x14(%ebp),%eax
     5ae:	89 18                	mov    %ebx,(%eax)
    ret = 'a';
     5b0:	bf 61 00 00 00       	mov    $0x61,%edi
     5b5:	e9 37 ff ff ff       	jmp    4f1 <gettoken+0x91>
  if(eq)
     5ba:	8b 55 14             	mov    0x14(%ebp),%edx
     5bd:	85 d2                	test   %edx,%edx
     5bf:	74 05                	je     5c6 <gettoken+0x166>
    *eq = s;
     5c1:	8b 45 14             	mov    0x14(%ebp),%eax
     5c4:	89 30                	mov    %esi,(%eax)
    ret = 'a';
     5c6:	89 f3                	mov    %esi,%ebx
     5c8:	bf 61 00 00 00       	mov    $0x61,%edi
     5cd:	e9 1f ff ff ff       	jmp    4f1 <gettoken+0x91>
     5d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     5d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     5df:	00 

000005e0 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     5e0:	55                   	push   %ebp
     5e1:	89 e5                	mov    %esp,%ebp
     5e3:	56                   	push   %esi
     5e4:	53                   	push   %ebx
  char *s;

  s = *ps;
     5e5:	8b 45 08             	mov    0x8(%ebp),%eax
{
     5e8:	8b 75 0c             	mov    0xc(%ebp),%esi
  s = *ps;
     5eb:	8b 18                	mov    (%eax),%ebx
  while(s < es && strchr(whitespace, *s))
     5ed:	39 f3                	cmp    %esi,%ebx
     5ef:	72 0e                	jb     5ff <peek+0x1f>
     5f1:	eb 24                	jmp    617 <peek+0x37>
     5f3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    s++;
     5f8:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     5fb:	39 de                	cmp    %ebx,%esi
     5fd:	74 18                	je     617 <peek+0x37>
     5ff:	0f be 03             	movsbl (%ebx),%eax
     602:	83 ec 08             	sub    $0x8,%esp
     605:	50                   	push   %eax
     606:	68 ac 1a 00 00       	push   $0x1aac
     60b:	e8 b0 06 00 00       	call   cc0 <strchr>
     610:	83 c4 10             	add    $0x10,%esp
     613:	85 c0                	test   %eax,%eax
     615:	75 e1                	jne    5f8 <peek+0x18>
  *ps = s;
     617:	8b 45 08             	mov    0x8(%ebp),%eax
  return *s && strchr(toks, *s);
     61a:	31 d2                	xor    %edx,%edx
  *ps = s;
     61c:	89 18                	mov    %ebx,(%eax)
  return *s && strchr(toks, *s);
     61e:	0f be 03             	movsbl (%ebx),%eax
     621:	84 c0                	test   %al,%al
     623:	75 0b                	jne    630 <peek+0x50>
}
     625:	8d 65 f8             	lea    -0x8(%ebp),%esp
     628:	89 d0                	mov    %edx,%eax
     62a:	5b                   	pop    %ebx
     62b:	5e                   	pop    %esi
     62c:	5d                   	pop    %ebp
     62d:	c3                   	ret
     62e:	66 90                	xchg   %ax,%ax
  return *s && strchr(toks, *s);
     630:	83 ec 08             	sub    $0x8,%esp
     633:	50                   	push   %eax
     634:	ff 75 10             	push   0x10(%ebp)
     637:	e8 84 06 00 00       	call   cc0 <strchr>
     63c:	83 c4 10             	add    $0x10,%esp
     63f:	31 d2                	xor    %edx,%edx
     641:	85 c0                	test   %eax,%eax
     643:	0f 95 c2             	setne  %dl
}
     646:	8d 65 f8             	lea    -0x8(%ebp),%esp
     649:	5b                   	pop    %ebx
     64a:	89 d0                	mov    %edx,%eax
     64c:	5e                   	pop    %esi
     64d:	5d                   	pop    %ebp
     64e:	c3                   	ret
     64f:	90                   	nop

00000650 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     650:	55                   	push   %ebp
     651:	89 e5                	mov    %esp,%ebp
     653:	57                   	push   %edi
     654:	56                   	push   %esi
     655:	53                   	push   %ebx
     656:	83 ec 2c             	sub    $0x2c,%esp
     659:	8b 75 0c             	mov    0xc(%ebp),%esi
     65c:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     65f:	90                   	nop
     660:	83 ec 04             	sub    $0x4,%esp
     663:	68 99 13 00 00       	push   $0x1399
     668:	53                   	push   %ebx
     669:	56                   	push   %esi
     66a:	e8 71 ff ff ff       	call   5e0 <peek>
     66f:	83 c4 10             	add    $0x10,%esp
     672:	85 c0                	test   %eax,%eax
     674:	0f 84 f6 00 00 00    	je     770 <parseredirs+0x120>
    tok = gettoken(ps, es, 0, 0);
     67a:	6a 00                	push   $0x0
     67c:	6a 00                	push   $0x0
     67e:	53                   	push   %ebx
     67f:	56                   	push   %esi
     680:	e8 db fd ff ff       	call   460 <gettoken>
     685:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     687:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     68a:	50                   	push   %eax
     68b:	8d 45 e0             	lea    -0x20(%ebp),%eax
     68e:	50                   	push   %eax
     68f:	53                   	push   %ebx
     690:	56                   	push   %esi
     691:	e8 ca fd ff ff       	call   460 <gettoken>
     696:	83 c4 20             	add    $0x20,%esp
     699:	83 f8 61             	cmp    $0x61,%eax
     69c:	0f 85 d9 00 00 00    	jne    77b <parseredirs+0x12b>
      panic("missing file for redirection");
    switch(tok){
     6a2:	83 ff 3c             	cmp    $0x3c,%edi
     6a5:	74 69                	je     710 <parseredirs+0xc0>
     6a7:	83 ff 3e             	cmp    $0x3e,%edi
     6aa:	74 05                	je     6b1 <parseredirs+0x61>
     6ac:	83 ff 2b             	cmp    $0x2b,%edi
     6af:	75 af                	jne    660 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6b1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     6b4:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     6b7:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6ba:	89 55 d0             	mov    %edx,-0x30(%ebp)
     6bd:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     6c0:	6a 18                	push   $0x18
     6c2:	e8 59 0b 00 00       	call   1220 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     6c7:	83 c4 0c             	add    $0xc,%esp
     6ca:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     6cc:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     6ce:	6a 00                	push   $0x0
     6d0:	50                   	push   %eax
     6d1:	e8 ca 05 00 00       	call   ca0 <memset>
  cmd->type = REDIR;
     6d6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     6dc:	8b 45 08             	mov    0x8(%ebp),%eax
      break;
     6df:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     6e2:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     6e5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     6e8:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     6eb:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->mode = mode;
     6ee:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
  cmd->efile = efile;
     6f5:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->fd = fd;
     6f8:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6ff:	89 7d 08             	mov    %edi,0x8(%ebp)
      break;
     702:	e9 59 ff ff ff       	jmp    660 <parseredirs+0x10>
     707:	90                   	nop
     708:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     70f:	00 
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     710:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     713:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     716:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     719:	89 55 d0             	mov    %edx,-0x30(%ebp)
     71c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     71f:	6a 18                	push   $0x18
     721:	e8 fa 0a 00 00       	call   1220 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     726:	83 c4 0c             	add    $0xc,%esp
     729:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     72b:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     72d:	6a 00                	push   $0x0
     72f:	50                   	push   %eax
     730:	e8 6b 05 00 00       	call   ca0 <memset>
  cmd->cmd = subcmd;
     735:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->file = file;
     738:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      break;
     73b:	83 c4 10             	add    $0x10,%esp
  cmd->efile = efile;
     73e:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->type = REDIR;
     741:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     747:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     74a:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     74d:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->mode = mode;
     750:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
  cmd->fd = fd;
     757:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     75e:	89 7d 08             	mov    %edi,0x8(%ebp)
      break;
     761:	e9 fa fe ff ff       	jmp    660 <parseredirs+0x10>
     766:	66 90                	xchg   %ax,%ax
     768:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     76f:	00 
    }
  }
  return cmd;
}
     770:	8b 45 08             	mov    0x8(%ebp),%eax
     773:	8d 65 f4             	lea    -0xc(%ebp),%esp
     776:	5b                   	pop    %ebx
     777:	5e                   	pop    %esi
     778:	5f                   	pop    %edi
     779:	5d                   	pop    %ebp
     77a:	c3                   	ret
      panic("missing file for redirection");
     77b:	83 ec 0c             	sub    $0xc,%esp
     77e:	68 7c 13 00 00       	push   $0x137c
     783:	e8 e8 f9 ff ff       	call   170 <panic>
     788:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     78f:	00 

00000790 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     790:	55                   	push   %ebp
     791:	89 e5                	mov    %esp,%ebp
     793:	83 ec 3c             	sub    $0x3c,%esp
     796:	89 5d f4             	mov    %ebx,-0xc(%ebp)
     799:	8b 5d 08             	mov    0x8(%ebp),%ebx
     79c:	89 75 f8             	mov    %esi,-0x8(%ebp)
     79f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     7a2:	68 9c 13 00 00       	push   $0x139c
     7a7:	56                   	push   %esi
     7a8:	53                   	push   %ebx
     7a9:	e8 32 fe ff ff       	call   5e0 <peek>
     7ae:	83 c4 10             	add    $0x10,%esp
     7b1:	85 c0                	test   %eax,%eax
     7b3:	0f 85 af 00 00 00    	jne    868 <parseexec+0xd8>
  cmd = malloc(sizeof(*cmd));
     7b9:	83 ec 0c             	sub    $0xc,%esp
     7bc:	89 7d fc             	mov    %edi,-0x4(%ebp)
     7bf:	89 c7                	mov    %eax,%edi
     7c1:	6a 54                	push   $0x54
     7c3:	e8 58 0a 00 00       	call   1220 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     7c8:	83 c4 0c             	add    $0xc,%esp
     7cb:	6a 54                	push   $0x54
     7cd:	6a 00                	push   $0x0
     7cf:	50                   	push   %eax
     7d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
     7d3:	e8 c8 04 00 00       	call   ca0 <memset>
  cmd->type = EXEC;
     7d8:	8b 45 d0             	mov    -0x30(%ebp),%eax

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     7db:	83 c4 0c             	add    $0xc,%esp
  cmd->type = EXEC;
     7de:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  ret = parseredirs(ret, ps, es);
     7e4:	56                   	push   %esi
     7e5:	53                   	push   %ebx
     7e6:	50                   	push   %eax
     7e7:	e8 64 fe ff ff       	call   650 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     7ec:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     7ef:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     7f2:	eb 17                	jmp    80b <parseexec+0x7b>
     7f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     7f8:	83 ec 04             	sub    $0x4,%esp
     7fb:	56                   	push   %esi
     7fc:	53                   	push   %ebx
     7fd:	ff 75 d4             	push   -0x2c(%ebp)
     800:	e8 4b fe ff ff       	call   650 <parseredirs>
     805:	83 c4 10             	add    $0x10,%esp
     808:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     80b:	83 ec 04             	sub    $0x4,%esp
     80e:	68 b3 13 00 00       	push   $0x13b3
     813:	56                   	push   %esi
     814:	53                   	push   %ebx
     815:	e8 c6 fd ff ff       	call   5e0 <peek>
     81a:	83 c4 10             	add    $0x10,%esp
     81d:	85 c0                	test   %eax,%eax
     81f:	75 5f                	jne    880 <parseexec+0xf0>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     821:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     824:	50                   	push   %eax
     825:	8d 45 e0             	lea    -0x20(%ebp),%eax
     828:	50                   	push   %eax
     829:	56                   	push   %esi
     82a:	53                   	push   %ebx
     82b:	e8 30 fc ff ff       	call   460 <gettoken>
     830:	83 c4 10             	add    $0x10,%esp
     833:	85 c0                	test   %eax,%eax
     835:	74 49                	je     880 <parseexec+0xf0>
    if(tok != 'a')
     837:	83 f8 61             	cmp    $0x61,%eax
     83a:	75 65                	jne    8a1 <parseexec+0x111>
    cmd->argv[argc] = q;
     83c:	8b 45 e0             	mov    -0x20(%ebp),%eax
     83f:	8b 55 d0             	mov    -0x30(%ebp),%edx
     842:	89 44 ba 04          	mov    %eax,0x4(%edx,%edi,4)
    cmd->eargv[argc] = eq;
     846:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     849:	89 44 ba 2c          	mov    %eax,0x2c(%edx,%edi,4)
    argc++;
     84d:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARGS)
     850:	83 ff 0a             	cmp    $0xa,%edi
     853:	75 a3                	jne    7f8 <parseexec+0x68>
      panic("too many args");
     855:	83 ec 0c             	sub    $0xc,%esp
     858:	68 a5 13 00 00       	push   $0x13a5
     85d:	e8 0e f9 ff ff       	call   170 <panic>
     862:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     868:	89 75 0c             	mov    %esi,0xc(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     86b:	8b 75 f8             	mov    -0x8(%ebp),%esi
    return parseblock(ps, es);
     86e:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
     871:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     874:	c9                   	leave
    return parseblock(ps, es);
     875:	e9 a6 01 00 00       	jmp    a20 <parseblock>
     87a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  cmd->argv[argc] = 0;
     880:	8b 45 d0             	mov    -0x30(%ebp),%eax
     883:	c7 44 b8 04 00 00 00 	movl   $0x0,0x4(%eax,%edi,4)
     88a:	00 
  cmd->eargv[argc] = 0;
     88b:	c7 44 b8 2c 00 00 00 	movl   $0x0,0x2c(%eax,%edi,4)
     892:	00 
}
     893:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     896:	8b 7d fc             	mov    -0x4(%ebp),%edi
     899:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     89c:	8b 75 f8             	mov    -0x8(%ebp),%esi
     89f:	c9                   	leave
     8a0:	c3                   	ret
      panic("syntax");
     8a1:	83 ec 0c             	sub    $0xc,%esp
     8a4:	68 9e 13 00 00       	push   $0x139e
     8a9:	e8 c2 f8 ff ff       	call   170 <panic>
     8ae:	66 90                	xchg   %ax,%ax

000008b0 <parsepipe>:
{
     8b0:	55                   	push   %ebp
     8b1:	89 e5                	mov    %esp,%ebp
     8b3:	57                   	push   %edi
     8b4:	56                   	push   %esi
     8b5:	53                   	push   %ebx
     8b6:	83 ec 14             	sub    $0x14,%esp
     8b9:	8b 75 08             	mov    0x8(%ebp),%esi
     8bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     8bf:	57                   	push   %edi
     8c0:	56                   	push   %esi
     8c1:	e8 ca fe ff ff       	call   790 <parseexec>
  if(peek(ps, es, "|")){
     8c6:	83 c4 0c             	add    $0xc,%esp
     8c9:	68 b8 13 00 00       	push   $0x13b8
  cmd = parseexec(ps, es);
     8ce:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     8d0:	57                   	push   %edi
     8d1:	56                   	push   %esi
     8d2:	e8 09 fd ff ff       	call   5e0 <peek>
     8d7:	83 c4 10             	add    $0x10,%esp
     8da:	85 c0                	test   %eax,%eax
     8dc:	75 12                	jne    8f0 <parsepipe+0x40>
}
     8de:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8e1:	89 d8                	mov    %ebx,%eax
     8e3:	5b                   	pop    %ebx
     8e4:	5e                   	pop    %esi
     8e5:	5f                   	pop    %edi
     8e6:	5d                   	pop    %ebp
     8e7:	c3                   	ret
     8e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     8ef:	00 
    gettoken(ps, es, 0, 0);
     8f0:	6a 00                	push   $0x0
     8f2:	6a 00                	push   $0x0
     8f4:	57                   	push   %edi
     8f5:	56                   	push   %esi
     8f6:	e8 65 fb ff ff       	call   460 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8fb:	58                   	pop    %eax
     8fc:	5a                   	pop    %edx
     8fd:	57                   	push   %edi
     8fe:	56                   	push   %esi
     8ff:	e8 ac ff ff ff       	call   8b0 <parsepipe>
  cmd = malloc(sizeof(*cmd));
     904:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = pipecmd(cmd, parsepipe(ps, es));
     90b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     90d:	e8 0e 09 00 00       	call   1220 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     912:	83 c4 0c             	add    $0xc,%esp
     915:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     917:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     919:	6a 00                	push   $0x0
     91b:	50                   	push   %eax
     91c:	e8 7f 03 00 00       	call   ca0 <memset>
  cmd->left = left;
     921:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     924:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
     927:	89 f3                	mov    %esi,%ebx
  cmd->type = PIPE;
     929:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
}
     92f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     931:	89 7e 08             	mov    %edi,0x8(%esi)
}
     934:	8d 65 f4             	lea    -0xc(%ebp),%esp
     937:	5b                   	pop    %ebx
     938:	5e                   	pop    %esi
     939:	5f                   	pop    %edi
     93a:	5d                   	pop    %ebp
     93b:	c3                   	ret
     93c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000940 <parseline>:
{
     940:	55                   	push   %ebp
     941:	89 e5                	mov    %esp,%ebp
     943:	57                   	push   %edi
     944:	56                   	push   %esi
     945:	53                   	push   %ebx
     946:	83 ec 24             	sub    $0x24,%esp
     949:	8b 75 08             	mov    0x8(%ebp),%esi
     94c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     94f:	57                   	push   %edi
     950:	56                   	push   %esi
     951:	e8 5a ff ff ff       	call   8b0 <parsepipe>
  while(peek(ps, es, "&")){
     956:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     959:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     95b:	eb 3b                	jmp    998 <parseline+0x58>
     95d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     960:	6a 00                	push   $0x0
     962:	6a 00                	push   $0x0
     964:	57                   	push   %edi
     965:	56                   	push   %esi
     966:	e8 f5 fa ff ff       	call   460 <gettoken>
  cmd = malloc(sizeof(*cmd));
     96b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     972:	e8 a9 08 00 00       	call   1220 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     977:	83 c4 0c             	add    $0xc,%esp
     97a:	6a 08                	push   $0x8
     97c:	6a 00                	push   $0x0
     97e:	50                   	push   %eax
     97f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     982:	e8 19 03 00 00       	call   ca0 <memset>
  cmd->type = BACK;
     987:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  cmd->cmd = subcmd;
     98a:	83 c4 10             	add    $0x10,%esp
  cmd->type = BACK;
     98d:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
  cmd->cmd = subcmd;
     993:	89 5a 04             	mov    %ebx,0x4(%edx)
    cmd = backcmd(cmd);
     996:	89 d3                	mov    %edx,%ebx
  while(peek(ps, es, "&")){
     998:	83 ec 04             	sub    $0x4,%esp
     99b:	68 ba 13 00 00       	push   $0x13ba
     9a0:	57                   	push   %edi
     9a1:	56                   	push   %esi
     9a2:	e8 39 fc ff ff       	call   5e0 <peek>
     9a7:	83 c4 10             	add    $0x10,%esp
     9aa:	85 c0                	test   %eax,%eax
     9ac:	75 b2                	jne    960 <parseline+0x20>
  if(peek(ps, es, ";")){
     9ae:	83 ec 04             	sub    $0x4,%esp
     9b1:	68 b6 13 00 00       	push   $0x13b6
     9b6:	57                   	push   %edi
     9b7:	56                   	push   %esi
     9b8:	e8 23 fc ff ff       	call   5e0 <peek>
     9bd:	83 c4 10             	add    $0x10,%esp
     9c0:	85 c0                	test   %eax,%eax
     9c2:	75 0c                	jne    9d0 <parseline+0x90>
}
     9c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9c7:	89 d8                	mov    %ebx,%eax
     9c9:	5b                   	pop    %ebx
     9ca:	5e                   	pop    %esi
     9cb:	5f                   	pop    %edi
     9cc:	5d                   	pop    %ebp
     9cd:	c3                   	ret
     9ce:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     9d0:	6a 00                	push   $0x0
     9d2:	6a 00                	push   $0x0
     9d4:	57                   	push   %edi
     9d5:	56                   	push   %esi
     9d6:	e8 85 fa ff ff       	call   460 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     9db:	58                   	pop    %eax
     9dc:	5a                   	pop    %edx
     9dd:	57                   	push   %edi
     9de:	56                   	push   %esi
     9df:	e8 5c ff ff ff       	call   940 <parseline>
  cmd = malloc(sizeof(*cmd));
     9e4:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = listcmd(cmd, parseline(ps, es));
     9eb:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     9ed:	e8 2e 08 00 00       	call   1220 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     9f2:	83 c4 0c             	add    $0xc,%esp
     9f5:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     9f7:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     9f9:	6a 00                	push   $0x0
     9fb:	50                   	push   %eax
     9fc:	e8 9f 02 00 00       	call   ca0 <memset>
  cmd->left = left;
     a01:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     a04:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
     a07:	89 f3                	mov    %esi,%ebx
  cmd->type = LIST;
     a09:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
}
     a0f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     a11:	89 7e 08             	mov    %edi,0x8(%esi)
}
     a14:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a17:	5b                   	pop    %ebx
     a18:	5e                   	pop    %esi
     a19:	5f                   	pop    %edi
     a1a:	5d                   	pop    %ebp
     a1b:	c3                   	ret
     a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a20 <parseblock>:
{
     a20:	55                   	push   %ebp
     a21:	89 e5                	mov    %esp,%ebp
     a23:	57                   	push   %edi
     a24:	56                   	push   %esi
     a25:	53                   	push   %ebx
     a26:	83 ec 10             	sub    $0x10,%esp
     a29:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a2c:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     a2f:	68 9c 13 00 00       	push   $0x139c
     a34:	56                   	push   %esi
     a35:	53                   	push   %ebx
     a36:	e8 a5 fb ff ff       	call   5e0 <peek>
     a3b:	83 c4 10             	add    $0x10,%esp
     a3e:	85 c0                	test   %eax,%eax
     a40:	74 4a                	je     a8c <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     a42:	6a 00                	push   $0x0
     a44:	6a 00                	push   $0x0
     a46:	56                   	push   %esi
     a47:	53                   	push   %ebx
     a48:	e8 13 fa ff ff       	call   460 <gettoken>
  cmd = parseline(ps, es);
     a4d:	58                   	pop    %eax
     a4e:	5a                   	pop    %edx
     a4f:	56                   	push   %esi
     a50:	53                   	push   %ebx
     a51:	e8 ea fe ff ff       	call   940 <parseline>
  if(!peek(ps, es, ")"))
     a56:	83 c4 0c             	add    $0xc,%esp
     a59:	68 d8 13 00 00       	push   $0x13d8
  cmd = parseline(ps, es);
     a5e:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     a60:	56                   	push   %esi
     a61:	53                   	push   %ebx
     a62:	e8 79 fb ff ff       	call   5e0 <peek>
     a67:	83 c4 10             	add    $0x10,%esp
     a6a:	85 c0                	test   %eax,%eax
     a6c:	74 2b                	je     a99 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     a6e:	6a 00                	push   $0x0
     a70:	6a 00                	push   $0x0
     a72:	56                   	push   %esi
     a73:	53                   	push   %ebx
     a74:	e8 e7 f9 ff ff       	call   460 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     a79:	83 c4 0c             	add    $0xc,%esp
     a7c:	56                   	push   %esi
     a7d:	53                   	push   %ebx
     a7e:	57                   	push   %edi
     a7f:	e8 cc fb ff ff       	call   650 <parseredirs>
}
     a84:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a87:	5b                   	pop    %ebx
     a88:	5e                   	pop    %esi
     a89:	5f                   	pop    %edi
     a8a:	5d                   	pop    %ebp
     a8b:	c3                   	ret
    panic("parseblock");
     a8c:	83 ec 0c             	sub    $0xc,%esp
     a8f:	68 bc 13 00 00       	push   $0x13bc
     a94:	e8 d7 f6 ff ff       	call   170 <panic>
    panic("syntax - missing )");
     a99:	83 ec 0c             	sub    $0xc,%esp
     a9c:	68 c7 13 00 00       	push   $0x13c7
     aa1:	e8 ca f6 ff ff       	call   170 <panic>
     aa6:	66 90                	xchg   %ax,%ax
     aa8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     aaf:	00 

00000ab0 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     ab0:	55                   	push   %ebp
     ab1:	89 e5                	mov    %esp,%ebp
     ab3:	53                   	push   %ebx
     ab4:	83 ec 04             	sub    $0x4,%esp
     ab7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     aba:	85 db                	test   %ebx,%ebx
     abc:	74 29                	je     ae7 <nulterminate+0x37>
    return 0;

  switch(cmd->type){
     abe:	83 3b 05             	cmpl   $0x5,(%ebx)
     ac1:	77 24                	ja     ae7 <nulterminate+0x37>
     ac3:	8b 03                	mov    (%ebx),%eax
     ac5:	ff 24 85 20 14 00 00 	jmp    *0x1420(,%eax,4)
     acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     ad0:	83 ec 0c             	sub    $0xc,%esp
     ad3:	ff 73 04             	push   0x4(%ebx)
     ad6:	e8 d5 ff ff ff       	call   ab0 <nulterminate>
    nulterminate(lcmd->right);
     adb:	58                   	pop    %eax
     adc:	ff 73 08             	push   0x8(%ebx)
     adf:	e8 cc ff ff ff       	call   ab0 <nulterminate>
    break;
     ae4:	83 c4 10             	add    $0x10,%esp
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     ae7:	89 d8                	mov    %ebx,%eax
     ae9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     aec:	c9                   	leave
     aed:	c3                   	ret
     aee:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
     af0:	83 ec 0c             	sub    $0xc,%esp
     af3:	ff 73 04             	push   0x4(%ebx)
     af6:	e8 b5 ff ff ff       	call   ab0 <nulterminate>
}
     afb:	89 d8                	mov    %ebx,%eax
    break;
     afd:	83 c4 10             	add    $0x10,%esp
}
     b00:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b03:	c9                   	leave
     b04:	c3                   	ret
     b05:	8d 76 00             	lea    0x0(%esi),%esi
    for(i=0; ecmd->argv[i]; i++)
     b08:	8b 4b 04             	mov    0x4(%ebx),%ecx
     b0b:	85 c9                	test   %ecx,%ecx
     b0d:	74 d8                	je     ae7 <nulterminate+0x37>
     b0f:	8d 43 08             	lea    0x8(%ebx),%eax
     b12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     b18:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     b1f:	00 
      *ecmd->eargv[i] = 0;
     b20:	8b 50 24             	mov    0x24(%eax),%edx
    for(i=0; ecmd->argv[i]; i++)
     b23:	83 c0 04             	add    $0x4,%eax
      *ecmd->eargv[i] = 0;
     b26:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     b29:	8b 50 fc             	mov    -0x4(%eax),%edx
     b2c:	85 d2                	test   %edx,%edx
     b2e:	75 f0                	jne    b20 <nulterminate+0x70>
}
     b30:	89 d8                	mov    %ebx,%eax
     b32:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b35:	c9                   	leave
     b36:	c3                   	ret
     b37:	90                   	nop
     b38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     b3f:	00 
    nulterminate(rcmd->cmd);
     b40:	83 ec 0c             	sub    $0xc,%esp
     b43:	ff 73 04             	push   0x4(%ebx)
     b46:	e8 65 ff ff ff       	call   ab0 <nulterminate>
    *rcmd->efile = 0;
     b4b:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     b4e:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     b51:	c6 00 00             	movb   $0x0,(%eax)
}
     b54:	89 d8                	mov    %ebx,%eax
     b56:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b59:	c9                   	leave
     b5a:	c3                   	ret
     b5b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000b60 <parsecmd>:
{
     b60:	55                   	push   %ebp
     b61:	89 e5                	mov    %esp,%ebp
     b63:	57                   	push   %edi
     b64:	56                   	push   %esi
  cmd = parseline(&s, es);
     b65:	8d 7d 08             	lea    0x8(%ebp),%edi
{
     b68:	53                   	push   %ebx
     b69:	83 ec 18             	sub    $0x18,%esp
  es = s + strlen(s);
     b6c:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b6f:	53                   	push   %ebx
     b70:	e8 fb 00 00 00       	call   c70 <strlen>
  cmd = parseline(&s, es);
     b75:	59                   	pop    %ecx
     b76:	5e                   	pop    %esi
  es = s + strlen(s);
     b77:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     b79:	53                   	push   %ebx
     b7a:	57                   	push   %edi
     b7b:	e8 c0 fd ff ff       	call   940 <parseline>
  peek(&s, es, "");
     b80:	83 c4 0c             	add    $0xc,%esp
     b83:	68 66 13 00 00       	push   $0x1366
  cmd = parseline(&s, es);
     b88:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     b8a:	53                   	push   %ebx
     b8b:	57                   	push   %edi
     b8c:	e8 4f fa ff ff       	call   5e0 <peek>
  if(s != es){
     b91:	8b 45 08             	mov    0x8(%ebp),%eax
     b94:	83 c4 10             	add    $0x10,%esp
     b97:	39 d8                	cmp    %ebx,%eax
     b99:	75 13                	jne    bae <parsecmd+0x4e>
  nulterminate(cmd);
     b9b:	83 ec 0c             	sub    $0xc,%esp
     b9e:	56                   	push   %esi
     b9f:	e8 0c ff ff ff       	call   ab0 <nulterminate>
}
     ba4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ba7:	89 f0                	mov    %esi,%eax
     ba9:	5b                   	pop    %ebx
     baa:	5e                   	pop    %esi
     bab:	5f                   	pop    %edi
     bac:	5d                   	pop    %ebp
     bad:	c3                   	ret
    printf(2, "leftovers: %s\n", s);
     bae:	52                   	push   %edx
     baf:	50                   	push   %eax
     bb0:	68 da 13 00 00       	push   $0x13da
     bb5:	6a 02                	push   $0x2
     bb7:	e8 e4 03 00 00       	call   fa0 <printf>
    panic("syntax");
     bbc:	c7 04 24 9e 13 00 00 	movl   $0x139e,(%esp)
     bc3:	e8 a8 f5 ff ff       	call   170 <panic>
     bc8:	66 90                	xchg   %ax,%ax
     bca:	66 90                	xchg   %ax,%ax
     bcc:	66 90                	xchg   %ax,%ax
     bce:	66 90                	xchg   %ax,%ax
     bd0:	66 90                	xchg   %ax,%ax
     bd2:	66 90                	xchg   %ax,%ax
     bd4:	66 90                	xchg   %ax,%ax
     bd6:	66 90                	xchg   %ax,%ax
     bd8:	66 90                	xchg   %ax,%ax
     bda:	66 90                	xchg   %ax,%ax
     bdc:	66 90                	xchg   %ax,%ax
     bde:	66 90                	xchg   %ax,%ax

00000be0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     be0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     be1:	31 c0                	xor    %eax,%eax
{
     be3:	89 e5                	mov    %esp,%ebp
     be5:	53                   	push   %ebx
     be6:	8b 4d 08             	mov    0x8(%ebp),%ecx
     be9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     bec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     bf0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     bf4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     bf7:	83 c0 01             	add    $0x1,%eax
     bfa:	84 d2                	test   %dl,%dl
     bfc:	75 f2                	jne    bf0 <strcpy+0x10>
    ;
  return os;
}
     bfe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c01:	89 c8                	mov    %ecx,%eax
     c03:	c9                   	leave
     c04:	c3                   	ret
     c05:	8d 76 00             	lea    0x0(%esi),%esi
     c08:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     c0f:	00 

00000c10 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     c10:	55                   	push   %ebp
     c11:	89 e5                	mov    %esp,%ebp
     c13:	53                   	push   %ebx
     c14:	8b 55 08             	mov    0x8(%ebp),%edx
     c17:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     c1a:	0f b6 02             	movzbl (%edx),%eax
     c1d:	84 c0                	test   %al,%al
     c1f:	75 2d                	jne    c4e <strcmp+0x3e>
     c21:	eb 3d                	jmp    c60 <strcmp+0x50>
     c23:	eb 1b                	jmp    c40 <strcmp+0x30>
     c25:	8d 76 00             	lea    0x0(%esi),%esi
     c28:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     c2f:	00 
     c30:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     c37:	00 
     c38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     c3f:	00 
     c40:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     c44:	83 c2 01             	add    $0x1,%edx
     c47:	83 c1 01             	add    $0x1,%ecx
  while(*p && *p == *q)
     c4a:	84 c0                	test   %al,%al
     c4c:	74 12                	je     c60 <strcmp+0x50>
     c4e:	0f b6 19             	movzbl (%ecx),%ebx
     c51:	38 c3                	cmp    %al,%bl
     c53:	74 eb                	je     c40 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
     c55:	29 d8                	sub    %ebx,%eax
}
     c57:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c5a:	c9                   	leave
     c5b:	c3                   	ret
     c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return (uchar)*p - (uchar)*q;
     c60:	0f b6 19             	movzbl (%ecx),%ebx
     c63:	31 c0                	xor    %eax,%eax
     c65:	29 d8                	sub    %ebx,%eax
}
     c67:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c6a:	c9                   	leave
     c6b:	c3                   	ret
     c6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c70 <strlen>:

uint
strlen(const char *s)
{
     c70:	55                   	push   %ebp
     c71:	89 e5                	mov    %esp,%ebp
     c73:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     c76:	80 3a 00             	cmpb   $0x0,(%edx)
     c79:	74 15                	je     c90 <strlen+0x20>
     c7b:	31 c0                	xor    %eax,%eax
     c7d:	8d 76 00             	lea    0x0(%esi),%esi
     c80:	83 c0 01             	add    $0x1,%eax
     c83:	89 c1                	mov    %eax,%ecx
     c85:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     c89:	75 f5                	jne    c80 <strlen+0x10>
    ;
  return n;
}
     c8b:	89 c8                	mov    %ecx,%eax
     c8d:	5d                   	pop    %ebp
     c8e:	c3                   	ret
     c8f:	90                   	nop
  for(n = 0; s[n]; n++)
     c90:	31 c9                	xor    %ecx,%ecx
}
     c92:	5d                   	pop    %ebp
     c93:	89 c8                	mov    %ecx,%eax
     c95:	c3                   	ret
     c96:	66 90                	xchg   %ax,%ax
     c98:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     c9f:	00 

00000ca0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     ca0:	55                   	push   %ebp
     ca1:	89 e5                	mov    %esp,%ebp
     ca3:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     ca4:	8b 4d 10             	mov    0x10(%ebp),%ecx
     ca7:	8b 45 0c             	mov    0xc(%ebp),%eax
     caa:	8b 7d 08             	mov    0x8(%ebp),%edi
     cad:	fc                   	cld
     cae:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     cb0:	8b 45 08             	mov    0x8(%ebp),%eax
     cb3:	8b 7d fc             	mov    -0x4(%ebp),%edi
     cb6:	c9                   	leave
     cb7:	c3                   	ret
     cb8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     cbf:	00 

00000cc0 <strchr>:

char*
strchr(const char *s, char c)
{
     cc0:	55                   	push   %ebp
     cc1:	89 e5                	mov    %esp,%ebp
     cc3:	8b 45 08             	mov    0x8(%ebp),%eax
     cc6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     cca:	0f b6 10             	movzbl (%eax),%edx
     ccd:	84 d2                	test   %dl,%dl
     ccf:	75 1a                	jne    ceb <strchr+0x2b>
     cd1:	eb 25                	jmp    cf8 <strchr+0x38>
     cd3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     cd8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     cdf:	00 
     ce0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     ce4:	83 c0 01             	add    $0x1,%eax
     ce7:	84 d2                	test   %dl,%dl
     ce9:	74 0d                	je     cf8 <strchr+0x38>
    if(*s == c)
     ceb:	38 d1                	cmp    %dl,%cl
     ced:	75 f1                	jne    ce0 <strchr+0x20>
      return (char*)s;
  return 0;
}
     cef:	5d                   	pop    %ebp
     cf0:	c3                   	ret
     cf1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     cf8:	31 c0                	xor    %eax,%eax
}
     cfa:	5d                   	pop    %ebp
     cfb:	c3                   	ret
     cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000d00 <gets>:

char*
gets(char *buf, int max)
{
     d00:	55                   	push   %ebp
     d01:	89 e5                	mov    %esp,%ebp
     d03:	57                   	push   %edi
     d04:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     d05:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
     d08:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     d09:	31 db                	xor    %ebx,%ebx
{
     d0b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     d0e:	eb 27                	jmp    d37 <gets+0x37>
    cc = read(0, &c, 1);
     d10:	83 ec 04             	sub    $0x4,%esp
     d13:	6a 01                	push   $0x1
     d15:	57                   	push   %edi
     d16:	6a 00                	push   $0x0
     d18:	e8 32 01 00 00       	call   e4f <read>
    if(cc < 1)
     d1d:	83 c4 10             	add    $0x10,%esp
     d20:	85 c0                	test   %eax,%eax
     d22:	7e 1d                	jle    d41 <gets+0x41>
      break;
    buf[i++] = c;
     d24:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     d28:	8b 55 08             	mov    0x8(%ebp),%edx
     d2b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     d2f:	3c 0a                	cmp    $0xa,%al
     d31:	74 1d                	je     d50 <gets+0x50>
     d33:	3c 0d                	cmp    $0xd,%al
     d35:	74 19                	je     d50 <gets+0x50>
  for(i=0; i+1 < max; ){
     d37:	89 de                	mov    %ebx,%esi
     d39:	83 c3 01             	add    $0x1,%ebx
     d3c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     d3f:	7c cf                	jl     d10 <gets+0x10>
      break;
  }
  buf[i] = '\0';
     d41:	8b 45 08             	mov    0x8(%ebp),%eax
     d44:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     d48:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d4b:	5b                   	pop    %ebx
     d4c:	5e                   	pop    %esi
     d4d:	5f                   	pop    %edi
     d4e:	5d                   	pop    %ebp
     d4f:	c3                   	ret
  buf[i] = '\0';
     d50:	8b 45 08             	mov    0x8(%ebp),%eax
    buf[i++] = c;
     d53:	89 de                	mov    %ebx,%esi
  buf[i] = '\0';
     d55:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
     d59:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d5c:	5b                   	pop    %ebx
     d5d:	5e                   	pop    %esi
     d5e:	5f                   	pop    %edi
     d5f:	5d                   	pop    %ebp
     d60:	c3                   	ret
     d61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d68:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     d6f:	00 

00000d70 <stat>:

int
stat(const char *n, struct stat *st)
{
     d70:	55                   	push   %ebp
     d71:	89 e5                	mov    %esp,%ebp
     d73:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     d76:	6a 00                	push   $0x0
     d78:	ff 75 08             	push   0x8(%ebp)
{
     d7b:	89 75 fc             	mov    %esi,-0x4(%ebp)
  fd = open(n, O_RDONLY);
     d7e:	e8 f4 00 00 00       	call   e77 <open>
  if(fd < 0)
     d83:	83 c4 10             	add    $0x10,%esp
     d86:	85 c0                	test   %eax,%eax
     d88:	78 2e                	js     db8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
     d8a:	83 ec 08             	sub    $0x8,%esp
     d8d:	ff 75 0c             	push   0xc(%ebp)
     d90:	50                   	push   %eax
     d91:	89 5d f8             	mov    %ebx,-0x8(%ebp)
     d94:	89 c3                	mov    %eax,%ebx
     d96:	e8 f4 00 00 00       	call   e8f <fstat>
  close(fd);
     d9b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     d9e:	89 c6                	mov    %eax,%esi
  close(fd);
     da0:	e8 ba 00 00 00       	call   e5f <close>
  return r;
     da5:	8b 5d f8             	mov    -0x8(%ebp),%ebx
     da8:	83 c4 10             	add    $0x10,%esp
}
     dab:	89 f0                	mov    %esi,%eax
     dad:	8b 75 fc             	mov    -0x4(%ebp),%esi
     db0:	c9                   	leave
     db1:	c3                   	ret
     db2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
     db8:	be ff ff ff ff       	mov    $0xffffffff,%esi
     dbd:	eb ec                	jmp    dab <stat+0x3b>
     dbf:	90                   	nop

00000dc0 <atoi>:

int
atoi(const char *s)
{
     dc0:	55                   	push   %ebp
     dc1:	89 e5                	mov    %esp,%ebp
     dc3:	53                   	push   %ebx
     dc4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     dc7:	0f be 02             	movsbl (%edx),%eax
     dca:	8d 48 d0             	lea    -0x30(%eax),%ecx
     dcd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     dd0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     dd5:	77 1e                	ja     df5 <atoi+0x35>
     dd7:	90                   	nop
     dd8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     ddf:	00 
    n = n*10 + *s++ - '0';
     de0:	83 c2 01             	add    $0x1,%edx
     de3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     de6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     dea:	0f be 02             	movsbl (%edx),%eax
     ded:	8d 58 d0             	lea    -0x30(%eax),%ebx
     df0:	80 fb 09             	cmp    $0x9,%bl
     df3:	76 eb                	jbe    de0 <atoi+0x20>
  return n;
}
     df5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     df8:	89 c8                	mov    %ecx,%eax
     dfa:	c9                   	leave
     dfb:	c3                   	ret
     dfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000e00 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     e00:	55                   	push   %ebp
     e01:	89 e5                	mov    %esp,%ebp
     e03:	83 ec 08             	sub    $0x8,%esp
     e06:	8b 45 10             	mov    0x10(%ebp),%eax
     e09:	8b 55 08             	mov    0x8(%ebp),%edx
     e0c:	89 75 f8             	mov    %esi,-0x8(%ebp)
     e0f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     e12:	85 c0                	test   %eax,%eax
     e14:	7e 12                	jle    e28 <memmove+0x28>
     e16:	89 7d fc             	mov    %edi,-0x4(%ebp)
     e19:	01 d0                	add    %edx,%eax
  dst = vdst;
     e1b:	89 d7                	mov    %edx,%edi
     e1d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
     e20:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     e21:	39 f8                	cmp    %edi,%eax
     e23:	75 fb                	jne    e20 <memmove+0x20>
     e25:	8b 7d fc             	mov    -0x4(%ebp),%edi
  return vdst;
}
     e28:	8b 75 f8             	mov    -0x8(%ebp),%esi
     e2b:	89 d0                	mov    %edx,%eax
     e2d:	c9                   	leave
     e2e:	c3                   	ret

00000e2f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     e2f:	b8 01 00 00 00       	mov    $0x1,%eax
     e34:	cd 40                	int    $0x40
     e36:	c3                   	ret

00000e37 <exit>:
SYSCALL(exit)
     e37:	b8 02 00 00 00       	mov    $0x2,%eax
     e3c:	cd 40                	int    $0x40
     e3e:	c3                   	ret

00000e3f <wait>:
SYSCALL(wait)
     e3f:	b8 03 00 00 00       	mov    $0x3,%eax
     e44:	cd 40                	int    $0x40
     e46:	c3                   	ret

00000e47 <pipe>:
SYSCALL(pipe)
     e47:	b8 04 00 00 00       	mov    $0x4,%eax
     e4c:	cd 40                	int    $0x40
     e4e:	c3                   	ret

00000e4f <read>:
SYSCALL(read)
     e4f:	b8 05 00 00 00       	mov    $0x5,%eax
     e54:	cd 40                	int    $0x40
     e56:	c3                   	ret

00000e57 <write>:
SYSCALL(write)
     e57:	b8 10 00 00 00       	mov    $0x10,%eax
     e5c:	cd 40                	int    $0x40
     e5e:	c3                   	ret

00000e5f <close>:
SYSCALL(close)
     e5f:	b8 15 00 00 00       	mov    $0x15,%eax
     e64:	cd 40                	int    $0x40
     e66:	c3                   	ret

00000e67 <kill>:
SYSCALL(kill)
     e67:	b8 06 00 00 00       	mov    $0x6,%eax
     e6c:	cd 40                	int    $0x40
     e6e:	c3                   	ret

00000e6f <exec>:
SYSCALL(exec)
     e6f:	b8 07 00 00 00       	mov    $0x7,%eax
     e74:	cd 40                	int    $0x40
     e76:	c3                   	ret

00000e77 <open>:
SYSCALL(open)
     e77:	b8 0f 00 00 00       	mov    $0xf,%eax
     e7c:	cd 40                	int    $0x40
     e7e:	c3                   	ret

00000e7f <mknod>:
SYSCALL(mknod)
     e7f:	b8 11 00 00 00       	mov    $0x11,%eax
     e84:	cd 40                	int    $0x40
     e86:	c3                   	ret

00000e87 <unlink>:
SYSCALL(unlink)
     e87:	b8 12 00 00 00       	mov    $0x12,%eax
     e8c:	cd 40                	int    $0x40
     e8e:	c3                   	ret

00000e8f <fstat>:
SYSCALL(fstat)
     e8f:	b8 08 00 00 00       	mov    $0x8,%eax
     e94:	cd 40                	int    $0x40
     e96:	c3                   	ret

00000e97 <link>:
SYSCALL(link)
     e97:	b8 13 00 00 00       	mov    $0x13,%eax
     e9c:	cd 40                	int    $0x40
     e9e:	c3                   	ret

00000e9f <mkdir>:
SYSCALL(mkdir)
     e9f:	b8 14 00 00 00       	mov    $0x14,%eax
     ea4:	cd 40                	int    $0x40
     ea6:	c3                   	ret

00000ea7 <chdir>:
SYSCALL(chdir)
     ea7:	b8 09 00 00 00       	mov    $0x9,%eax
     eac:	cd 40                	int    $0x40
     eae:	c3                   	ret

00000eaf <dup>:
SYSCALL(dup)
     eaf:	b8 0a 00 00 00       	mov    $0xa,%eax
     eb4:	cd 40                	int    $0x40
     eb6:	c3                   	ret

00000eb7 <getpid>:
SYSCALL(getpid)
     eb7:	b8 0b 00 00 00       	mov    $0xb,%eax
     ebc:	cd 40                	int    $0x40
     ebe:	c3                   	ret

00000ebf <sbrk>:
SYSCALL(sbrk)
     ebf:	b8 0c 00 00 00       	mov    $0xc,%eax
     ec4:	cd 40                	int    $0x40
     ec6:	c3                   	ret

00000ec7 <sleep>:
SYSCALL(sleep)
     ec7:	b8 0d 00 00 00       	mov    $0xd,%eax
     ecc:	cd 40                	int    $0x40
     ece:	c3                   	ret

00000ecf <uptime>:
SYSCALL(uptime)
     ecf:	b8 0e 00 00 00       	mov    $0xe,%eax
     ed4:	cd 40                	int    $0x40
     ed6:	c3                   	ret
     ed7:	66 90                	xchg   %ax,%ax
     ed9:	66 90                	xchg   %ax,%ax
     edb:	66 90                	xchg   %ax,%ax
     edd:	66 90                	xchg   %ax,%ax
     edf:	90                   	nop

00000ee0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     ee0:	55                   	push   %ebp
     ee1:	89 e5                	mov    %esp,%ebp
     ee3:	57                   	push   %edi
     ee4:	56                   	push   %esi
     ee5:	53                   	push   %ebx
     ee6:	89 cb                	mov    %ecx,%ebx
     ee8:	83 ec 3c             	sub    $0x3c,%esp
     eeb:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     eee:	85 d2                	test   %edx,%edx
     ef0:	0f 89 9a 00 00 00    	jns    f90 <printint+0xb0>
     ef6:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     efa:	0f 84 90 00 00 00    	je     f90 <printint+0xb0>
    neg = 1;
    x = -xx;
     f00:	f7 da                	neg    %edx
    neg = 1;
     f02:	b8 01 00 00 00       	mov    $0x1,%eax
     f07:	89 45 c0             	mov    %eax,-0x40(%ebp)
     f0a:	89 d1                	mov    %edx,%ecx
  } else {
    x = xx;
  }

  i = 0;
     f0c:	31 f6                	xor    %esi,%esi
     f0e:	66 90                	xchg   %ax,%ax
     f10:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     f17:	00 
     f18:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     f1f:	00 
  do{
    buf[i++] = digits[x % base];
     f20:	89 c8                	mov    %ecx,%eax
     f22:	31 d2                	xor    %edx,%edx
     f24:	89 f7                	mov    %esi,%edi
     f26:	f7 f3                	div    %ebx
     f28:	8d 76 01             	lea    0x1(%esi),%esi
  }while((x /= base) != 0);
     f2b:	39 d9                	cmp    %ebx,%ecx
    buf[i++] = digits[x % base];
     f2d:	0f b6 92 90 14 00 00 	movzbl 0x1490(%edx),%edx
  }while((x /= base) != 0);
     f34:	89 c1                	mov    %eax,%ecx
    buf[i++] = digits[x % base];
     f36:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
     f3a:	73 e4                	jae    f20 <printint+0x40>
  if(neg)
     f3c:	8b 45 c0             	mov    -0x40(%ebp),%eax
     f3f:	85 c0                	test   %eax,%eax
     f41:	74 07                	je     f4a <printint+0x6a>
    buf[i++] = '-';
     f43:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
     f48:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
     f4a:	8d 74 3d d8          	lea    -0x28(%ebp,%edi,1),%esi
     f4e:	8b 7d c4             	mov    -0x3c(%ebp),%edi
     f51:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     f54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f58:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     f5f:	00 
    putc(fd, buf[i]);
     f60:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
     f63:	83 ec 04             	sub    $0x4,%esp
  while(--i >= 0)
     f66:	83 ee 01             	sub    $0x1,%esi
     f69:	88 45 d7             	mov    %al,-0x29(%ebp)
  write(fd, &c, 1);
     f6c:	8d 45 d7             	lea    -0x29(%ebp),%eax
     f6f:	6a 01                	push   $0x1
     f71:	50                   	push   %eax
     f72:	57                   	push   %edi
     f73:	e8 df fe ff ff       	call   e57 <write>
  while(--i >= 0)
     f78:	83 c4 10             	add    $0x10,%esp
     f7b:	39 f3                	cmp    %esi,%ebx
     f7d:	75 e1                	jne    f60 <printint+0x80>
}
     f7f:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f82:	5b                   	pop    %ebx
     f83:	5e                   	pop    %esi
     f84:	5f                   	pop    %edi
     f85:	5d                   	pop    %ebp
     f86:	c3                   	ret
     f87:	90                   	nop
     f88:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     f8f:	00 
  neg = 0;
     f90:	31 c0                	xor    %eax,%eax
     f92:	e9 70 ff ff ff       	jmp    f07 <printint+0x27>
     f97:	90                   	nop
     f98:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     f9f:	00 

00000fa0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     fa0:	55                   	push   %ebp
     fa1:	89 e5                	mov    %esp,%ebp
     fa3:	83 ec 38             	sub    $0x38,%esp
     fa6:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     fa9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
     fac:	89 75 f8             	mov    %esi,-0x8(%ebp)
     faf:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
     fb2:	0f b6 03             	movzbl (%ebx),%eax
     fb5:	84 c0                	test   %al,%al
     fb7:	0f 84 b6 00 00 00    	je     1073 <printf+0xd3>
  ap = (uint*)(void*)&fmt + 1;
     fbd:	8d 4d 10             	lea    0x10(%ebp),%ecx
     fc0:	89 7d fc             	mov    %edi,-0x4(%ebp)
     fc3:	83 c3 01             	add    $0x1,%ebx
     fc6:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
     fc9:	8b 7d d4             	mov    -0x2c(%ebp),%edi
     fcc:	0f b6 d0             	movzbl %al,%edx
    if(state == 0){
     fcf:	eb 2a                	jmp    ffb <printf+0x5b>
     fd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
     fd8:	83 ec 04             	sub    $0x4,%esp
     fdb:	88 45 e7             	mov    %al,-0x19(%ebp)
     fde:	8d 45 e7             	lea    -0x19(%ebp),%eax
  for(i = 0; fmt[i]; i++){
     fe1:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
     fe4:	6a 01                	push   $0x1
     fe6:	50                   	push   %eax
     fe7:	56                   	push   %esi
     fe8:	e8 6a fe ff ff       	call   e57 <write>
  for(i = 0; fmt[i]; i++){
     fed:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
     ff1:	83 c4 10             	add    $0x10,%esp
     ff4:	84 c0                	test   %al,%al
     ff6:	74 78                	je     1070 <printf+0xd0>
    c = fmt[i] & 0xff;
     ff8:	0f b6 d0             	movzbl %al,%edx
      if(c == '%'){
     ffb:	83 fa 25             	cmp    $0x25,%edx
     ffe:	75 d8                	jne    fd8 <printf+0x38>
  for(i = 0; fmt[i]; i++){
    1000:	0f b6 13             	movzbl (%ebx),%edx
    1003:	84 d2                	test   %dl,%dl
    1005:	74 69                	je     1070 <printf+0xd0>
    c = fmt[i] & 0xff;
    1007:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
    100a:	80 fa 25             	cmp    $0x25,%dl
    100d:	0f 84 25 01 00 00    	je     1138 <printf+0x198>
    1013:	83 e8 63             	sub    $0x63,%eax
    1016:	83 f8 15             	cmp    $0x15,%eax
    1019:	77 0d                	ja     1028 <printf+0x88>
    101b:	ff 24 85 38 14 00 00 	jmp    *0x1438(,%eax,4)
    1022:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1028:	83 ec 04             	sub    $0x4,%esp
    102b:	8d 4d e7             	lea    -0x19(%ebp),%ecx
    102e:	88 55 d0             	mov    %dl,-0x30(%ebp)
    1031:	6a 01                	push   $0x1
    1033:	51                   	push   %ecx
    1034:	56                   	push   %esi
    1035:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    1038:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    103c:	e8 16 fe ff ff       	call   e57 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    1041:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
    1045:	83 c4 0c             	add    $0xc,%esp
    1048:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    104b:	6a 01                	push   $0x1
    104d:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1050:	51                   	push   %ecx
  for(i = 0; fmt[i]; i++){
    1051:	83 c3 02             	add    $0x2,%ebx
  write(fd, &c, 1);
    1054:	56                   	push   %esi
    1055:	e8 fd fd ff ff       	call   e57 <write>
  for(i = 0; fmt[i]; i++){
    105a:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
    105e:	83 c4 10             	add    $0x10,%esp
    1061:	84 c0                	test   %al,%al
    1063:	75 93                	jne    ff8 <printf+0x58>
    1065:	8d 76 00             	lea    0x0(%esi),%esi
    1068:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    106f:	00 
    1070:	8b 7d fc             	mov    -0x4(%ebp),%edi
      }
      state = 0;
    }
  }
}
    1073:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    1076:	8b 75 f8             	mov    -0x8(%ebp),%esi
    1079:	c9                   	leave
    107a:	c3                   	ret
    107b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 16, 0);
    1080:	83 ec 0c             	sub    $0xc,%esp
    1083:	8b 17                	mov    (%edi),%edx
    1085:	b9 10 00 00 00       	mov    $0x10,%ecx
    108a:	89 f0                	mov    %esi,%eax
    108c:	6a 00                	push   $0x0
    108e:	e8 4d fe ff ff       	call   ee0 <printint>
  for(i = 0; fmt[i]; i++){
    1093:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
    1097:	83 c3 02             	add    $0x2,%ebx
    109a:	83 c4 10             	add    $0x10,%esp
    109d:	84 c0                	test   %al,%al
    109f:	74 cf                	je     1070 <printf+0xd0>
        ap++;
    10a1:	83 c7 04             	add    $0x4,%edi
    10a4:	e9 4f ff ff ff       	jmp    ff8 <printf+0x58>
    10a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    10b0:	83 ec 0c             	sub    $0xc,%esp
    10b3:	8b 17                	mov    (%edi),%edx
    10b5:	b9 0a 00 00 00       	mov    $0xa,%ecx
    10ba:	89 f0                	mov    %esi,%eax
    10bc:	6a 01                	push   $0x1
    10be:	e8 1d fe ff ff       	call   ee0 <printint>
  for(i = 0; fmt[i]; i++){
    10c3:	eb ce                	jmp    1093 <printf+0xf3>
    10c5:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    10c8:	83 ec 04             	sub    $0x4,%esp
    10cb:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        putc(fd, *ap);
    10ce:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    10d0:	6a 01                	push   $0x1
    10d2:	51                   	push   %ecx
    10d3:	56                   	push   %esi
        putc(fd, *ap);
    10d4:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    10d7:	e8 7b fd ff ff       	call   e57 <write>
    10dc:	eb b5                	jmp    1093 <printf+0xf3>
    10de:	66 90                	xchg   %ax,%ax
        s = (char*)*ap;
    10e0:	8b 07                	mov    (%edi),%eax
        ap++;
    10e2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    10e5:	85 c0                	test   %eax,%eax
    10e7:	74 67                	je     1150 <printf+0x1b0>
        while(*s != 0){
    10e9:	0f b6 10             	movzbl (%eax),%edx
    10ec:	84 d2                	test   %dl,%dl
    10ee:	74 6f                	je     115f <printf+0x1bf>
    10f0:	89 7d d4             	mov    %edi,-0x2c(%ebp)
    10f3:	89 c7                	mov    %eax,%edi
    10f5:	89 d0                	mov    %edx,%eax
    10f7:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    10fa:	89 fb                	mov    %edi,%ebx
    10fc:	8d 7d e7             	lea    -0x19(%ebp),%edi
    10ff:	90                   	nop
  write(fd, &c, 1);
    1100:	83 ec 04             	sub    $0x4,%esp
          s++;
    1103:	83 c3 01             	add    $0x1,%ebx
    1106:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1109:	6a 01                	push   $0x1
    110b:	57                   	push   %edi
    110c:	56                   	push   %esi
    110d:	e8 45 fd ff ff       	call   e57 <write>
        while(*s != 0){
    1112:	0f b6 03             	movzbl (%ebx),%eax
    1115:	83 c4 10             	add    $0x10,%esp
    1118:	84 c0                	test   %al,%al
    111a:	75 e4                	jne    1100 <printf+0x160>
    111c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
    111f:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
    1123:	83 c3 02             	add    $0x2,%ebx
    1126:	84 c0                	test   %al,%al
    1128:	0f 85 9b fe ff ff    	jne    fc9 <printf+0x29>
    112e:	e9 3d ff ff ff       	jmp    1070 <printf+0xd0>
    1133:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1138:	83 ec 04             	sub    $0x4,%esp
    113b:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    113f:	8d 4d e7             	lea    -0x19(%ebp),%ecx
    1142:	6a 01                	push   $0x1
    1144:	e9 07 ff ff ff       	jmp    1050 <printf+0xb0>
    1149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
          s = "(null)";
    1150:	89 7d d4             	mov    %edi,-0x2c(%ebp)
        if(s == 0)
    1153:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
    1158:	bf ff 13 00 00       	mov    $0x13ff,%edi
    115d:	eb 98                	jmp    10f7 <printf+0x157>
  for(i = 0; fmt[i]; i++){
    115f:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
    1163:	83 c3 02             	add    $0x2,%ebx
    1166:	84 c0                	test   %al,%al
    1168:	0f 85 8a fe ff ff    	jne    ff8 <printf+0x58>
    116e:	e9 fd fe ff ff       	jmp    1070 <printf+0xd0>
    1173:	66 90                	xchg   %ax,%ax
    1175:	66 90                	xchg   %ax,%ax
    1177:	66 90                	xchg   %ax,%ax
    1179:	66 90                	xchg   %ax,%ax
    117b:	66 90                	xchg   %ax,%ax
    117d:	66 90                	xchg   %ax,%ax
    117f:	90                   	nop

00001180 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1180:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1181:	a1 24 1b 00 00       	mov    0x1b24,%eax
{
    1186:	89 e5                	mov    %esp,%ebp
    1188:	57                   	push   %edi
    1189:	56                   	push   %esi
    118a:	53                   	push   %ebx
    118b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    118e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1191:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1198:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    119f:	00 
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    11a0:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    11a2:	39 c8                	cmp    %ecx,%eax
    11a4:	73 32                	jae    11d8 <free+0x58>
    11a6:	39 d1                	cmp    %edx,%ecx
    11a8:	72 04                	jb     11ae <free+0x2e>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    11aa:	39 d0                	cmp    %edx,%eax
    11ac:	72 32                	jb     11e0 <free+0x60>
      break;
  if(bp + bp->s.size == p->s.ptr){
    11ae:	8b 73 fc             	mov    -0x4(%ebx),%esi
    11b1:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    11b4:	39 fa                	cmp    %edi,%edx
    11b6:	74 30                	je     11e8 <free+0x68>
    11b8:	89 53 f8             	mov    %edx,-0x8(%ebx)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    11bb:	8b 50 04             	mov    0x4(%eax),%edx
    11be:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    11c1:	39 f1                	cmp    %esi,%ecx
    11c3:	74 3a                	je     11ff <free+0x7f>
    11c5:	89 08                	mov    %ecx,(%eax)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
}
    11c7:	5b                   	pop    %ebx
  freep = p;
    11c8:	a3 24 1b 00 00       	mov    %eax,0x1b24
}
    11cd:	5e                   	pop    %esi
    11ce:	5f                   	pop    %edi
    11cf:	5d                   	pop    %ebp
    11d0:	c3                   	ret
    11d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    11d8:	39 d0                	cmp    %edx,%eax
    11da:	72 04                	jb     11e0 <free+0x60>
    11dc:	39 d1                	cmp    %edx,%ecx
    11de:	72 ce                	jb     11ae <free+0x2e>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    11e0:	89 d0                	mov    %edx,%eax
    11e2:	eb bc                	jmp    11a0 <free+0x20>
    11e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    11e8:	03 72 04             	add    0x4(%edx),%esi
    11eb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    11ee:	8b 10                	mov    (%eax),%edx
    11f0:	8b 12                	mov    (%edx),%edx
    11f2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    11f5:	8b 50 04             	mov    0x4(%eax),%edx
    11f8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    11fb:	39 f1                	cmp    %esi,%ecx
    11fd:	75 c6                	jne    11c5 <free+0x45>
    p->s.size += bp->s.size;
    11ff:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    1202:	a3 24 1b 00 00       	mov    %eax,0x1b24
    p->s.size += bp->s.size;
    1207:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    120a:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    120d:	89 08                	mov    %ecx,(%eax)
}
    120f:	5b                   	pop    %ebx
    1210:	5e                   	pop    %esi
    1211:	5f                   	pop    %edi
    1212:	5d                   	pop    %ebp
    1213:	c3                   	ret
    1214:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1218:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    121f:	00 

00001220 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1220:	55                   	push   %ebp
    1221:	89 e5                	mov    %esp,%ebp
    1223:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1226:	8b 45 08             	mov    0x8(%ebp),%eax
{
    1229:	89 7d fc             	mov    %edi,-0x4(%ebp)
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    122c:	8d 78 07             	lea    0x7(%eax),%edi
  if((prevp = freep) == 0){
    122f:	a1 24 1b 00 00       	mov    0x1b24,%eax
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1234:	c1 ef 03             	shr    $0x3,%edi
    1237:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    123a:	85 c0                	test   %eax,%eax
    123c:	0f 84 c6 00 00 00    	je     1308 <malloc+0xe8>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1242:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    1244:	8b 4a 04             	mov    0x4(%edx),%ecx
    1247:	39 f9                	cmp    %edi,%ecx
    1249:	0f 83 87 00 00 00    	jae    12d6 <malloc+0xb6>
    124f:	89 5d f4             	mov    %ebx,-0xc(%ebp)
    1252:	89 75 f8             	mov    %esi,-0x8(%ebp)
  if(nu < 4096)
    1255:	bb 00 10 00 00       	mov    $0x1000,%ebx
    125a:	39 df                	cmp    %ebx,%edi
    125c:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    125f:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1266:	eb 21                	jmp    1289 <malloc+0x69>
    1268:	eb 16                	jmp    1280 <malloc+0x60>
    126a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1270:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1277:	00 
    1278:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    127f:	00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1280:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    1282:	8b 4a 04             	mov    0x4(%edx),%ecx
    1285:	39 f9                	cmp    %edi,%ecx
    1287:	73 47                	jae    12d0 <malloc+0xb0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1289:	89 d0                	mov    %edx,%eax
    128b:	39 15 24 1b 00 00    	cmp    %edx,0x1b24
    1291:	75 ed                	jne    1280 <malloc+0x60>
  p = sbrk(nu * sizeof(Header));
    1293:	83 ec 0c             	sub    $0xc,%esp
    1296:	56                   	push   %esi
    1297:	e8 23 fc ff ff       	call   ebf <sbrk>
  if(p == (char*)-1)
    129c:	83 c4 10             	add    $0x10,%esp
    129f:	83 f8 ff             	cmp    $0xffffffff,%eax
    12a2:	74 54                	je     12f8 <malloc+0xd8>
  hp->s.size = nu;
    12a4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    12a7:	83 ec 0c             	sub    $0xc,%esp
    12aa:	83 c0 08             	add    $0x8,%eax
    12ad:	50                   	push   %eax
    12ae:	e8 cd fe ff ff       	call   1180 <free>
  return freep;
    12b3:	a1 24 1b 00 00       	mov    0x1b24,%eax
      if((p = morecore(nunits)) == 0)
    12b8:	83 c4 10             	add    $0x10,%esp
    12bb:	85 c0                	test   %eax,%eax
    12bd:	75 c1                	jne    1280 <malloc+0x60>
    12bf:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    12c2:	8b 75 f8             	mov    -0x8(%ebp),%esi
    12c5:	eb 26                	jmp    12ed <malloc+0xcd>
    12c7:	90                   	nop
    12c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    12cf:	00 
    12d0:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    12d3:	8b 75 f8             	mov    -0x8(%ebp),%esi
      if(p->s.size == nunits)
    12d6:	39 cf                	cmp    %ecx,%edi
    12d8:	74 66                	je     1340 <malloc+0x120>
        p->s.size -= nunits;
    12da:	29 f9                	sub    %edi,%ecx
    12dc:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    12df:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    12e2:	89 7a 04             	mov    %edi,0x4(%edx)
      freep = prevp;
    12e5:	a3 24 1b 00 00       	mov    %eax,0x1b24
      return (void*)(p + 1);
    12ea:	8d 42 08             	lea    0x8(%edx),%eax
        return 0;
  }
}
    12ed:	8b 7d fc             	mov    -0x4(%ebp),%edi
    12f0:	c9                   	leave
    12f1:	c3                   	ret
    12f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        return 0;
    12f8:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    12fb:	8b 75 f8             	mov    -0x8(%ebp),%esi
    12fe:	31 c0                	xor    %eax,%eax
}
    1300:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1303:	c9                   	leave
    1304:	c3                   	ret
    1305:	8d 76 00             	lea    0x0(%esi),%esi
    1308:	89 5d f4             	mov    %ebx,-0xc(%ebp)
    base.s.size = 0;
    130b:	ba 28 1b 00 00       	mov    $0x1b28,%edx
    1310:	89 75 f8             	mov    %esi,-0x8(%ebp)
    base.s.ptr = freep = prevp = &base;
    1313:	c7 05 24 1b 00 00 28 	movl   $0x1b28,0x1b24
    131a:	1b 00 00 
    131d:	c7 05 28 1b 00 00 28 	movl   $0x1b28,0x1b28
    1324:	1b 00 00 
    base.s.size = 0;
    1327:	c7 05 2c 1b 00 00 00 	movl   $0x0,0x1b2c
    132e:	00 00 00 
    if(p->s.size >= nunits){
    1331:	e9 1f ff ff ff       	jmp    1255 <malloc+0x35>
    1336:	66 90                	xchg   %ax,%ax
    1338:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    133f:	00 
        prevp->s.ptr = p->s.ptr;
    1340:	8b 0a                	mov    (%edx),%ecx
    1342:	89 08                	mov    %ecx,(%eax)
    1344:	eb 9f                	jmp    12e5 <malloc+0xc5>
