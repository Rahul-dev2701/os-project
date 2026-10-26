
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	push   -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
      11:	68 16 4e 00 00       	push   $0x4e16
      16:	6a 01                	push   $0x1
      18:	e8 63 3a 00 00       	call   3a80 <printf>

  if(open("usertests.ran", 0) >= 0){
      1d:	59                   	pop    %ecx
      1e:	58                   	pop    %eax
      1f:	6a 00                	push   $0x0
      21:	68 2a 4e 00 00       	push   $0x4e2a
      26:	e8 2c 39 00 00       	call   3957 <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	85 c0                	test   %eax,%eax
      30:	78 13                	js     45 <main+0x45>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      32:	52                   	push   %edx
      33:	52                   	push   %edx
      34:	68 9c 55 00 00       	push   $0x559c
      39:	6a 01                	push   $0x1
      3b:	e8 40 3a 00 00       	call   3a80 <printf>
    exit();
      40:	e8 d2 38 00 00       	call   3917 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      45:	50                   	push   %eax
      46:	50                   	push   %eax
      47:	68 00 02 00 00       	push   $0x200
      4c:	68 2a 4e 00 00       	push   $0x4e2a
      51:	e8 01 39 00 00       	call   3957 <open>
      56:	89 04 24             	mov    %eax,(%esp)
      59:	e8 e1 38 00 00       	call   393f <close>

  argptest();
      5e:	e8 cd 35 00 00       	call   3630 <argptest>
  createdelete();
      63:	e8 a8 11 00 00       	call   1210 <createdelete>
  linkunlink();
      68:	e8 63 1a 00 00       	call   1ad0 <linkunlink>
  concreate();
      6d:	e8 4e 17 00 00       	call   17c0 <concreate>
  fourfiles();
      72:	e8 99 0f 00 00       	call   1010 <fourfiles>
  sharedfd();
      77:	e8 d4 0d 00 00       	call   e50 <sharedfd>

  bigargtest();
      7c:	e8 4f 32 00 00       	call   32d0 <bigargtest>
  bigwrite();
      81:	e8 6a 23 00 00       	call   23f0 <bigwrite>
  bigargtest();
      86:	e8 45 32 00 00       	call   32d0 <bigargtest>
  bsstest();
      8b:	e8 c0 31 00 00       	call   3250 <bsstest>
  sbrktest();
      90:	e8 bb 2c 00 00       	call   2d50 <sbrktest>
  validatetest();
      95:	e8 06 31 00 00       	call   31a0 <validatetest>

  opentest();
      9a:	e8 61 03 00 00       	call   400 <opentest>
  writetest();
      9f:	e8 ec 03 00 00       	call   490 <writetest>
  writetest1();
      a4:	e8 b7 05 00 00       	call   660 <writetest1>
  createtest();
      a9:	e8 82 07 00 00       	call   830 <createtest>

  openiputtest();
      ae:	e8 4d 02 00 00       	call   300 <openiputtest>
  exitiputtest();
      b3:	e8 48 01 00 00       	call   200 <exitiputtest>
  iputtest();
      b8:	e8 63 00 00 00       	call   120 <iputtest>

  mem();
      bd:	e8 ae 0c 00 00       	call   d70 <mem>
  pipe1();
      c2:	e8 49 09 00 00       	call   a10 <pipe1>
  preempt();
      c7:	e8 d4 0a 00 00       	call   ba0 <preempt>
  exitwait();
      cc:	e8 1f 0c 00 00       	call   cf0 <exitwait>

  rmdot();
      d1:	e8 2a 27 00 00       	call   2800 <rmdot>
  fourteen();
      d6:	e8 e5 25 00 00       	call   26c0 <fourteen>
  bigfile();
      db:	e8 00 24 00 00       	call   24e0 <bigfile>
  subdir();
      e0:	e8 2b 1c 00 00       	call   1d10 <subdir>
  linktest();
      e5:	e8 c6 14 00 00       	call   15b0 <linktest>
  unlinkread();
      ea:	e8 31 13 00 00       	call   1420 <unlinkread>
  dirfile();
      ef:	e8 8c 28 00 00       	call   2980 <dirfile>
  iref();
      f4:	e8 87 2a 00 00       	call   2b80 <iref>
  forktest();
      f9:	e8 a2 2b 00 00       	call   2ca0 <forktest>
  bigdir(); // slow
      fe:	e8 dd 1a 00 00       	call   1be0 <bigdir>

  uio();
     103:	e8 b8 34 00 00       	call   35c0 <uio>

  exectest();
     108:	e8 b3 08 00 00       	call   9c0 <exectest>

  exit();
     10d:	e8 05 38 00 00       	call   3917 <exit>
     112:	66 90                	xchg   %ax,%ax
     114:	66 90                	xchg   %ax,%ax
     116:	66 90                	xchg   %ax,%ax
     118:	66 90                	xchg   %ax,%ax
     11a:	66 90                	xchg   %ax,%ax
     11c:	66 90                	xchg   %ax,%ax
     11e:	66 90                	xchg   %ax,%ax

00000120 <iputtest>:
{
     120:	55                   	push   %ebp
     121:	89 e5                	mov    %esp,%ebp
     123:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
     126:	68 bc 3e 00 00       	push   $0x3ebc
     12b:	ff 35 5c 5f 00 00    	push   0x5f5c
     131:	e8 4a 39 00 00       	call   3a80 <printf>
  if(mkdir("iputdir") < 0){
     136:	c7 04 24 4f 3e 00 00 	movl   $0x3e4f,(%esp)
     13d:	e8 3d 38 00 00       	call   397f <mkdir>
     142:	83 c4 10             	add    $0x10,%esp
     145:	85 c0                	test   %eax,%eax
     147:	78 5a                	js     1a3 <iputtest+0x83>
  if(chdir("iputdir") < 0){
     149:	83 ec 0c             	sub    $0xc,%esp
     14c:	68 4f 3e 00 00       	push   $0x3e4f
     151:	e8 31 38 00 00       	call   3987 <chdir>
     156:	83 c4 10             	add    $0x10,%esp
     159:	85 c0                	test   %eax,%eax
     15b:	0f 88 82 00 00 00    	js     1e3 <iputtest+0xc3>
  if(unlink("../iputdir") < 0){
     161:	83 ec 0c             	sub    $0xc,%esp
     164:	68 4c 3e 00 00       	push   $0x3e4c
     169:	e8 f9 37 00 00       	call   3967 <unlink>
     16e:	83 c4 10             	add    $0x10,%esp
     171:	85 c0                	test   %eax,%eax
     173:	78 57                	js     1cc <iputtest+0xac>
  if(chdir("/") < 0){
     175:	83 ec 0c             	sub    $0xc,%esp
     178:	68 71 3e 00 00       	push   $0x3e71
     17d:	e8 05 38 00 00       	call   3987 <chdir>
     182:	83 c4 10             	add    $0x10,%esp
     185:	89 c2                	mov    %eax,%edx
    printf(stdout, "chdir / failed\n");
     187:	a1 5c 5f 00 00       	mov    0x5f5c,%eax
  if(chdir("/") < 0){
     18c:	85 d2                	test   %edx,%edx
     18e:	78 2a                	js     1ba <iputtest+0x9a>
  printf(stdout, "iput test ok\n");
     190:	83 ec 08             	sub    $0x8,%esp
     193:	68 f4 3e 00 00       	push   $0x3ef4
     198:	50                   	push   %eax
     199:	e8 e2 38 00 00       	call   3a80 <printf>
}
     19e:	83 c4 10             	add    $0x10,%esp
     1a1:	c9                   	leave
     1a2:	c3                   	ret
    printf(stdout, "mkdir failed\n");
     1a3:	50                   	push   %eax
     1a4:	50                   	push   %eax
     1a5:	68 28 3e 00 00       	push   $0x3e28
     1aa:	ff 35 5c 5f 00 00    	push   0x5f5c
     1b0:	e8 cb 38 00 00       	call   3a80 <printf>
    exit();
     1b5:	e8 5d 37 00 00       	call   3917 <exit>
    printf(stdout, "chdir / failed\n");
     1ba:	52                   	push   %edx
     1bb:	52                   	push   %edx
     1bc:	68 73 3e 00 00       	push   $0x3e73
     1c1:	50                   	push   %eax
     1c2:	e8 b9 38 00 00       	call   3a80 <printf>
    exit();
     1c7:	e8 4b 37 00 00       	call   3917 <exit>
    printf(stdout, "unlink ../iputdir failed\n");
     1cc:	51                   	push   %ecx
     1cd:	51                   	push   %ecx
     1ce:	68 57 3e 00 00       	push   $0x3e57
     1d3:	ff 35 5c 5f 00 00    	push   0x5f5c
     1d9:	e8 a2 38 00 00       	call   3a80 <printf>
    exit();
     1de:	e8 34 37 00 00       	call   3917 <exit>
    printf(stdout, "chdir iputdir failed\n");
     1e3:	50                   	push   %eax
     1e4:	50                   	push   %eax
     1e5:	68 36 3e 00 00       	push   $0x3e36
     1ea:	ff 35 5c 5f 00 00    	push   0x5f5c
     1f0:	e8 8b 38 00 00       	call   3a80 <printf>
    exit();
     1f5:	e8 1d 37 00 00       	call   3917 <exit>
     1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000200 <exitiputtest>:
{
     200:	55                   	push   %ebp
     201:	89 e5                	mov    %esp,%ebp
     203:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exitiput test\n");
     206:	68 83 3e 00 00       	push   $0x3e83
     20b:	ff 35 5c 5f 00 00    	push   0x5f5c
     211:	e8 6a 38 00 00       	call   3a80 <printf>
  pid = fork();
     216:	e8 f4 36 00 00       	call   390f <fork>
  if(pid < 0){
     21b:	83 c4 10             	add    $0x10,%esp
     21e:	85 c0                	test   %eax,%eax
     220:	0f 88 8a 00 00 00    	js     2b0 <exitiputtest+0xb0>
  if(pid == 0){
     226:	75 50                	jne    278 <exitiputtest+0x78>
    if(mkdir("iputdir") < 0){
     228:	83 ec 0c             	sub    $0xc,%esp
     22b:	68 4f 3e 00 00       	push   $0x3e4f
     230:	e8 4a 37 00 00       	call   397f <mkdir>
     235:	83 c4 10             	add    $0x10,%esp
     238:	85 c0                	test   %eax,%eax
     23a:	0f 88 87 00 00 00    	js     2c7 <exitiputtest+0xc7>
    if(chdir("iputdir") < 0){
     240:	83 ec 0c             	sub    $0xc,%esp
     243:	68 4f 3e 00 00       	push   $0x3e4f
     248:	e8 3a 37 00 00       	call   3987 <chdir>
     24d:	83 c4 10             	add    $0x10,%esp
     250:	85 c0                	test   %eax,%eax
     252:	0f 88 86 00 00 00    	js     2de <exitiputtest+0xde>
    if(unlink("../iputdir") < 0){
     258:	83 ec 0c             	sub    $0xc,%esp
     25b:	68 4c 3e 00 00       	push   $0x3e4c
     260:	e8 02 37 00 00       	call   3967 <unlink>
     265:	83 c4 10             	add    $0x10,%esp
     268:	85 c0                	test   %eax,%eax
     26a:	78 2c                	js     298 <exitiputtest+0x98>
    exit();
     26c:	e8 a6 36 00 00       	call   3917 <exit>
     271:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  wait();
     278:	e8 a2 36 00 00       	call   391f <wait>
  printf(stdout, "exitiput test ok\n");
     27d:	83 ec 08             	sub    $0x8,%esp
     280:	68 a6 3e 00 00       	push   $0x3ea6
     285:	ff 35 5c 5f 00 00    	push   0x5f5c
     28b:	e8 f0 37 00 00       	call   3a80 <printf>
}
     290:	83 c4 10             	add    $0x10,%esp
     293:	c9                   	leave
     294:	c3                   	ret
     295:	8d 76 00             	lea    0x0(%esi),%esi
      printf(stdout, "unlink ../iputdir failed\n");
     298:	83 ec 08             	sub    $0x8,%esp
     29b:	68 57 3e 00 00       	push   $0x3e57
     2a0:	ff 35 5c 5f 00 00    	push   0x5f5c
     2a6:	e8 d5 37 00 00       	call   3a80 <printf>
      exit();
     2ab:	e8 67 36 00 00       	call   3917 <exit>
    printf(stdout, "fork failed\n");
     2b0:	51                   	push   %ecx
     2b1:	51                   	push   %ecx
     2b2:	68 69 4d 00 00       	push   $0x4d69
     2b7:	ff 35 5c 5f 00 00    	push   0x5f5c
     2bd:	e8 be 37 00 00       	call   3a80 <printf>
    exit();
     2c2:	e8 50 36 00 00       	call   3917 <exit>
      printf(stdout, "mkdir failed\n");
     2c7:	52                   	push   %edx
     2c8:	52                   	push   %edx
     2c9:	68 28 3e 00 00       	push   $0x3e28
     2ce:	ff 35 5c 5f 00 00    	push   0x5f5c
     2d4:	e8 a7 37 00 00       	call   3a80 <printf>
      exit();
     2d9:	e8 39 36 00 00       	call   3917 <exit>
      printf(stdout, "child chdir failed\n");
     2de:	50                   	push   %eax
     2df:	50                   	push   %eax
     2e0:	68 92 3e 00 00       	push   $0x3e92
     2e5:	ff 35 5c 5f 00 00    	push   0x5f5c
     2eb:	e8 90 37 00 00       	call   3a80 <printf>
      exit();
     2f0:	e8 22 36 00 00       	call   3917 <exit>
     2f5:	8d 76 00             	lea    0x0(%esi),%esi
     2f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     2ff:	00 

00000300 <openiputtest>:
{
     300:	55                   	push   %ebp
     301:	89 e5                	mov    %esp,%ebp
     303:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "openiput test\n");
     306:	68 b8 3e 00 00       	push   $0x3eb8
     30b:	ff 35 5c 5f 00 00    	push   0x5f5c
     311:	e8 6a 37 00 00       	call   3a80 <printf>
  if(mkdir("oidir") < 0){
     316:	c7 04 24 c7 3e 00 00 	movl   $0x3ec7,(%esp)
     31d:	e8 5d 36 00 00       	call   397f <mkdir>
     322:	83 c4 10             	add    $0x10,%esp
     325:	85 c0                	test   %eax,%eax
     327:	0f 88 9f 00 00 00    	js     3cc <openiputtest+0xcc>
  pid = fork();
     32d:	e8 dd 35 00 00       	call   390f <fork>
  if(pid < 0){
     332:	85 c0                	test   %eax,%eax
     334:	78 7f                	js     3b5 <openiputtest+0xb5>
  if(pid == 0){
     336:	75 38                	jne    370 <openiputtest+0x70>
    int fd = open("oidir", O_RDWR);
     338:	83 ec 08             	sub    $0x8,%esp
     33b:	6a 02                	push   $0x2
     33d:	68 c7 3e 00 00       	push   $0x3ec7
     342:	e8 10 36 00 00       	call   3957 <open>
    if(fd >= 0){
     347:	83 c4 10             	add    $0x10,%esp
     34a:	85 c0                	test   %eax,%eax
     34c:	78 62                	js     3b0 <openiputtest+0xb0>
      printf(stdout, "open directory for write succeeded\n");
     34e:	83 ec 08             	sub    $0x8,%esp
     351:	68 50 4e 00 00       	push   $0x4e50
     356:	ff 35 5c 5f 00 00    	push   0x5f5c
     35c:	e8 1f 37 00 00       	call   3a80 <printf>
      exit();
     361:	e8 b1 35 00 00       	call   3917 <exit>
     366:	66 90                	xchg   %ax,%ax
     368:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     36f:	00 
  sleep(1);
     370:	83 ec 0c             	sub    $0xc,%esp
     373:	6a 01                	push   $0x1
     375:	e8 2d 36 00 00       	call   39a7 <sleep>
  if(unlink("oidir") != 0){
     37a:	c7 04 24 c7 3e 00 00 	movl   $0x3ec7,(%esp)
     381:	e8 e1 35 00 00       	call   3967 <unlink>
     386:	83 c4 10             	add    $0x10,%esp
     389:	85 c0                	test   %eax,%eax
     38b:	75 56                	jne    3e3 <openiputtest+0xe3>
  wait();
     38d:	e8 8d 35 00 00       	call   391f <wait>
  printf(stdout, "openiput test ok\n");
     392:	83 ec 08             	sub    $0x8,%esp
     395:	68 f0 3e 00 00       	push   $0x3ef0
     39a:	ff 35 5c 5f 00 00    	push   0x5f5c
     3a0:	e8 db 36 00 00       	call   3a80 <printf>
}
     3a5:	83 c4 10             	add    $0x10,%esp
     3a8:	c9                   	leave
     3a9:	c3                   	ret
     3aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    exit();
     3b0:	e8 62 35 00 00       	call   3917 <exit>
    printf(stdout, "fork failed\n");
     3b5:	52                   	push   %edx
     3b6:	52                   	push   %edx
     3b7:	68 69 4d 00 00       	push   $0x4d69
     3bc:	ff 35 5c 5f 00 00    	push   0x5f5c
     3c2:	e8 b9 36 00 00       	call   3a80 <printf>
    exit();
     3c7:	e8 4b 35 00 00       	call   3917 <exit>
    printf(stdout, "mkdir oidir failed\n");
     3cc:	51                   	push   %ecx
     3cd:	51                   	push   %ecx
     3ce:	68 cd 3e 00 00       	push   $0x3ecd
     3d3:	ff 35 5c 5f 00 00    	push   0x5f5c
     3d9:	e8 a2 36 00 00       	call   3a80 <printf>
    exit();
     3de:	e8 34 35 00 00       	call   3917 <exit>
    printf(stdout, "unlink failed\n");
     3e3:	50                   	push   %eax
     3e4:	50                   	push   %eax
     3e5:	68 e1 3e 00 00       	push   $0x3ee1
     3ea:	ff 35 5c 5f 00 00    	push   0x5f5c
     3f0:	e8 8b 36 00 00       	call   3a80 <printf>
    exit();
     3f5:	e8 1d 35 00 00       	call   3917 <exit>
     3fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000400 <opentest>:
{
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "open test\n");
     406:	68 02 3f 00 00       	push   $0x3f02
     40b:	ff 35 5c 5f 00 00    	push   0x5f5c
     411:	e8 6a 36 00 00       	call   3a80 <printf>
  fd = open("echo", 0);
     416:	58                   	pop    %eax
     417:	5a                   	pop    %edx
     418:	6a 00                	push   $0x0
     41a:	68 0d 3f 00 00       	push   $0x3f0d
     41f:	e8 33 35 00 00       	call   3957 <open>
  if(fd < 0){
     424:	83 c4 10             	add    $0x10,%esp
     427:	85 c0                	test   %eax,%eax
     429:	78 38                	js     463 <opentest+0x63>
  close(fd);
     42b:	83 ec 0c             	sub    $0xc,%esp
     42e:	50                   	push   %eax
     42f:	e8 0b 35 00 00       	call   393f <close>
  fd = open("doesnotexist", 0);
     434:	59                   	pop    %ecx
     435:	58                   	pop    %eax
     436:	6a 00                	push   $0x0
     438:	68 25 3f 00 00       	push   $0x3f25
     43d:	e8 15 35 00 00       	call   3957 <open>
  if(fd >= 0){
     442:	83 c4 10             	add    $0x10,%esp
  fd = open("doesnotexist", 0);
     445:	89 c2                	mov    %eax,%edx
    printf(stdout, "open doesnotexist succeeded!\n");
     447:	a1 5c 5f 00 00       	mov    0x5f5c,%eax
  if(fd >= 0){
     44c:	85 d2                	test   %edx,%edx
     44e:	79 2a                	jns    47a <opentest+0x7a>
  printf(stdout, "open test ok\n");
     450:	83 ec 08             	sub    $0x8,%esp
     453:	68 50 3f 00 00       	push   $0x3f50
     458:	50                   	push   %eax
     459:	e8 22 36 00 00       	call   3a80 <printf>
}
     45e:	83 c4 10             	add    $0x10,%esp
     461:	c9                   	leave
     462:	c3                   	ret
    printf(stdout, "open echo failed!\n");
     463:	50                   	push   %eax
     464:	50                   	push   %eax
     465:	68 12 3f 00 00       	push   $0x3f12
     46a:	ff 35 5c 5f 00 00    	push   0x5f5c
     470:	e8 0b 36 00 00       	call   3a80 <printf>
    exit();
     475:	e8 9d 34 00 00       	call   3917 <exit>
    printf(stdout, "open doesnotexist succeeded!\n");
     47a:	52                   	push   %edx
     47b:	52                   	push   %edx
     47c:	68 32 3f 00 00       	push   $0x3f32
     481:	50                   	push   %eax
     482:	e8 f9 35 00 00       	call   3a80 <printf>
    exit();
     487:	e8 8b 34 00 00       	call   3917 <exit>
     48c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000490 <writetest>:
{
     490:	55                   	push   %ebp
     491:	89 e5                	mov    %esp,%ebp
     493:	56                   	push   %esi
     494:	53                   	push   %ebx
  printf(stdout, "small file test\n");
     495:	83 ec 08             	sub    $0x8,%esp
     498:	68 5e 3f 00 00       	push   $0x3f5e
     49d:	ff 35 5c 5f 00 00    	push   0x5f5c
     4a3:	e8 d8 35 00 00       	call   3a80 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     4a8:	59                   	pop    %ecx
     4a9:	5b                   	pop    %ebx
     4aa:	68 02 02 00 00       	push   $0x202
     4af:	68 6f 3f 00 00       	push   $0x3f6f
     4b4:	e8 9e 34 00 00       	call   3957 <open>
  if(fd >= 0){
     4b9:	83 c4 10             	add    $0x10,%esp
  fd = open("small", O_CREATE|O_RDWR);
     4bc:	89 c6                	mov    %eax,%esi
    printf(stdout, "creat small succeeded; ok\n");
     4be:	a1 5c 5f 00 00       	mov    0x5f5c,%eax
  if(fd >= 0){
     4c3:	85 f6                	test   %esi,%esi
     4c5:	0f 88 77 01 00 00    	js     642 <writetest+0x1b2>
    printf(stdout, "creat small succeeded; ok\n");
     4cb:	83 ec 08             	sub    $0x8,%esp
  for(i = 0; i < 100; i++){
     4ce:	31 db                	xor    %ebx,%ebx
    printf(stdout, "creat small succeeded; ok\n");
     4d0:	68 75 3f 00 00       	push   $0x3f75
     4d5:	50                   	push   %eax
     4d6:	e8 a5 35 00 00       	call   3a80 <printf>
     4db:	83 c4 10             	add    $0x10,%esp
     4de:	66 90                	xchg   %ax,%ax
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     4e0:	83 ec 04             	sub    $0x4,%esp
     4e3:	6a 0a                	push   $0xa
     4e5:	68 ac 3f 00 00       	push   $0x3fac
     4ea:	56                   	push   %esi
     4eb:	e8 47 34 00 00       	call   3937 <write>
     4f0:	83 c4 10             	add    $0x10,%esp
     4f3:	83 f8 0a             	cmp    $0xa,%eax
     4f6:	0f 85 de 00 00 00    	jne    5da <writetest+0x14a>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     4fc:	83 ec 04             	sub    $0x4,%esp
     4ff:	6a 0a                	push   $0xa
     501:	68 b7 3f 00 00       	push   $0x3fb7
     506:	56                   	push   %esi
     507:	e8 2b 34 00 00       	call   3937 <write>
     50c:	83 c4 10             	add    $0x10,%esp
     50f:	83 f8 0a             	cmp    $0xa,%eax
     512:	0f 85 db 00 00 00    	jne    5f3 <writetest+0x163>
  for(i = 0; i < 100; i++){
     518:	83 c3 01             	add    $0x1,%ebx
     51b:	83 fb 64             	cmp    $0x64,%ebx
     51e:	75 c0                	jne    4e0 <writetest+0x50>
  printf(stdout, "writes ok\n");
     520:	83 ec 08             	sub    $0x8,%esp
     523:	68 c2 3f 00 00       	push   $0x3fc2
     528:	ff 35 5c 5f 00 00    	push   0x5f5c
     52e:	e8 4d 35 00 00       	call   3a80 <printf>
  close(fd);
     533:	89 34 24             	mov    %esi,(%esp)
     536:	e8 04 34 00 00       	call   393f <close>
  fd = open("small", O_RDONLY);
     53b:	5e                   	pop    %esi
     53c:	58                   	pop    %eax
     53d:	6a 00                	push   $0x0
     53f:	68 6f 3f 00 00       	push   $0x3f6f
     544:	e8 0e 34 00 00       	call   3957 <open>
  if(fd >= 0){
     549:	83 c4 10             	add    $0x10,%esp
  fd = open("small", O_RDONLY);
     54c:	89 c3                	mov    %eax,%ebx
    printf(stdout, "open small succeeded ok\n");
     54e:	a1 5c 5f 00 00       	mov    0x5f5c,%eax
  if(fd >= 0){
     553:	85 db                	test   %ebx,%ebx
     555:	0f 88 b1 00 00 00    	js     60c <writetest+0x17c>
    printf(stdout, "open small succeeded ok\n");
     55b:	83 ec 08             	sub    $0x8,%esp
     55e:	68 cd 3f 00 00       	push   $0x3fcd
     563:	50                   	push   %eax
     564:	e8 17 35 00 00       	call   3a80 <printf>
  i = read(fd, buf, 2000);
     569:	83 c4 0c             	add    $0xc,%esp
     56c:	68 d0 07 00 00       	push   $0x7d0
     571:	68 a0 86 00 00       	push   $0x86a0
     576:	53                   	push   %ebx
     577:	e8 b3 33 00 00       	call   392f <read>
  if(i == 2000){
     57c:	83 c4 10             	add    $0x10,%esp
  i = read(fd, buf, 2000);
     57f:	89 c2                	mov    %eax,%edx
    printf(stdout, "read succeeded ok\n");
     581:	a1 5c 5f 00 00       	mov    0x5f5c,%eax
  if(i == 2000){
     586:	81 fa d0 07 00 00    	cmp    $0x7d0,%edx
     58c:	0f 85 8c 00 00 00    	jne    61e <writetest+0x18e>
    printf(stdout, "read succeeded ok\n");
     592:	83 ec 08             	sub    $0x8,%esp
     595:	68 01 40 00 00       	push   $0x4001
     59a:	50                   	push   %eax
     59b:	e8 e0 34 00 00       	call   3a80 <printf>
  close(fd);
     5a0:	89 1c 24             	mov    %ebx,(%esp)
     5a3:	e8 97 33 00 00       	call   393f <close>
  if(unlink("small") < 0){
     5a8:	c7 04 24 6f 3f 00 00 	movl   $0x3f6f,(%esp)
     5af:	e8 b3 33 00 00       	call   3967 <unlink>
     5b4:	83 c4 10             	add    $0x10,%esp
     5b7:	89 c2                	mov    %eax,%edx
    printf(stdout, "unlink small failed\n");
     5b9:	a1 5c 5f 00 00       	mov    0x5f5c,%eax
  if(unlink("small") < 0){
     5be:	85 d2                	test   %edx,%edx
     5c0:	78 6e                	js     630 <writetest+0x1a0>
  printf(stdout, "small file test ok\n");
     5c2:	83 ec 08             	sub    $0x8,%esp
     5c5:	68 29 40 00 00       	push   $0x4029
     5ca:	50                   	push   %eax
     5cb:	e8 b0 34 00 00       	call   3a80 <printf>
}
     5d0:	83 c4 10             	add    $0x10,%esp
     5d3:	8d 65 f8             	lea    -0x8(%ebp),%esp
     5d6:	5b                   	pop    %ebx
     5d7:	5e                   	pop    %esi
     5d8:	5d                   	pop    %ebp
     5d9:	c3                   	ret
      printf(stdout, "error: write aa %d new file failed\n", i);
     5da:	83 ec 04             	sub    $0x4,%esp
     5dd:	53                   	push   %ebx
     5de:	68 74 4e 00 00       	push   $0x4e74
     5e3:	ff 35 5c 5f 00 00    	push   0x5f5c
     5e9:	e8 92 34 00 00       	call   3a80 <printf>
      exit();
     5ee:	e8 24 33 00 00       	call   3917 <exit>
      printf(stdout, "error: write bb %d new file failed\n", i);
     5f3:	83 ec 04             	sub    $0x4,%esp
     5f6:	53                   	push   %ebx
     5f7:	68 98 4e 00 00       	push   $0x4e98
     5fc:	ff 35 5c 5f 00 00    	push   0x5f5c
     602:	e8 79 34 00 00       	call   3a80 <printf>
      exit();
     607:	e8 0b 33 00 00       	call   3917 <exit>
    printf(stdout, "error: open small failed!\n");
     60c:	53                   	push   %ebx
     60d:	53                   	push   %ebx
     60e:	68 e6 3f 00 00       	push   $0x3fe6
     613:	50                   	push   %eax
     614:	e8 67 34 00 00       	call   3a80 <printf>
    exit();
     619:	e8 f9 32 00 00       	call   3917 <exit>
    printf(stdout, "read failed\n");
     61e:	51                   	push   %ecx
     61f:	51                   	push   %ecx
     620:	68 2d 43 00 00       	push   $0x432d
     625:	50                   	push   %eax
     626:	e8 55 34 00 00       	call   3a80 <printf>
    exit();
     62b:	e8 e7 32 00 00       	call   3917 <exit>
    printf(stdout, "unlink small failed\n");
     630:	52                   	push   %edx
     631:	52                   	push   %edx
     632:	68 14 40 00 00       	push   $0x4014
     637:	50                   	push   %eax
     638:	e8 43 34 00 00       	call   3a80 <printf>
    exit();
     63d:	e8 d5 32 00 00       	call   3917 <exit>
    printf(stdout, "error: creat small failed!\n");
     642:	52                   	push   %edx
     643:	52                   	push   %edx
     644:	68 90 3f 00 00       	push   $0x3f90
     649:	50                   	push   %eax
     64a:	e8 31 34 00 00       	call   3a80 <printf>
    exit();
     64f:	e8 c3 32 00 00       	call   3917 <exit>
     654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     658:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     65f:	00 

00000660 <writetest1>:
{
     660:	55                   	push   %ebp
     661:	89 e5                	mov    %esp,%ebp
     663:	56                   	push   %esi
     664:	53                   	push   %ebx
  printf(stdout, "big files test\n");
     665:	83 ec 08             	sub    $0x8,%esp
     668:	68 3d 40 00 00       	push   $0x403d
     66d:	ff 35 5c 5f 00 00    	push   0x5f5c
     673:	e8 08 34 00 00       	call   3a80 <printf>
  fd = open("big", O_CREATE|O_RDWR);
     678:	58                   	pop    %eax
     679:	5a                   	pop    %edx
     67a:	68 02 02 00 00       	push   $0x202
     67f:	68 b7 40 00 00       	push   $0x40b7
     684:	e8 ce 32 00 00       	call   3957 <open>
  if(fd < 0){
     689:	83 c4 10             	add    $0x10,%esp
     68c:	85 c0                	test   %eax,%eax
     68e:	0f 88 67 01 00 00    	js     7fb <writetest1+0x19b>
     694:	89 c6                	mov    %eax,%esi
  for(i = 0; i < MAXFILE; i++){
     696:	31 db                	xor    %ebx,%ebx
     698:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     69f:	00 
    if(write(fd, buf, 512) != 512){
     6a0:	83 ec 04             	sub    $0x4,%esp
    ((int*)buf)[0] = i;
     6a3:	89 1d a0 86 00 00    	mov    %ebx,0x86a0
    if(write(fd, buf, 512) != 512){
     6a9:	68 00 02 00 00       	push   $0x200
     6ae:	68 a0 86 00 00       	push   $0x86a0
     6b3:	56                   	push   %esi
     6b4:	e8 7e 32 00 00       	call   3937 <write>
     6b9:	83 c4 10             	add    $0x10,%esp
     6bc:	3d 00 02 00 00       	cmp    $0x200,%eax
     6c1:	0f 85 b9 00 00 00    	jne    780 <writetest1+0x120>
  for(i = 0; i < MAXFILE; i++){
     6c7:	83 c3 01             	add    $0x1,%ebx
     6ca:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     6d0:	75 ce                	jne    6a0 <writetest1+0x40>
  close(fd);
     6d2:	83 ec 0c             	sub    $0xc,%esp
     6d5:	56                   	push   %esi
     6d6:	e8 64 32 00 00       	call   393f <close>
  fd = open("big", O_RDONLY);
     6db:	5e                   	pop    %esi
     6dc:	58                   	pop    %eax
     6dd:	6a 00                	push   $0x0
     6df:	68 b7 40 00 00       	push   $0x40b7
     6e4:	e8 6e 32 00 00       	call   3957 <open>
  if(fd < 0){
     6e9:	83 c4 10             	add    $0x10,%esp
  fd = open("big", O_RDONLY);
     6ec:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
     6ee:	85 c0                	test   %eax,%eax
     6f0:	0f 88 ee 00 00 00    	js     7e4 <writetest1+0x184>
  n = 0;
     6f6:	31 f6                	xor    %esi,%esi
     6f8:	eb 21                	jmp    71b <writetest1+0xbb>
     6fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(i != 512){
     700:	3d 00 02 00 00       	cmp    $0x200,%eax
     705:	0f 85 a5 00 00 00    	jne    7b0 <writetest1+0x150>
    if(((int*)buf)[0] != n){
     70b:	a1 a0 86 00 00       	mov    0x86a0,%eax
     710:	39 f0                	cmp    %esi,%eax
     712:	0f 85 81 00 00 00    	jne    799 <writetest1+0x139>
    n++;
     718:	83 c6 01             	add    $0x1,%esi
    i = read(fd, buf, 512);
     71b:	83 ec 04             	sub    $0x4,%esp
     71e:	68 00 02 00 00       	push   $0x200
     723:	68 a0 86 00 00       	push   $0x86a0
     728:	53                   	push   %ebx
     729:	e8 01 32 00 00       	call   392f <read>
    if(i == 0){
     72e:	83 c4 10             	add    $0x10,%esp
     731:	85 c0                	test   %eax,%eax
     733:	75 cb                	jne    700 <writetest1+0xa0>
      if(n == MAXFILE - 1){
     735:	81 fe 8b 00 00 00    	cmp    $0x8b,%esi
     73b:	0f 84 88 00 00 00    	je     7c9 <writetest1+0x169>
  close(fd);
     741:	83 ec 0c             	sub    $0xc,%esp
     744:	53                   	push   %ebx
     745:	e8 f5 31 00 00       	call   393f <close>
  if(unlink("big") < 0){
     74a:	c7 04 24 b7 40 00 00 	movl   $0x40b7,(%esp)
     751:	e8 11 32 00 00       	call   3967 <unlink>
     756:	83 c4 10             	add    $0x10,%esp
     759:	89 c2                	mov    %eax,%edx
    printf(stdout, "unlink big failed\n");
     75b:	a1 5c 5f 00 00       	mov    0x5f5c,%eax
  if(unlink("big") < 0){
     760:	85 d2                	test   %edx,%edx
     762:	0f 88 aa 00 00 00    	js     812 <writetest1+0x1b2>
  printf(stdout, "big files ok\n");
     768:	83 ec 08             	sub    $0x8,%esp
     76b:	68 de 40 00 00       	push   $0x40de
     770:	50                   	push   %eax
     771:	e8 0a 33 00 00       	call   3a80 <printf>
}
     776:	83 c4 10             	add    $0x10,%esp
     779:	8d 65 f8             	lea    -0x8(%ebp),%esp
     77c:	5b                   	pop    %ebx
     77d:	5e                   	pop    %esi
     77e:	5d                   	pop    %ebp
     77f:	c3                   	ret
      printf(stdout, "error: write big file failed\n", i);
     780:	83 ec 04             	sub    $0x4,%esp
     783:	53                   	push   %ebx
     784:	68 67 40 00 00       	push   $0x4067
     789:	ff 35 5c 5f 00 00    	push   0x5f5c
     78f:	e8 ec 32 00 00       	call   3a80 <printf>
      exit();
     794:	e8 7e 31 00 00       	call   3917 <exit>
      printf(stdout, "read content of block %d is %d\n",
     799:	50                   	push   %eax
     79a:	56                   	push   %esi
     79b:	68 bc 4e 00 00       	push   $0x4ebc
     7a0:	ff 35 5c 5f 00 00    	push   0x5f5c
     7a6:	e8 d5 32 00 00       	call   3a80 <printf>
      exit();
     7ab:	e8 67 31 00 00       	call   3917 <exit>
      printf(stdout, "read failed %d\n", i);
     7b0:	83 ec 04             	sub    $0x4,%esp
     7b3:	50                   	push   %eax
     7b4:	68 bb 40 00 00       	push   $0x40bb
     7b9:	ff 35 5c 5f 00 00    	push   0x5f5c
     7bf:	e8 bc 32 00 00       	call   3a80 <printf>
      exit();
     7c4:	e8 4e 31 00 00       	call   3917 <exit>
        printf(stdout, "read only %d blocks from big", n);
     7c9:	51                   	push   %ecx
     7ca:	68 8b 00 00 00       	push   $0x8b
     7cf:	68 9e 40 00 00       	push   $0x409e
     7d4:	ff 35 5c 5f 00 00    	push   0x5f5c
     7da:	e8 a1 32 00 00       	call   3a80 <printf>
        exit();
     7df:	e8 33 31 00 00       	call   3917 <exit>
    printf(stdout, "error: open big failed!\n");
     7e4:	53                   	push   %ebx
     7e5:	53                   	push   %ebx
     7e6:	68 85 40 00 00       	push   $0x4085
     7eb:	ff 35 5c 5f 00 00    	push   0x5f5c
     7f1:	e8 8a 32 00 00       	call   3a80 <printf>
    exit();
     7f6:	e8 1c 31 00 00       	call   3917 <exit>
    printf(stdout, "error: creat big failed!\n");
     7fb:	50                   	push   %eax
     7fc:	50                   	push   %eax
     7fd:	68 4d 40 00 00       	push   $0x404d
     802:	ff 35 5c 5f 00 00    	push   0x5f5c
     808:	e8 73 32 00 00       	call   3a80 <printf>
    exit();
     80d:	e8 05 31 00 00       	call   3917 <exit>
    printf(stdout, "unlink big failed\n");
     812:	52                   	push   %edx
     813:	52                   	push   %edx
     814:	68 cb 40 00 00       	push   $0x40cb
     819:	50                   	push   %eax
     81a:	e8 61 32 00 00       	call   3a80 <printf>
    exit();
     81f:	e8 f3 30 00 00       	call   3917 <exit>
     824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     828:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     82f:	00 

00000830 <createtest>:
{
     830:	55                   	push   %ebp
     831:	89 e5                	mov    %esp,%ebp
     833:	53                   	push   %ebx
  name[2] = '\0';
     834:	bb 30 00 00 00       	mov    $0x30,%ebx
{
     839:	83 ec 0c             	sub    $0xc,%esp
  printf(stdout, "many creates, followed by unlink test\n");
     83c:	68 dc 4e 00 00       	push   $0x4edc
     841:	ff 35 5c 5f 00 00    	push   0x5f5c
     847:	e8 34 32 00 00       	call   3a80 <printf>
  name[0] = 'a';
     84c:	c6 05 90 86 00 00 61 	movb   $0x61,0x8690
  name[2] = '\0';
     853:	83 c4 10             	add    $0x10,%esp
     856:	c6 05 92 86 00 00 00 	movb   $0x0,0x8692
  for(i = 0; i < 52; i++){
     85d:	8d 76 00             	lea    0x0(%esi),%esi
    fd = open(name, O_CREATE|O_RDWR);
     860:	83 ec 08             	sub    $0x8,%esp
    name[1] = '0' + i;
     863:	88 1d 91 86 00 00    	mov    %bl,0x8691
  for(i = 0; i < 52; i++){
     869:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
     86c:	68 02 02 00 00       	push   $0x202
     871:	68 90 86 00 00       	push   $0x8690
     876:	e8 dc 30 00 00       	call   3957 <open>
    close(fd);
     87b:	89 04 24             	mov    %eax,(%esp)
     87e:	e8 bc 30 00 00       	call   393f <close>
  for(i = 0; i < 52; i++){
     883:	83 c4 10             	add    $0x10,%esp
     886:	80 fb 64             	cmp    $0x64,%bl
     889:	75 d5                	jne    860 <createtest+0x30>
  name[0] = 'a';
     88b:	c6 05 90 86 00 00 61 	movb   $0x61,0x8690
  name[2] = '\0';
     892:	bb 30 00 00 00       	mov    $0x30,%ebx
     897:	c6 05 92 86 00 00 00 	movb   $0x0,0x8692
  for(i = 0; i < 52; i++){
     89e:	66 90                	xchg   %ax,%ax
    unlink(name);
     8a0:	83 ec 0c             	sub    $0xc,%esp
    name[1] = '0' + i;
     8a3:	88 1d 91 86 00 00    	mov    %bl,0x8691
  for(i = 0; i < 52; i++){
     8a9:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
     8ac:	68 90 86 00 00       	push   $0x8690
     8b1:	e8 b1 30 00 00       	call   3967 <unlink>
  for(i = 0; i < 52; i++){
     8b6:	83 c4 10             	add    $0x10,%esp
     8b9:	80 fb 64             	cmp    $0x64,%bl
     8bc:	75 e2                	jne    8a0 <createtest+0x70>
  printf(stdout, "many creates, followed by unlink; ok\n");
     8be:	83 ec 08             	sub    $0x8,%esp
     8c1:	68 08 4f 00 00       	push   $0x4f08
     8c6:	ff 35 5c 5f 00 00    	push   0x5f5c
     8cc:	e8 af 31 00 00       	call   3a80 <printf>
}
     8d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     8d4:	83 c4 10             	add    $0x10,%esp
     8d7:	c9                   	leave
     8d8:	c3                   	ret
     8d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008e0 <dirtest>:
{
     8e0:	55                   	push   %ebp
     8e1:	89 e5                	mov    %esp,%ebp
     8e3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     8e6:	68 ec 40 00 00       	push   $0x40ec
     8eb:	ff 35 5c 5f 00 00    	push   0x5f5c
     8f1:	e8 8a 31 00 00       	call   3a80 <printf>
  if(mkdir("dir0") < 0){
     8f6:	c7 04 24 f8 40 00 00 	movl   $0x40f8,(%esp)
     8fd:	e8 7d 30 00 00       	call   397f <mkdir>
     902:	83 c4 10             	add    $0x10,%esp
     905:	85 c0                	test   %eax,%eax
     907:	78 5a                	js     963 <dirtest+0x83>
  if(chdir("dir0") < 0){
     909:	83 ec 0c             	sub    $0xc,%esp
     90c:	68 f8 40 00 00       	push   $0x40f8
     911:	e8 71 30 00 00       	call   3987 <chdir>
     916:	83 c4 10             	add    $0x10,%esp
     919:	85 c0                	test   %eax,%eax
     91b:	0f 88 82 00 00 00    	js     9a3 <dirtest+0xc3>
  if(chdir("..") < 0){
     921:	83 ec 0c             	sub    $0xc,%esp
     924:	68 9d 46 00 00       	push   $0x469d
     929:	e8 59 30 00 00       	call   3987 <chdir>
     92e:	83 c4 10             	add    $0x10,%esp
     931:	85 c0                	test   %eax,%eax
     933:	78 57                	js     98c <dirtest+0xac>
  if(unlink("dir0") < 0){
     935:	83 ec 0c             	sub    $0xc,%esp
     938:	68 f8 40 00 00       	push   $0x40f8
     93d:	e8 25 30 00 00       	call   3967 <unlink>
     942:	83 c4 10             	add    $0x10,%esp
     945:	89 c2                	mov    %eax,%edx
    printf(stdout, "unlink dir0 failed\n");
     947:	a1 5c 5f 00 00       	mov    0x5f5c,%eax
  if(unlink("dir0") < 0){
     94c:	85 d2                	test   %edx,%edx
     94e:	78 2a                	js     97a <dirtest+0x9a>
  printf(stdout, "mkdir test ok\n");
     950:	83 ec 08             	sub    $0x8,%esp
     953:	68 35 41 00 00       	push   $0x4135
     958:	50                   	push   %eax
     959:	e8 22 31 00 00       	call   3a80 <printf>
}
     95e:	83 c4 10             	add    $0x10,%esp
     961:	c9                   	leave
     962:	c3                   	ret
    printf(stdout, "mkdir failed\n");
     963:	50                   	push   %eax
     964:	50                   	push   %eax
     965:	68 28 3e 00 00       	push   $0x3e28
     96a:	ff 35 5c 5f 00 00    	push   0x5f5c
     970:	e8 0b 31 00 00       	call   3a80 <printf>
    exit();
     975:	e8 9d 2f 00 00       	call   3917 <exit>
    printf(stdout, "unlink dir0 failed\n");
     97a:	52                   	push   %edx
     97b:	52                   	push   %edx
     97c:	68 21 41 00 00       	push   $0x4121
     981:	50                   	push   %eax
     982:	e8 f9 30 00 00       	call   3a80 <printf>
    exit();
     987:	e8 8b 2f 00 00       	call   3917 <exit>
    printf(stdout, "chdir .. failed\n");
     98c:	51                   	push   %ecx
     98d:	51                   	push   %ecx
     98e:	68 10 41 00 00       	push   $0x4110
     993:	ff 35 5c 5f 00 00    	push   0x5f5c
     999:	e8 e2 30 00 00       	call   3a80 <printf>
    exit();
     99e:	e8 74 2f 00 00       	call   3917 <exit>
    printf(stdout, "chdir dir0 failed\n");
     9a3:	50                   	push   %eax
     9a4:	50                   	push   %eax
     9a5:	68 fd 40 00 00       	push   $0x40fd
     9aa:	ff 35 5c 5f 00 00    	push   0x5f5c
     9b0:	e8 cb 30 00 00       	call   3a80 <printf>
    exit();
     9b5:	e8 5d 2f 00 00       	call   3917 <exit>
     9ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000009c0 <exectest>:
{
     9c0:	55                   	push   %ebp
     9c1:	89 e5                	mov    %esp,%ebp
     9c3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     9c6:	68 44 41 00 00       	push   $0x4144
     9cb:	ff 35 5c 5f 00 00    	push   0x5f5c
     9d1:	e8 aa 30 00 00       	call   3a80 <printf>
  if(exec("echo", echoargv) < 0){
     9d6:	5a                   	pop    %edx
     9d7:	59                   	pop    %ecx
     9d8:	68 60 5f 00 00       	push   $0x5f60
     9dd:	68 0d 3f 00 00       	push   $0x3f0d
     9e2:	e8 68 2f 00 00       	call   394f <exec>
     9e7:	83 c4 10             	add    $0x10,%esp
     9ea:	85 c0                	test   %eax,%eax
     9ec:	78 02                	js     9f0 <exectest+0x30>
}
     9ee:	c9                   	leave
     9ef:	c3                   	ret
    printf(stdout, "exec echo failed\n");
     9f0:	50                   	push   %eax
     9f1:	50                   	push   %eax
     9f2:	68 4f 41 00 00       	push   $0x414f
     9f7:	ff 35 5c 5f 00 00    	push   0x5f5c
     9fd:	e8 7e 30 00 00       	call   3a80 <printf>
    exit();
     a02:	e8 10 2f 00 00       	call   3917 <exit>
     a07:	90                   	nop
     a08:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     a0f:	00 

00000a10 <pipe1>:
{
     a10:	55                   	push   %ebp
     a11:	89 e5                	mov    %esp,%ebp
     a13:	57                   	push   %edi
     a14:	56                   	push   %esi
  if(pipe(fds) != 0){
     a15:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
     a18:	53                   	push   %ebx
     a19:	83 ec 28             	sub    $0x28,%esp
  if(pipe(fds) != 0){
     a1c:	50                   	push   %eax
     a1d:	e8 05 2f 00 00       	call   3927 <pipe>
     a22:	83 c4 10             	add    $0x10,%esp
     a25:	85 c0                	test   %eax,%eax
     a27:	0f 85 39 01 00 00    	jne    b66 <pipe1+0x156>
  pid = fork();
     a2d:	e8 dd 2e 00 00       	call   390f <fork>
  if(pid == 0){
     a32:	85 c0                	test   %eax,%eax
     a34:	0f 84 82 00 00 00    	je     abc <pipe1+0xac>
  } else if(pid > 0){
     a3a:	0f 8e 39 01 00 00    	jle    b79 <pipe1+0x169>
    close(fds[1]);
     a40:	83 ec 0c             	sub    $0xc,%esp
     a43:	ff 75 e4             	push   -0x1c(%ebp)
    total = 0;
     a46:	31 f6                	xor    %esi,%esi
  seq = 0;
     a48:	31 db                	xor    %ebx,%ebx
    cc = 1;
     a4a:	bf 01 00 00 00       	mov    $0x1,%edi
    close(fds[1]);
     a4f:	e8 eb 2e 00 00       	call   393f <close>
    while((n = read(fds[0], buf, cc)) > 0){
     a54:	83 c4 10             	add    $0x10,%esp
     a57:	83 ec 04             	sub    $0x4,%esp
     a5a:	57                   	push   %edi
     a5b:	68 a0 86 00 00       	push   $0x86a0
     a60:	ff 75 e0             	push   -0x20(%ebp)
     a63:	e8 c7 2e 00 00       	call   392f <read>
     a68:	83 c4 10             	add    $0x10,%esp
     a6b:	89 c1                	mov    %eax,%ecx
     a6d:	85 c0                	test   %eax,%eax
     a6f:	0f 8e b0 00 00 00    	jle    b25 <pipe1+0x115>
     a75:	8d 14 0b             	lea    (%ebx,%ecx,1),%edx
      for(i = 0; i < n; i++){
     a78:	31 c0                	xor    %eax,%eax
     a7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     a80:	38 98 a0 86 00 00    	cmp    %bl,0x86a0(%eax)
     a86:	75 1a                	jne    aa2 <pipe1+0x92>
     a88:	83 c3 01             	add    $0x1,%ebx
      for(i = 0; i < n; i++){
     a8b:	83 c0 01             	add    $0x1,%eax
     a8e:	39 d3                	cmp    %edx,%ebx
     a90:	75 ee                	jne    a80 <pipe1+0x70>
      cc = cc * 2;
     a92:	01 ff                	add    %edi,%edi
      if(cc > sizeof(buf))
     a94:	b8 00 20 00 00       	mov    $0x2000,%eax
      total += n;
     a99:	01 ce                	add    %ecx,%esi
      if(cc > sizeof(buf))
     a9b:	39 c7                	cmp    %eax,%edi
     a9d:	0f 4f f8             	cmovg  %eax,%edi
     aa0:	eb b5                	jmp    a57 <pipe1+0x47>
          printf(1, "pipe1 oops 2\n");
     aa2:	83 ec 08             	sub    $0x8,%esp
     aa5:	68 7e 41 00 00       	push   $0x417e
     aaa:	6a 01                	push   $0x1
     aac:	e8 cf 2f 00 00       	call   3a80 <printf>
     ab1:	83 c4 10             	add    $0x10,%esp
}
     ab4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ab7:	5b                   	pop    %ebx
     ab8:	5e                   	pop    %esi
     ab9:	5f                   	pop    %edi
     aba:	5d                   	pop    %ebp
     abb:	c3                   	ret
    close(fds[0]);
     abc:	83 ec 0c             	sub    $0xc,%esp
     abf:	ff 75 e0             	push   -0x20(%ebp)
  seq = 0;
     ac2:	31 db                	xor    %ebx,%ebx
    close(fds[0]);
     ac4:	e8 76 2e 00 00       	call   393f <close>
     ac9:	83 c4 10             	add    $0x10,%esp
      for(i = 0; i < 1033; i++)
     acc:	31 c0                	xor    %eax,%eax
     ace:	66 90                	xchg   %ax,%ax
     ad0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     ad7:	00 
     ad8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     adf:	00 
        buf[i] = seq++;
     ae0:	8d 14 18             	lea    (%eax,%ebx,1),%edx
      for(i = 0; i < 1033; i++)
     ae3:	83 c0 01             	add    $0x1,%eax
        buf[i] = seq++;
     ae6:	88 90 9f 86 00 00    	mov    %dl,0x869f(%eax)
      for(i = 0; i < 1033; i++)
     aec:	3d 09 04 00 00       	cmp    $0x409,%eax
     af1:	75 ed                	jne    ae0 <pipe1+0xd0>
      if(write(fds[1], buf, 1033) != 1033){
     af3:	83 ec 04             	sub    $0x4,%esp
     af6:	68 09 04 00 00       	push   $0x409
     afb:	68 a0 86 00 00       	push   $0x86a0
     b00:	ff 75 e4             	push   -0x1c(%ebp)
     b03:	e8 2f 2e 00 00       	call   3937 <write>
     b08:	83 c4 10             	add    $0x10,%esp
     b0b:	3d 09 04 00 00       	cmp    $0x409,%eax
     b10:	75 7a                	jne    b8c <pipe1+0x17c>
     b12:	81 c3 09 04 00 00    	add    $0x409,%ebx
    for(n = 0; n < 5; n++){
     b18:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     b1e:	75 ac                	jne    acc <pipe1+0xbc>
    exit();
     b20:	e8 f2 2d 00 00       	call   3917 <exit>
    if(total != 5 * 1033){
     b25:	81 fe 2d 14 00 00    	cmp    $0x142d,%esi
     b2b:	75 26                	jne    b53 <pipe1+0x143>
    close(fds[0]);
     b2d:	83 ec 0c             	sub    $0xc,%esp
     b30:	ff 75 e0             	push   -0x20(%ebp)
     b33:	e8 07 2e 00 00       	call   393f <close>
    wait();
     b38:	e8 e2 2d 00 00       	call   391f <wait>
  printf(1, "pipe1 ok\n");
     b3d:	5a                   	pop    %edx
     b3e:	59                   	pop    %ecx
     b3f:	68 a3 41 00 00       	push   $0x41a3
     b44:	6a 01                	push   $0x1
     b46:	e8 35 2f 00 00       	call   3a80 <printf>
     b4b:	83 c4 10             	add    $0x10,%esp
     b4e:	e9 61 ff ff ff       	jmp    ab4 <pipe1+0xa4>
      printf(1, "pipe1 oops 3 total %d\n", total);
     b53:	53                   	push   %ebx
     b54:	56                   	push   %esi
     b55:	68 8c 41 00 00       	push   $0x418c
     b5a:	6a 01                	push   $0x1
     b5c:	e8 1f 2f 00 00       	call   3a80 <printf>
      exit();
     b61:	e8 b1 2d 00 00       	call   3917 <exit>
    printf(1, "pipe() failed\n");
     b66:	57                   	push   %edi
     b67:	57                   	push   %edi
     b68:	68 61 41 00 00       	push   $0x4161
     b6d:	6a 01                	push   $0x1
     b6f:	e8 0c 2f 00 00       	call   3a80 <printf>
    exit();
     b74:	e8 9e 2d 00 00       	call   3917 <exit>
    printf(1, "fork() failed\n");
     b79:	50                   	push   %eax
     b7a:	50                   	push   %eax
     b7b:	68 ad 41 00 00       	push   $0x41ad
     b80:	6a 01                	push   $0x1
     b82:	e8 f9 2e 00 00       	call   3a80 <printf>
    exit();
     b87:	e8 8b 2d 00 00       	call   3917 <exit>
        printf(1, "pipe1 oops 1\n");
     b8c:	56                   	push   %esi
     b8d:	56                   	push   %esi
     b8e:	68 70 41 00 00       	push   $0x4170
     b93:	6a 01                	push   $0x1
     b95:	e8 e6 2e 00 00       	call   3a80 <printf>
        exit();
     b9a:	e8 78 2d 00 00       	call   3917 <exit>
     b9f:	90                   	nop

00000ba0 <preempt>:
{
     ba0:	55                   	push   %ebp
     ba1:	89 e5                	mov    %esp,%ebp
     ba3:	56                   	push   %esi
     ba4:	53                   	push   %ebx
     ba5:	83 ec 28             	sub    $0x28,%esp
  printf(1, "preempt: ");
     ba8:	68 bc 41 00 00       	push   $0x41bc
     bad:	6a 01                	push   $0x1
     baf:	e8 cc 2e 00 00       	call   3a80 <printf>
  pid1 = fork();
     bb4:	e8 56 2d 00 00       	call   390f <fork>
  if(pid1 == 0)
     bb9:	83 c4 10             	add    $0x10,%esp
     bbc:	85 c0                	test   %eax,%eax
     bbe:	75 02                	jne    bc2 <preempt+0x22>
    for(;;)
     bc0:	eb fe                	jmp    bc0 <preempt+0x20>
     bc2:	89 c3                	mov    %eax,%ebx
  pid2 = fork();
     bc4:	e8 46 2d 00 00       	call   390f <fork>
  if(pid2 == 0)
     bc9:	85 c0                	test   %eax,%eax
     bcb:	75 05                	jne    bd2 <preempt+0x32>
     bcd:	90                   	nop
     bce:	66 90                	xchg   %ax,%ax
    for(;;)
     bd0:	eb fe                	jmp    bd0 <preempt+0x30>
  pipe(pfds);
     bd2:	83 ec 0c             	sub    $0xc,%esp
     bd5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     bd8:	8d 45 f0             	lea    -0x10(%ebp),%eax
     bdb:	50                   	push   %eax
     bdc:	e8 46 2d 00 00       	call   3927 <pipe>
  pid3 = fork();
     be1:	e8 29 2d 00 00       	call   390f <fork>
  if(pid3 == 0){
     be6:	83 c4 10             	add    $0x10,%esp
  pid3 = fork();
     be9:	89 c6                	mov    %eax,%esi
  if(pid3 == 0){
     beb:	85 c0                	test   %eax,%eax
     bed:	75 43                	jne    c32 <preempt+0x92>
    close(pfds[0]);
     bef:	83 ec 0c             	sub    $0xc,%esp
     bf2:	ff 75 f0             	push   -0x10(%ebp)
     bf5:	e8 45 2d 00 00       	call   393f <close>
    if(write(pfds[1], "x", 1) != 1)
     bfa:	83 c4 0c             	add    $0xc,%esp
     bfd:	6a 01                	push   $0x1
     bff:	68 81 47 00 00       	push   $0x4781
     c04:	ff 75 f4             	push   -0xc(%ebp)
     c07:	e8 2b 2d 00 00       	call   3937 <write>
     c0c:	83 c4 10             	add    $0x10,%esp
     c0f:	83 f8 01             	cmp    $0x1,%eax
     c12:	0f 85 bf 00 00 00    	jne    cd7 <preempt+0x137>
    close(pfds[1]);
     c18:	83 ec 0c             	sub    $0xc,%esp
     c1b:	ff 75 f4             	push   -0xc(%ebp)
     c1e:	e8 1c 2d 00 00       	call   393f <close>
     c23:	83 c4 10             	add    $0x10,%esp
     c26:	66 90                	xchg   %ax,%ax
     c28:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     c2f:	00 
    for(;;)
     c30:	eb fe                	jmp    c30 <preempt+0x90>
  close(pfds[1]);
     c32:	83 ec 0c             	sub    $0xc,%esp
     c35:	ff 75 f4             	push   -0xc(%ebp)
     c38:	e8 02 2d 00 00       	call   393f <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     c3d:	83 c4 0c             	add    $0xc,%esp
     c40:	68 00 20 00 00       	push   $0x2000
     c45:	68 a0 86 00 00       	push   $0x86a0
     c4a:	ff 75 f0             	push   -0x10(%ebp)
     c4d:	e8 dd 2c 00 00       	call   392f <read>
     c52:	83 c4 10             	add    $0x10,%esp
     c55:	83 f8 01             	cmp    $0x1,%eax
     c58:	75 69                	jne    cc3 <preempt+0x123>
  close(pfds[0]);
     c5a:	83 ec 0c             	sub    $0xc,%esp
     c5d:	ff 75 f0             	push   -0x10(%ebp)
     c60:	e8 da 2c 00 00       	call   393f <close>
  printf(1, "kill... ");
     c65:	58                   	pop    %eax
     c66:	5a                   	pop    %edx
     c67:	68 ed 41 00 00       	push   $0x41ed
     c6c:	6a 01                	push   $0x1
     c6e:	e8 0d 2e 00 00       	call   3a80 <printf>
  kill(pid1);
     c73:	89 1c 24             	mov    %ebx,(%esp)
     c76:	e8 cc 2c 00 00       	call   3947 <kill>
  kill(pid2);
     c7b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     c7e:	89 14 24             	mov    %edx,(%esp)
     c81:	e8 c1 2c 00 00       	call   3947 <kill>
  kill(pid3);
     c86:	89 34 24             	mov    %esi,(%esp)
     c89:	e8 b9 2c 00 00       	call   3947 <kill>
  printf(1, "wait... ");
     c8e:	59                   	pop    %ecx
     c8f:	5b                   	pop    %ebx
     c90:	68 f6 41 00 00       	push   $0x41f6
     c95:	6a 01                	push   $0x1
     c97:	e8 e4 2d 00 00       	call   3a80 <printf>
  wait();
     c9c:	e8 7e 2c 00 00       	call   391f <wait>
  wait();
     ca1:	e8 79 2c 00 00       	call   391f <wait>
  wait();
     ca6:	e8 74 2c 00 00       	call   391f <wait>
  printf(1, "preempt ok\n");
     cab:	5e                   	pop    %esi
     cac:	58                   	pop    %eax
     cad:	68 ff 41 00 00       	push   $0x41ff
     cb2:	6a 01                	push   $0x1
     cb4:	e8 c7 2d 00 00       	call   3a80 <printf>
     cb9:	83 c4 10             	add    $0x10,%esp
}
     cbc:	8d 65 f8             	lea    -0x8(%ebp),%esp
     cbf:	5b                   	pop    %ebx
     cc0:	5e                   	pop    %esi
     cc1:	5d                   	pop    %ebp
     cc2:	c3                   	ret
    printf(1, "preempt read error");
     cc3:	83 ec 08             	sub    $0x8,%esp
     cc6:	68 da 41 00 00       	push   $0x41da
     ccb:	6a 01                	push   $0x1
     ccd:	e8 ae 2d 00 00       	call   3a80 <printf>
     cd2:	83 c4 10             	add    $0x10,%esp
     cd5:	eb e5                	jmp    cbc <preempt+0x11c>
      printf(1, "preempt write error");
     cd7:	83 ec 08             	sub    $0x8,%esp
     cda:	68 c6 41 00 00       	push   $0x41c6
     cdf:	6a 01                	push   $0x1
     ce1:	e8 9a 2d 00 00       	call   3a80 <printf>
     ce6:	83 c4 10             	add    $0x10,%esp
     ce9:	e9 2a ff ff ff       	jmp    c18 <preempt+0x78>
     cee:	66 90                	xchg   %ax,%ax

00000cf0 <exitwait>:
{
     cf0:	55                   	push   %ebp
     cf1:	89 e5                	mov    %esp,%ebp
     cf3:	56                   	push   %esi
     cf4:	be 64 00 00 00       	mov    $0x64,%esi
     cf9:	53                   	push   %ebx
     cfa:	eb 14                	jmp    d10 <exitwait+0x20>
     cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid){
     d00:	74 68                	je     d6a <exitwait+0x7a>
      if(wait() != pid){
     d02:	e8 18 2c 00 00       	call   391f <wait>
     d07:	39 d8                	cmp    %ebx,%eax
     d09:	75 2d                	jne    d38 <exitwait+0x48>
  for(i = 0; i < 100; i++){
     d0b:	83 ee 01             	sub    $0x1,%esi
     d0e:	74 41                	je     d51 <exitwait+0x61>
    pid = fork();
     d10:	e8 fa 2b 00 00       	call   390f <fork>
     d15:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     d17:	85 c0                	test   %eax,%eax
     d19:	79 e5                	jns    d00 <exitwait+0x10>
      printf(1, "fork failed\n");
     d1b:	83 ec 08             	sub    $0x8,%esp
     d1e:	68 69 4d 00 00       	push   $0x4d69
     d23:	6a 01                	push   $0x1
     d25:	e8 56 2d 00 00       	call   3a80 <printf>
      return;
     d2a:	83 c4 10             	add    $0x10,%esp
}
     d2d:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d30:	5b                   	pop    %ebx
     d31:	5e                   	pop    %esi
     d32:	5d                   	pop    %ebp
     d33:	c3                   	ret
     d34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf(1, "wait wrong pid\n");
     d38:	83 ec 08             	sub    $0x8,%esp
     d3b:	68 0b 42 00 00       	push   $0x420b
     d40:	6a 01                	push   $0x1
     d42:	e8 39 2d 00 00       	call   3a80 <printf>
        return;
     d47:	83 c4 10             	add    $0x10,%esp
}
     d4a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d4d:	5b                   	pop    %ebx
     d4e:	5e                   	pop    %esi
     d4f:	5d                   	pop    %ebp
     d50:	c3                   	ret
  printf(1, "exitwait ok\n");
     d51:	83 ec 08             	sub    $0x8,%esp
     d54:	68 1b 42 00 00       	push   $0x421b
     d59:	6a 01                	push   $0x1
     d5b:	e8 20 2d 00 00       	call   3a80 <printf>
     d60:	83 c4 10             	add    $0x10,%esp
}
     d63:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d66:	5b                   	pop    %ebx
     d67:	5e                   	pop    %esi
     d68:	5d                   	pop    %ebp
     d69:	c3                   	ret
      exit();
     d6a:	e8 a8 2b 00 00       	call   3917 <exit>
     d6f:	90                   	nop

00000d70 <mem>:
{
     d70:	55                   	push   %ebp
     d71:	89 e5                	mov    %esp,%ebp
     d73:	83 ec 10             	sub    $0x10,%esp
  printf(1, "mem test\n");
     d76:	68 28 42 00 00       	push   $0x4228
     d7b:	6a 01                	push   $0x1
{
     d7d:	89 75 fc             	mov    %esi,-0x4(%ebp)
  printf(1, "mem test\n");
     d80:	e8 fb 2c 00 00       	call   3a80 <printf>
  ppid = getpid();
     d85:	e8 0d 2c 00 00       	call   3997 <getpid>
     d8a:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
     d8c:	e8 7e 2b 00 00       	call   390f <fork>
     d91:	83 c4 10             	add    $0x10,%esp
     d94:	85 c0                	test   %eax,%eax
     d96:	0f 85 9c 00 00 00    	jne    e38 <mem+0xc8>
     d9c:	89 5d f8             	mov    %ebx,-0x8(%ebp)
     d9f:	31 db                	xor    %ebx,%ebx
     da1:	eb 09                	jmp    dac <mem+0x3c>
     da3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
      *(char**)m2 = m1;
     da8:	89 18                	mov    %ebx,(%eax)
      m1 = m2;
     daa:	89 c3                	mov    %eax,%ebx
    while((m2 = malloc(10001)) != 0){
     dac:	83 ec 0c             	sub    $0xc,%esp
     daf:	68 11 27 00 00       	push   $0x2711
     db4:	e8 47 2f 00 00       	call   3d00 <malloc>
     db9:	83 c4 10             	add    $0x10,%esp
     dbc:	85 c0                	test   %eax,%eax
     dbe:	75 e8                	jne    da8 <mem+0x38>
    while(m1){
     dc0:	85 db                	test   %ebx,%ebx
     dc2:	74 20                	je     de4 <mem+0x74>
     dc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     dc8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     dcf:	00 
      m2 = *(char**)m1;
     dd0:	89 d8                	mov    %ebx,%eax
      free(m1);
     dd2:	83 ec 0c             	sub    $0xc,%esp
      m2 = *(char**)m1;
     dd5:	8b 1b                	mov    (%ebx),%ebx
      free(m1);
     dd7:	50                   	push   %eax
     dd8:	e8 83 2e 00 00       	call   3c60 <free>
    while(m1){
     ddd:	83 c4 10             	add    $0x10,%esp
     de0:	85 db                	test   %ebx,%ebx
     de2:	75 ec                	jne    dd0 <mem+0x60>
    m1 = malloc(1024*20);
     de4:	83 ec 0c             	sub    $0xc,%esp
     de7:	68 00 50 00 00       	push   $0x5000
     dec:	e8 0f 2f 00 00       	call   3d00 <malloc>
    if(m1 == 0){
     df1:	83 c4 10             	add    $0x10,%esp
     df4:	85 c0                	test   %eax,%eax
     df6:	74 20                	je     e18 <mem+0xa8>
    free(m1);
     df8:	83 ec 0c             	sub    $0xc,%esp
     dfb:	50                   	push   %eax
     dfc:	e8 5f 2e 00 00       	call   3c60 <free>
    printf(1, "mem ok\n");
     e01:	58                   	pop    %eax
     e02:	5a                   	pop    %edx
     e03:	68 4c 42 00 00       	push   $0x424c
     e08:	6a 01                	push   $0x1
     e0a:	e8 71 2c 00 00       	call   3a80 <printf>
    exit();
     e0f:	e8 03 2b 00 00       	call   3917 <exit>
     e14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "couldn't allocate mem?!!\n");
     e18:	83 ec 08             	sub    $0x8,%esp
     e1b:	68 32 42 00 00       	push   $0x4232
     e20:	6a 01                	push   $0x1
     e22:	e8 59 2c 00 00       	call   3a80 <printf>
      kill(ppid);
     e27:	89 34 24             	mov    %esi,(%esp)
     e2a:	e8 18 2b 00 00       	call   3947 <kill>
      exit();
     e2f:	e8 e3 2a 00 00       	call   3917 <exit>
     e34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
     e38:	8b 75 fc             	mov    -0x4(%ebp),%esi
     e3b:	c9                   	leave
    wait();
     e3c:	e9 de 2a 00 00       	jmp    391f <wait>
     e41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e48:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     e4f:	00 

00000e50 <sharedfd>:
{
     e50:	55                   	push   %ebp
     e51:	89 e5                	mov    %esp,%ebp
     e53:	83 ec 40             	sub    $0x40,%esp
  printf(1, "sharedfd test\n");
     e56:	68 54 42 00 00       	push   $0x4254
     e5b:	6a 01                	push   $0x1
     e5d:	e8 1e 2c 00 00       	call   3a80 <printf>
  unlink("sharedfd");
     e62:	c7 04 24 63 42 00 00 	movl   $0x4263,(%esp)
     e69:	e8 f9 2a 00 00       	call   3967 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     e6e:	58                   	pop    %eax
     e6f:	5a                   	pop    %edx
     e70:	68 02 02 00 00       	push   $0x202
     e75:	68 63 42 00 00       	push   $0x4263
     e7a:	e8 d8 2a 00 00       	call   3957 <open>
  if(fd < 0){
     e7f:	83 c4 10             	add    $0x10,%esp
     e82:	85 c0                	test   %eax,%eax
     e84:	0f 88 45 01 00 00    	js     fcf <sharedfd+0x17f>
     e8a:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     e8d:	bb e8 03 00 00       	mov    $0x3e8,%ebx
     e92:	89 75 f8             	mov    %esi,-0x8(%ebp)
     e95:	8d 75 de             	lea    -0x22(%ebp),%esi
     e98:	89 7d fc             	mov    %edi,-0x4(%ebp)
     e9b:	89 c7                	mov    %eax,%edi
  pid = fork();
     e9d:	e8 6d 2a 00 00       	call   390f <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     ea2:	83 f8 01             	cmp    $0x1,%eax
  pid = fork();
     ea5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     ea8:	19 c0                	sbb    %eax,%eax
     eaa:	83 ec 04             	sub    $0x4,%esp
     ead:	83 e0 f3             	and    $0xfffffff3,%eax
     eb0:	6a 0a                	push   $0xa
     eb2:	83 c0 70             	add    $0x70,%eax
     eb5:	50                   	push   %eax
     eb6:	56                   	push   %esi
     eb7:	e8 c4 28 00 00       	call   3780 <memset>
     ebc:	83 c4 10             	add    $0x10,%esp
     ebf:	eb 0c                	jmp    ecd <sharedfd+0x7d>
     ec1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 1000; i++){
     ec8:	83 eb 01             	sub    $0x1,%ebx
     ecb:	74 26                	je     ef3 <sharedfd+0xa3>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     ecd:	83 ec 04             	sub    $0x4,%esp
     ed0:	6a 0a                	push   $0xa
     ed2:	56                   	push   %esi
     ed3:	57                   	push   %edi
     ed4:	e8 5e 2a 00 00       	call   3937 <write>
     ed9:	83 c4 10             	add    $0x10,%esp
     edc:	83 f8 0a             	cmp    $0xa,%eax
     edf:	74 e7                	je     ec8 <sharedfd+0x78>
      printf(1, "fstests: write sharedfd failed\n");
     ee1:	83 ec 08             	sub    $0x8,%esp
     ee4:	68 5c 4f 00 00       	push   $0x4f5c
     ee9:	6a 01                	push   $0x1
     eeb:	e8 90 2b 00 00       	call   3a80 <printf>
      break;
     ef0:	83 c4 10             	add    $0x10,%esp
  if(pid == 0)
     ef3:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     ef6:	85 c9                	test   %ecx,%ecx
     ef8:	0f 84 ef 00 00 00    	je     fed <sharedfd+0x19d>
    wait();
     efe:	e8 1c 2a 00 00       	call   391f <wait>
  close(fd);
     f03:	83 ec 0c             	sub    $0xc,%esp
  nc = np = 0;
     f06:	31 db                	xor    %ebx,%ebx
  close(fd);
     f08:	57                   	push   %edi
  nc = np = 0;
     f09:	31 ff                	xor    %edi,%edi
  close(fd);
     f0b:	e8 2f 2a 00 00       	call   393f <close>
  fd = open("sharedfd", 0);
     f10:	58                   	pop    %eax
     f11:	5a                   	pop    %edx
     f12:	6a 00                	push   $0x0
     f14:	68 63 42 00 00       	push   $0x4263
     f19:	e8 39 2a 00 00       	call   3957 <open>
  if(fd < 0){
     f1e:	83 c4 10             	add    $0x10,%esp
  fd = open("sharedfd", 0);
     f21:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  if(fd < 0){
     f24:	85 c0                	test   %eax,%eax
     f26:	0f 88 b7 00 00 00    	js     fe3 <sharedfd+0x193>
     f2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
     f30:	83 ec 04             	sub    $0x4,%esp
     f33:	6a 0a                	push   $0xa
     f35:	56                   	push   %esi
     f36:	ff 75 d4             	push   -0x2c(%ebp)
     f39:	e8 f1 29 00 00       	call   392f <read>
     f3e:	83 c4 10             	add    $0x10,%esp
     f41:	85 c0                	test   %eax,%eax
     f43:	7e 43                	jle    f88 <sharedfd+0x138>
     f45:	89 f0                	mov    %esi,%eax
     f47:	eb 2c                	jmp    f75 <sharedfd+0x125>
     f49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f50:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     f57:	00 
     f58:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     f5f:	00 
        np++;
     f60:	80 f9 70             	cmp    $0x70,%cl
     f63:	0f 94 c1             	sete   %cl
     f66:	0f b6 c9             	movzbl %cl,%ecx
     f69:	01 cf                	add    %ecx,%edi
    for(i = 0; i < sizeof(buf); i++){
     f6b:	83 c0 01             	add    $0x1,%eax
     f6e:	8d 55 e8             	lea    -0x18(%ebp),%edx
     f71:	39 d0                	cmp    %edx,%eax
     f73:	74 bb                	je     f30 <sharedfd+0xe0>
      if(buf[i] == 'c')
     f75:	0f b6 08             	movzbl (%eax),%ecx
     f78:	80 f9 63             	cmp    $0x63,%cl
     f7b:	75 e3                	jne    f60 <sharedfd+0x110>
        nc++;
     f7d:	83 c3 01             	add    $0x1,%ebx
      if(buf[i] == 'p')
     f80:	eb e9                	jmp    f6b <sharedfd+0x11b>
     f82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  close(fd);
     f88:	83 ec 0c             	sub    $0xc,%esp
     f8b:	ff 75 d4             	push   -0x2c(%ebp)
     f8e:	e8 ac 29 00 00       	call   393f <close>
  unlink("sharedfd");
     f93:	c7 04 24 63 42 00 00 	movl   $0x4263,(%esp)
     f9a:	e8 c8 29 00 00       	call   3967 <unlink>
  if(nc == 10000 && np == 10000){
     f9f:	83 c4 10             	add    $0x10,%esp
     fa2:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
     fa8:	75 48                	jne    ff2 <sharedfd+0x1a2>
     faa:	81 ff 10 27 00 00    	cmp    $0x2710,%edi
     fb0:	75 40                	jne    ff2 <sharedfd+0x1a2>
    printf(1, "sharedfd ok\n");
     fb2:	83 ec 08             	sub    $0x8,%esp
     fb5:	68 6c 42 00 00       	push   $0x426c
     fba:	6a 01                	push   $0x1
     fbc:	e8 bf 2a 00 00       	call   3a80 <printf>
     fc1:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     fc4:	8b 75 f8             	mov    -0x8(%ebp),%esi
     fc7:	83 c4 10             	add    $0x10,%esp
     fca:	8b 7d fc             	mov    -0x4(%ebp),%edi
}
     fcd:	c9                   	leave
     fce:	c3                   	ret
    printf(1, "fstests: cannot open sharedfd for writing");
     fcf:	83 ec 08             	sub    $0x8,%esp
     fd2:	68 30 4f 00 00       	push   $0x4f30
     fd7:	6a 01                	push   $0x1
     fd9:	e8 a2 2a 00 00       	call   3a80 <printf>
    return;
     fde:	83 c4 10             	add    $0x10,%esp
}
     fe1:	c9                   	leave
     fe2:	c3                   	ret
    printf(1, "fstests: cannot open sharedfd for reading\n");
     fe3:	83 ec 08             	sub    $0x8,%esp
     fe6:	68 7c 4f 00 00       	push   $0x4f7c
     feb:	eb cd                	jmp    fba <sharedfd+0x16a>
    exit();
     fed:	e8 25 29 00 00       	call   3917 <exit>
    printf(1, "sharedfd oops %d %d\n", nc, np);
     ff2:	57                   	push   %edi
     ff3:	53                   	push   %ebx
     ff4:	68 79 42 00 00       	push   $0x4279
     ff9:	6a 01                	push   $0x1
     ffb:	e8 80 2a 00 00       	call   3a80 <printf>
    exit();
    1000:	e8 12 29 00 00       	call   3917 <exit>
    1005:	8d 76 00             	lea    0x0(%esi),%esi
    1008:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    100f:	00 

00001010 <fourfiles>:
{
    1010:	55                   	push   %ebp
    1011:	89 e5                	mov    %esp,%ebp
    1013:	57                   	push   %edi
    1014:	56                   	push   %esi
    1015:	53                   	push   %ebx
  for(pi = 0; pi < 4; pi++){
    1016:	31 db                	xor    %ebx,%ebx
{
    1018:	83 ec 34             	sub    $0x34,%esp
  char *names[] = { "f0", "f1", "f2", "f3" };
    101b:	c7 45 d8 8e 42 00 00 	movl   $0x428e,-0x28(%ebp)
    1022:	c7 45 dc d7 43 00 00 	movl   $0x43d7,-0x24(%ebp)
    1029:	c7 45 e0 db 43 00 00 	movl   $0x43db,-0x20(%ebp)
    1030:	c7 45 e4 91 42 00 00 	movl   $0x4291,-0x1c(%ebp)
  printf(1, "fourfiles test\n");
    1037:	68 94 42 00 00       	push   $0x4294
    103c:	6a 01                	push   $0x1
    103e:	e8 3d 2a 00 00       	call   3a80 <printf>
    1043:	83 c4 10             	add    $0x10,%esp
    fname = names[pi];
    1046:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    unlink(fname);
    104a:	83 ec 0c             	sub    $0xc,%esp
    104d:	56                   	push   %esi
    104e:	e8 14 29 00 00       	call   3967 <unlink>
    pid = fork();
    1053:	e8 b7 28 00 00       	call   390f <fork>
    if(pid < 0){
    1058:	83 c4 10             	add    $0x10,%esp
    105b:	85 c0                	test   %eax,%eax
    105d:	0f 88 6d 01 00 00    	js     11d0 <fourfiles+0x1c0>
    if(pid == 0){
    1063:	0f 84 f0 00 00 00    	je     1159 <fourfiles+0x149>
  for(pi = 0; pi < 4; pi++){
    1069:	83 c3 01             	add    $0x1,%ebx
    106c:	83 fb 04             	cmp    $0x4,%ebx
    106f:	75 d5                	jne    1046 <fourfiles+0x36>
    wait();
    1071:	e8 a9 28 00 00       	call   391f <wait>
    1076:	be 30 00 00 00       	mov    $0x30,%esi
    107b:	e8 9f 28 00 00       	call   391f <wait>
    1080:	e8 9a 28 00 00       	call   391f <wait>
    1085:	e8 95 28 00 00       	call   391f <wait>
    fname = names[i];
    108a:	8b 84 b5 18 ff ff ff 	mov    -0xe8(%ebp,%esi,4),%eax
    fd = open(fname, 0);
    1091:	83 ec 08             	sub    $0x8,%esp
    total = 0;
    1094:	31 db                	xor    %ebx,%ebx
    fname = names[i];
    1096:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    fd = open(fname, 0);
    1099:	6a 00                	push   $0x0
    109b:	50                   	push   %eax
    109c:	e8 b6 28 00 00       	call   3957 <open>
    while((n = read(fd, buf, sizeof(buf))) > 0){
    10a1:	83 c4 10             	add    $0x10,%esp
    fd = open(fname, 0);
    10a4:	89 c7                	mov    %eax,%edi
    while((n = read(fd, buf, sizeof(buf))) > 0){
    10a6:	66 90                	xchg   %ax,%ax
    10a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    10af:	00 
    10b0:	83 ec 04             	sub    $0x4,%esp
    10b3:	68 00 20 00 00       	push   $0x2000
    10b8:	68 a0 86 00 00       	push   $0x86a0
    10bd:	57                   	push   %edi
    10be:	e8 6c 28 00 00       	call   392f <read>
    10c3:	83 c4 10             	add    $0x10,%esp
    10c6:	89 c1                	mov    %eax,%ecx
    10c8:	85 c0                	test   %eax,%eax
    10ca:	7e 2a                	jle    10f6 <fourfiles+0xe6>
      for(j = 0; j < n; j++){
    10cc:	31 c0                	xor    %eax,%eax
    10ce:	66 90                	xchg   %ax,%ax
    10d0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    10d7:	00 
    10d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    10df:	00 
        if(buf[j] != '0'+i){
    10e0:	0f be 90 a0 86 00 00 	movsbl 0x86a0(%eax),%edx
    10e7:	39 f2                	cmp    %esi,%edx
    10e9:	75 5a                	jne    1145 <fourfiles+0x135>
      for(j = 0; j < n; j++){
    10eb:	83 c0 01             	add    $0x1,%eax
    10ee:	39 c1                	cmp    %eax,%ecx
    10f0:	75 ee                	jne    10e0 <fourfiles+0xd0>
      total += n;
    10f2:	01 cb                	add    %ecx,%ebx
    10f4:	eb ba                	jmp    10b0 <fourfiles+0xa0>
    close(fd);
    10f6:	83 ec 0c             	sub    $0xc,%esp
    10f9:	57                   	push   %edi
    10fa:	e8 40 28 00 00       	call   393f <close>
    if(total != 12*500){
    10ff:	83 c4 10             	add    $0x10,%esp
    1102:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    1108:	0f 85 d6 00 00 00    	jne    11e4 <fourfiles+0x1d4>
    unlink(fname);
    110e:	83 ec 0c             	sub    $0xc,%esp
    1111:	ff 75 d4             	push   -0x2c(%ebp)
    1114:	e8 4e 28 00 00       	call   3967 <unlink>
  for(i = 0; i < 2; i++){
    1119:	83 c4 10             	add    $0x10,%esp
    111c:	83 fe 31             	cmp    $0x31,%esi
    111f:	75 1a                	jne    113b <fourfiles+0x12b>
  printf(1, "fourfiles ok\n");
    1121:	83 ec 08             	sub    $0x8,%esp
    1124:	68 d2 42 00 00       	push   $0x42d2
    1129:	6a 01                	push   $0x1
    112b:	e8 50 29 00 00       	call   3a80 <printf>
}
    1130:	83 c4 10             	add    $0x10,%esp
    1133:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1136:	5b                   	pop    %ebx
    1137:	5e                   	pop    %esi
    1138:	5f                   	pop    %edi
    1139:	5d                   	pop    %ebp
    113a:	c3                   	ret
  for(i = 0; i < 2; i++){
    113b:	be 31 00 00 00       	mov    $0x31,%esi
    1140:	e9 45 ff ff ff       	jmp    108a <fourfiles+0x7a>
          printf(1, "wrong char\n");
    1145:	83 ec 08             	sub    $0x8,%esp
    1148:	68 b5 42 00 00       	push   $0x42b5
    114d:	6a 01                	push   $0x1
    114f:	e8 2c 29 00 00       	call   3a80 <printf>
          exit();
    1154:	e8 be 27 00 00       	call   3917 <exit>
      fd = open(fname, O_CREATE | O_RDWR);
    1159:	83 ec 08             	sub    $0x8,%esp
    115c:	68 02 02 00 00       	push   $0x202
    1161:	56                   	push   %esi
    1162:	e8 f0 27 00 00       	call   3957 <open>
      if(fd < 0){
    1167:	83 c4 10             	add    $0x10,%esp
      fd = open(fname, O_CREATE | O_RDWR);
    116a:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    116c:	85 c0                	test   %eax,%eax
    116e:	78 45                	js     11b5 <fourfiles+0x1a5>
      memset(buf, '0'+pi, 512);
    1170:	83 ec 04             	sub    $0x4,%esp
    1173:	83 c3 30             	add    $0x30,%ebx
    1176:	68 00 02 00 00       	push   $0x200
    117b:	53                   	push   %ebx
    117c:	bb 0c 00 00 00       	mov    $0xc,%ebx
    1181:	68 a0 86 00 00       	push   $0x86a0
    1186:	e8 f5 25 00 00       	call   3780 <memset>
    118b:	83 c4 10             	add    $0x10,%esp
        if((n = write(fd, buf, 500)) != 500){
    118e:	83 ec 04             	sub    $0x4,%esp
    1191:	68 f4 01 00 00       	push   $0x1f4
    1196:	68 a0 86 00 00       	push   $0x86a0
    119b:	56                   	push   %esi
    119c:	e8 96 27 00 00       	call   3937 <write>
    11a1:	83 c4 10             	add    $0x10,%esp
    11a4:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    11a9:	75 4c                	jne    11f7 <fourfiles+0x1e7>
      for(i = 0; i < 12; i++){
    11ab:	83 eb 01             	sub    $0x1,%ebx
    11ae:	75 de                	jne    118e <fourfiles+0x17e>
      exit();
    11b0:	e8 62 27 00 00       	call   3917 <exit>
        printf(1, "create failed\n");
    11b5:	51                   	push   %ecx
    11b6:	51                   	push   %ecx
    11b7:	68 2f 45 00 00       	push   $0x452f
    11bc:	6a 01                	push   $0x1
    11be:	e8 bd 28 00 00       	call   3a80 <printf>
        exit();
    11c3:	e8 4f 27 00 00       	call   3917 <exit>
    11c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    11cf:	00 
      printf(1, "fork failed\n");
    11d0:	83 ec 08             	sub    $0x8,%esp
    11d3:	68 69 4d 00 00       	push   $0x4d69
    11d8:	6a 01                	push   $0x1
    11da:	e8 a1 28 00 00       	call   3a80 <printf>
      exit();
    11df:	e8 33 27 00 00       	call   3917 <exit>
      printf(1, "wrong length %d\n", total);
    11e4:	50                   	push   %eax
    11e5:	53                   	push   %ebx
    11e6:	68 c1 42 00 00       	push   $0x42c1
    11eb:	6a 01                	push   $0x1
    11ed:	e8 8e 28 00 00       	call   3a80 <printf>
      exit();
    11f2:	e8 20 27 00 00       	call   3917 <exit>
          printf(1, "write failed %d\n", n);
    11f7:	52                   	push   %edx
    11f8:	50                   	push   %eax
    11f9:	68 a4 42 00 00       	push   $0x42a4
    11fe:	6a 01                	push   $0x1
    1200:	e8 7b 28 00 00       	call   3a80 <printf>
          exit();
    1205:	e8 0d 27 00 00       	call   3917 <exit>
    120a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001210 <createdelete>:
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	57                   	push   %edi
    1214:	56                   	push   %esi
  for(pi = 0; pi < 4; pi++){
    1215:	31 f6                	xor    %esi,%esi
{
    1217:	53                   	push   %ebx
    1218:	83 ec 44             	sub    $0x44,%esp
  printf(1, "createdelete test\n");
    121b:	68 e0 42 00 00       	push   $0x42e0
    1220:	6a 01                	push   $0x1
    1222:	e8 59 28 00 00       	call   3a80 <printf>
    1227:	83 c4 10             	add    $0x10,%esp
    pid = fork();
    122a:	e8 e0 26 00 00       	call   390f <fork>
    122f:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
    1231:	85 c0                	test   %eax,%eax
    1233:	0f 88 aa 01 00 00    	js     13e3 <createdelete+0x1d3>
    if(pid == 0){
    1239:	0f 84 11 01 00 00    	je     1350 <createdelete+0x140>
  for(pi = 0; pi < 4; pi++){
    123f:	83 c6 01             	add    $0x1,%esi
    1242:	83 fe 04             	cmp    $0x4,%esi
    1245:	75 e3                	jne    122a <createdelete+0x1a>
    wait();
    1247:	e8 d3 26 00 00       	call   391f <wait>
  for(i = 0; i < N; i++){
    124c:	31 ff                	xor    %edi,%edi
    124e:	8d 75 c8             	lea    -0x38(%ebp),%esi
    wait();
    1251:	e8 c9 26 00 00       	call   391f <wait>
    1256:	e8 c4 26 00 00       	call   391f <wait>
    125b:	e8 bf 26 00 00       	call   391f <wait>
  name[0] = name[1] = name[2] = 0;
    1260:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
  for(i = 0; i < N; i++){
    1264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1268:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    126f:	00 
      if((i == 0 || i >= N/2) && fd < 0){
    1270:	85 ff                	test   %edi,%edi
      name[1] = '0' + i;
    1272:	8d 47 30             	lea    0x30(%edi),%eax
      if((i == 0 || i >= N/2) && fd < 0){
    1275:	bb 70 00 00 00       	mov    $0x70,%ebx
    127a:	0f 94 c2             	sete   %dl
    127d:	83 ff 09             	cmp    $0x9,%edi
      name[1] = '0' + i;
    1280:	88 45 c7             	mov    %al,-0x39(%ebp)
      if((i == 0 || i >= N/2) && fd < 0){
    1283:	0f 9f c0             	setg   %al
    1286:	09 c2                	or     %eax,%edx
    1288:	88 55 c6             	mov    %dl,-0x3a(%ebp)
      name[1] = '0' + i;
    128b:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      fd = open(name, 0);
    128f:	83 ec 08             	sub    $0x8,%esp
      name[0] = 'p' + pi;
    1292:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[1] = '0' + i;
    1295:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    1298:	6a 00                	push   $0x0
    129a:	56                   	push   %esi
    129b:	e8 b7 26 00 00       	call   3957 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    12a0:	83 c4 10             	add    $0x10,%esp
    12a3:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    12a7:	0f 84 83 00 00 00    	je     1330 <createdelete+0x120>
    12ad:	85 c0                	test   %eax,%eax
    12af:	0f 88 19 01 00 00    	js     13ce <createdelete+0x1be>
        close(fd);
    12b5:	83 ec 0c             	sub    $0xc,%esp
    12b8:	50                   	push   %eax
    12b9:	e8 81 26 00 00       	call   393f <close>
    12be:	83 c4 10             	add    $0x10,%esp
    for(pi = 0; pi < 4; pi++){
    12c1:	83 c3 01             	add    $0x1,%ebx
    12c4:	80 fb 74             	cmp    $0x74,%bl
    12c7:	75 c2                	jne    128b <createdelete+0x7b>
  for(i = 0; i < N; i++){
    12c9:	83 c7 01             	add    $0x1,%edi
    12cc:	83 ff 14             	cmp    $0x14,%edi
    12cf:	75 9f                	jne    1270 <createdelete+0x60>
    12d1:	bf 70 00 00 00       	mov    $0x70,%edi
    12d6:	66 90                	xchg   %ax,%ax
    12d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    12df:	00 
      name[1] = '0' + i;
    12e0:	8d 47 c0             	lea    -0x40(%edi),%eax
    12e3:	bb 04 00 00 00       	mov    $0x4,%ebx
    12e8:	88 45 c7             	mov    %al,-0x39(%ebp)
      name[0] = 'p' + i;
    12eb:	89 f8                	mov    %edi,%eax
      unlink(name);
    12ed:	83 ec 0c             	sub    $0xc,%esp
      name[0] = 'p' + i;
    12f0:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    12f3:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
    12f7:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    12fa:	56                   	push   %esi
    12fb:	e8 67 26 00 00       	call   3967 <unlink>
    for(pi = 0; pi < 4; pi++){
    1300:	83 c4 10             	add    $0x10,%esp
    1303:	83 eb 01             	sub    $0x1,%ebx
    1306:	75 e3                	jne    12eb <createdelete+0xdb>
  for(i = 0; i < N; i++){
    1308:	83 c7 01             	add    $0x1,%edi
    130b:	89 f8                	mov    %edi,%eax
    130d:	3c 84                	cmp    $0x84,%al
    130f:	75 cf                	jne    12e0 <createdelete+0xd0>
  printf(1, "createdelete ok\n");
    1311:	83 ec 08             	sub    $0x8,%esp
    1314:	68 f3 42 00 00       	push   $0x42f3
    1319:	6a 01                	push   $0x1
    131b:	e8 60 27 00 00       	call   3a80 <printf>
}
    1320:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1323:	5b                   	pop    %ebx
    1324:	5e                   	pop    %esi
    1325:	5f                   	pop    %edi
    1326:	5d                   	pop    %ebp
    1327:	c3                   	ret
    1328:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    132f:	00 
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1330:	85 c0                	test   %eax,%eax
    1332:	78 8d                	js     12c1 <createdelete+0xb1>
        printf(1, "oops createdelete %s did exist\n", name);
    1334:	50                   	push   %eax
    1335:	56                   	push   %esi
    1336:	68 cc 4f 00 00       	push   $0x4fcc
    133b:	6a 01                	push   $0x1
    133d:	e8 3e 27 00 00       	call   3a80 <printf>
        exit();
    1342:	e8 d0 25 00 00       	call   3917 <exit>
    1347:	90                   	nop
    1348:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    134f:	00 
      name[0] = 'p' + pi;
    1350:	8d 46 70             	lea    0x70(%esi),%eax
      name[2] = '\0';
    1353:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    1357:	8d 75 c8             	lea    -0x38(%ebp),%esi
      name[0] = 'p' + pi;
    135a:	88 45 c8             	mov    %al,-0x38(%ebp)
      for(i = 0; i < N; i++){
    135d:	8d 76 00             	lea    0x0(%esi),%esi
        fd = open(name, O_CREATE | O_RDWR);
    1360:	83 ec 08             	sub    $0x8,%esp
        name[1] = '0' + i;
    1363:	8d 43 30             	lea    0x30(%ebx),%eax
    1366:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    1369:	68 02 02 00 00       	push   $0x202
    136e:	56                   	push   %esi
    136f:	e8 e3 25 00 00       	call   3957 <open>
        if(fd < 0){
    1374:	83 c4 10             	add    $0x10,%esp
    1377:	85 c0                	test   %eax,%eax
    1379:	0f 88 8b 00 00 00    	js     140a <createdelete+0x1fa>
        close(fd);
    137f:	83 ec 0c             	sub    $0xc,%esp
    1382:	50                   	push   %eax
    1383:	e8 b7 25 00 00       	call   393f <close>
        if(i > 0 && (i % 2 ) == 0){
    1388:	83 c4 10             	add    $0x10,%esp
    138b:	85 db                	test   %ebx,%ebx
    138d:	74 19                	je     13a8 <createdelete+0x198>
    138f:	f6 c3 01             	test   $0x1,%bl
    1392:	74 1b                	je     13af <createdelete+0x19f>
      for(i = 0; i < N; i++){
    1394:	83 c3 01             	add    $0x1,%ebx
    1397:	83 fb 14             	cmp    $0x14,%ebx
    139a:	75 c4                	jne    1360 <createdelete+0x150>
      exit();
    139c:	e8 76 25 00 00       	call   3917 <exit>
    13a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i = 0; i < N; i++){
    13a8:	bb 01 00 00 00       	mov    $0x1,%ebx
    13ad:	eb b1                	jmp    1360 <createdelete+0x150>
          name[1] = '0' + (i / 2);
    13af:	89 d8                	mov    %ebx,%eax
          if(unlink(name) < 0){
    13b1:	83 ec 0c             	sub    $0xc,%esp
          name[1] = '0' + (i / 2);
    13b4:	d1 f8                	sar    $1,%eax
    13b6:	83 c0 30             	add    $0x30,%eax
    13b9:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    13bc:	56                   	push   %esi
    13bd:	e8 a5 25 00 00       	call   3967 <unlink>
    13c2:	83 c4 10             	add    $0x10,%esp
    13c5:	85 c0                	test   %eax,%eax
    13c7:	78 2e                	js     13f7 <createdelete+0x1e7>
      for(i = 0; i < N; i++){
    13c9:	83 c3 01             	add    $0x1,%ebx
    13cc:	eb 92                	jmp    1360 <createdelete+0x150>
        printf(1, "oops createdelete %s didn't exist\n", name);
    13ce:	83 ec 04             	sub    $0x4,%esp
    13d1:	56                   	push   %esi
    13d2:	68 a8 4f 00 00       	push   $0x4fa8
    13d7:	6a 01                	push   $0x1
    13d9:	e8 a2 26 00 00       	call   3a80 <printf>
        exit();
    13de:	e8 34 25 00 00       	call   3917 <exit>
      printf(1, "fork failed\n");
    13e3:	83 ec 08             	sub    $0x8,%esp
    13e6:	68 69 4d 00 00       	push   $0x4d69
    13eb:	6a 01                	push   $0x1
    13ed:	e8 8e 26 00 00       	call   3a80 <printf>
      exit();
    13f2:	e8 20 25 00 00       	call   3917 <exit>
            printf(1, "unlink failed\n");
    13f7:	52                   	push   %edx
    13f8:	52                   	push   %edx
    13f9:	68 e1 3e 00 00       	push   $0x3ee1
    13fe:	6a 01                	push   $0x1
    1400:	e8 7b 26 00 00       	call   3a80 <printf>
            exit();
    1405:	e8 0d 25 00 00       	call   3917 <exit>
          printf(1, "create failed\n");
    140a:	83 ec 08             	sub    $0x8,%esp
    140d:	68 2f 45 00 00       	push   $0x452f
    1412:	6a 01                	push   $0x1
    1414:	e8 67 26 00 00       	call   3a80 <printf>
          exit();
    1419:	e8 f9 24 00 00       	call   3917 <exit>
    141e:	66 90                	xchg   %ax,%ax

00001420 <unlinkread>:
{
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	56                   	push   %esi
    1424:	53                   	push   %ebx
  printf(1, "unlinkread test\n");
    1425:	83 ec 08             	sub    $0x8,%esp
    1428:	68 04 43 00 00       	push   $0x4304
    142d:	6a 01                	push   $0x1
    142f:	e8 4c 26 00 00       	call   3a80 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1434:	5b                   	pop    %ebx
    1435:	5e                   	pop    %esi
    1436:	68 02 02 00 00       	push   $0x202
    143b:	68 15 43 00 00       	push   $0x4315
    1440:	e8 12 25 00 00       	call   3957 <open>
  if(fd < 0){
    1445:	83 c4 10             	add    $0x10,%esp
    1448:	85 c0                	test   %eax,%eax
    144a:	0f 88 e6 00 00 00    	js     1536 <unlinkread+0x116>
  write(fd, "hello", 5);
    1450:	83 ec 04             	sub    $0x4,%esp
    1453:	89 c3                	mov    %eax,%ebx
    1455:	6a 05                	push   $0x5
    1457:	68 3a 43 00 00       	push   $0x433a
    145c:	50                   	push   %eax
    145d:	e8 d5 24 00 00       	call   3937 <write>
  close(fd);
    1462:	89 1c 24             	mov    %ebx,(%esp)
    1465:	e8 d5 24 00 00       	call   393f <close>
  fd = open("unlinkread", O_RDWR);
    146a:	58                   	pop    %eax
    146b:	5a                   	pop    %edx
    146c:	6a 02                	push   $0x2
    146e:	68 15 43 00 00       	push   $0x4315
    1473:	e8 df 24 00 00       	call   3957 <open>
  if(fd < 0){
    1478:	83 c4 10             	add    $0x10,%esp
  fd = open("unlinkread", O_RDWR);
    147b:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    147d:	85 c0                	test   %eax,%eax
    147f:	0f 88 10 01 00 00    	js     1595 <unlinkread+0x175>
  if(unlink("unlinkread") != 0){
    1485:	83 ec 0c             	sub    $0xc,%esp
    1488:	68 15 43 00 00       	push   $0x4315
    148d:	e8 d5 24 00 00       	call   3967 <unlink>
    1492:	83 c4 10             	add    $0x10,%esp
    1495:	85 c0                	test   %eax,%eax
    1497:	0f 85 e5 00 00 00    	jne    1582 <unlinkread+0x162>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    149d:	83 ec 08             	sub    $0x8,%esp
    14a0:	68 02 02 00 00       	push   $0x202
    14a5:	68 15 43 00 00       	push   $0x4315
    14aa:	e8 a8 24 00 00       	call   3957 <open>
  write(fd1, "yyy", 3);
    14af:	83 c4 0c             	add    $0xc,%esp
    14b2:	6a 03                	push   $0x3
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    14b4:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    14b6:	68 72 43 00 00       	push   $0x4372
    14bb:	50                   	push   %eax
    14bc:	e8 76 24 00 00       	call   3937 <write>
  close(fd1);
    14c1:	89 34 24             	mov    %esi,(%esp)
    14c4:	e8 76 24 00 00       	call   393f <close>
  if(read(fd, buf, sizeof(buf)) != 5){
    14c9:	83 c4 0c             	add    $0xc,%esp
    14cc:	68 00 20 00 00       	push   $0x2000
    14d1:	68 a0 86 00 00       	push   $0x86a0
    14d6:	53                   	push   %ebx
    14d7:	e8 53 24 00 00       	call   392f <read>
    14dc:	83 c4 10             	add    $0x10,%esp
    14df:	83 f8 05             	cmp    $0x5,%eax
    14e2:	0f 85 87 00 00 00    	jne    156f <unlinkread+0x14f>
  if(buf[0] != 'h'){
    14e8:	80 3d a0 86 00 00 68 	cmpb   $0x68,0x86a0
    14ef:	75 6b                	jne    155c <unlinkread+0x13c>
  if(write(fd, buf, 10) != 10){
    14f1:	83 ec 04             	sub    $0x4,%esp
    14f4:	6a 0a                	push   $0xa
    14f6:	68 a0 86 00 00       	push   $0x86a0
    14fb:	53                   	push   %ebx
    14fc:	e8 36 24 00 00       	call   3937 <write>
    1501:	83 c4 10             	add    $0x10,%esp
    1504:	83 f8 0a             	cmp    $0xa,%eax
    1507:	75 40                	jne    1549 <unlinkread+0x129>
  close(fd);
    1509:	83 ec 0c             	sub    $0xc,%esp
    150c:	53                   	push   %ebx
    150d:	e8 2d 24 00 00       	call   393f <close>
  unlink("unlinkread");
    1512:	c7 04 24 15 43 00 00 	movl   $0x4315,(%esp)
    1519:	e8 49 24 00 00       	call   3967 <unlink>
  printf(1, "unlinkread ok\n");
    151e:	58                   	pop    %eax
    151f:	5a                   	pop    %edx
    1520:	68 bd 43 00 00       	push   $0x43bd
    1525:	6a 01                	push   $0x1
    1527:	e8 54 25 00 00       	call   3a80 <printf>
}
    152c:	83 c4 10             	add    $0x10,%esp
    152f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1532:	5b                   	pop    %ebx
    1533:	5e                   	pop    %esi
    1534:	5d                   	pop    %ebp
    1535:	c3                   	ret
    printf(1, "create unlinkread failed\n");
    1536:	51                   	push   %ecx
    1537:	51                   	push   %ecx
    1538:	68 20 43 00 00       	push   $0x4320
    153d:	6a 01                	push   $0x1
    153f:	e8 3c 25 00 00       	call   3a80 <printf>
    exit();
    1544:	e8 ce 23 00 00       	call   3917 <exit>
    printf(1, "unlinkread write failed\n");
    1549:	51                   	push   %ecx
    154a:	51                   	push   %ecx
    154b:	68 a4 43 00 00       	push   $0x43a4
    1550:	6a 01                	push   $0x1
    1552:	e8 29 25 00 00       	call   3a80 <printf>
    exit();
    1557:	e8 bb 23 00 00       	call   3917 <exit>
    printf(1, "unlinkread wrong data\n");
    155c:	53                   	push   %ebx
    155d:	53                   	push   %ebx
    155e:	68 8d 43 00 00       	push   $0x438d
    1563:	6a 01                	push   $0x1
    1565:	e8 16 25 00 00       	call   3a80 <printf>
    exit();
    156a:	e8 a8 23 00 00       	call   3917 <exit>
    printf(1, "unlinkread read failed");
    156f:	56                   	push   %esi
    1570:	56                   	push   %esi
    1571:	68 76 43 00 00       	push   $0x4376
    1576:	6a 01                	push   $0x1
    1578:	e8 03 25 00 00       	call   3a80 <printf>
    exit();
    157d:	e8 95 23 00 00       	call   3917 <exit>
    printf(1, "unlink unlinkread failed\n");
    1582:	50                   	push   %eax
    1583:	50                   	push   %eax
    1584:	68 58 43 00 00       	push   $0x4358
    1589:	6a 01                	push   $0x1
    158b:	e8 f0 24 00 00       	call   3a80 <printf>
    exit();
    1590:	e8 82 23 00 00       	call   3917 <exit>
    printf(1, "open unlinkread failed\n");
    1595:	50                   	push   %eax
    1596:	50                   	push   %eax
    1597:	68 40 43 00 00       	push   $0x4340
    159c:	6a 01                	push   $0x1
    159e:	e8 dd 24 00 00       	call   3a80 <printf>
    exit();
    15a3:	e8 6f 23 00 00       	call   3917 <exit>
    15a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    15af:	00 

000015b0 <linktest>:
{
    15b0:	55                   	push   %ebp
    15b1:	89 e5                	mov    %esp,%ebp
    15b3:	53                   	push   %ebx
    15b4:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "linktest\n");
    15b7:	68 cc 43 00 00       	push   $0x43cc
    15bc:	6a 01                	push   $0x1
    15be:	e8 bd 24 00 00       	call   3a80 <printf>
  unlink("lf1");
    15c3:	c7 04 24 d6 43 00 00 	movl   $0x43d6,(%esp)
    15ca:	e8 98 23 00 00       	call   3967 <unlink>
  unlink("lf2");
    15cf:	c7 04 24 da 43 00 00 	movl   $0x43da,(%esp)
    15d6:	e8 8c 23 00 00       	call   3967 <unlink>
  fd = open("lf1", O_CREATE|O_RDWR);
    15db:	58                   	pop    %eax
    15dc:	5a                   	pop    %edx
    15dd:	68 02 02 00 00       	push   $0x202
    15e2:	68 d6 43 00 00       	push   $0x43d6
    15e7:	e8 6b 23 00 00       	call   3957 <open>
  if(fd < 0){
    15ec:	83 c4 10             	add    $0x10,%esp
    15ef:	85 c0                	test   %eax,%eax
    15f1:	0f 88 1e 01 00 00    	js     1715 <linktest+0x165>
  if(write(fd, "hello", 5) != 5){
    15f7:	83 ec 04             	sub    $0x4,%esp
    15fa:	89 c3                	mov    %eax,%ebx
    15fc:	6a 05                	push   $0x5
    15fe:	68 3a 43 00 00       	push   $0x433a
    1603:	50                   	push   %eax
    1604:	e8 2e 23 00 00       	call   3937 <write>
    1609:	83 c4 10             	add    $0x10,%esp
    160c:	83 f8 05             	cmp    $0x5,%eax
    160f:	0f 85 98 01 00 00    	jne    17ad <linktest+0x1fd>
  close(fd);
    1615:	83 ec 0c             	sub    $0xc,%esp
    1618:	53                   	push   %ebx
    1619:	e8 21 23 00 00       	call   393f <close>
  if(link("lf1", "lf2") < 0){
    161e:	5b                   	pop    %ebx
    161f:	58                   	pop    %eax
    1620:	68 da 43 00 00       	push   $0x43da
    1625:	68 d6 43 00 00       	push   $0x43d6
    162a:	e8 48 23 00 00       	call   3977 <link>
    162f:	83 c4 10             	add    $0x10,%esp
    1632:	85 c0                	test   %eax,%eax
    1634:	0f 88 60 01 00 00    	js     179a <linktest+0x1ea>
  unlink("lf1");
    163a:	83 ec 0c             	sub    $0xc,%esp
    163d:	68 d6 43 00 00       	push   $0x43d6
    1642:	e8 20 23 00 00       	call   3967 <unlink>
  if(open("lf1", 0) >= 0){
    1647:	58                   	pop    %eax
    1648:	5a                   	pop    %edx
    1649:	6a 00                	push   $0x0
    164b:	68 d6 43 00 00       	push   $0x43d6
    1650:	e8 02 23 00 00       	call   3957 <open>
    1655:	83 c4 10             	add    $0x10,%esp
    1658:	85 c0                	test   %eax,%eax
    165a:	0f 89 27 01 00 00    	jns    1787 <linktest+0x1d7>
  fd = open("lf2", 0);
    1660:	83 ec 08             	sub    $0x8,%esp
    1663:	6a 00                	push   $0x0
    1665:	68 da 43 00 00       	push   $0x43da
    166a:	e8 e8 22 00 00       	call   3957 <open>
  if(fd < 0){
    166f:	83 c4 10             	add    $0x10,%esp
  fd = open("lf2", 0);
    1672:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1674:	85 c0                	test   %eax,%eax
    1676:	0f 88 f8 00 00 00    	js     1774 <linktest+0x1c4>
  if(read(fd, buf, sizeof(buf)) != 5){
    167c:	83 ec 04             	sub    $0x4,%esp
    167f:	68 00 20 00 00       	push   $0x2000
    1684:	68 a0 86 00 00       	push   $0x86a0
    1689:	50                   	push   %eax
    168a:	e8 a0 22 00 00       	call   392f <read>
    168f:	83 c4 10             	add    $0x10,%esp
    1692:	83 f8 05             	cmp    $0x5,%eax
    1695:	0f 85 c6 00 00 00    	jne    1761 <linktest+0x1b1>
  close(fd);
    169b:	83 ec 0c             	sub    $0xc,%esp
    169e:	53                   	push   %ebx
    169f:	e8 9b 22 00 00       	call   393f <close>
  if(link("lf2", "lf2") >= 0){
    16a4:	58                   	pop    %eax
    16a5:	5a                   	pop    %edx
    16a6:	68 da 43 00 00       	push   $0x43da
    16ab:	68 da 43 00 00       	push   $0x43da
    16b0:	e8 c2 22 00 00       	call   3977 <link>
    16b5:	83 c4 10             	add    $0x10,%esp
    16b8:	85 c0                	test   %eax,%eax
    16ba:	0f 89 8e 00 00 00    	jns    174e <linktest+0x19e>
  unlink("lf2");
    16c0:	83 ec 0c             	sub    $0xc,%esp
    16c3:	68 da 43 00 00       	push   $0x43da
    16c8:	e8 9a 22 00 00       	call   3967 <unlink>
  if(link("lf2", "lf1") >= 0){
    16cd:	59                   	pop    %ecx
    16ce:	5b                   	pop    %ebx
    16cf:	68 d6 43 00 00       	push   $0x43d6
    16d4:	68 da 43 00 00       	push   $0x43da
    16d9:	e8 99 22 00 00       	call   3977 <link>
    16de:	83 c4 10             	add    $0x10,%esp
    16e1:	85 c0                	test   %eax,%eax
    16e3:	79 56                	jns    173b <linktest+0x18b>
  if(link(".", "lf1") >= 0){
    16e5:	83 ec 08             	sub    $0x8,%esp
    16e8:	68 d6 43 00 00       	push   $0x43d6
    16ed:	68 9e 46 00 00       	push   $0x469e
    16f2:	e8 80 22 00 00       	call   3977 <link>
    16f7:	83 c4 10             	add    $0x10,%esp
    16fa:	85 c0                	test   %eax,%eax
    16fc:	79 2a                	jns    1728 <linktest+0x178>
  printf(1, "linktest ok\n");
    16fe:	83 ec 08             	sub    $0x8,%esp
    1701:	68 74 44 00 00       	push   $0x4474
    1706:	6a 01                	push   $0x1
    1708:	e8 73 23 00 00       	call   3a80 <printf>
}
    170d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1710:	83 c4 10             	add    $0x10,%esp
    1713:	c9                   	leave
    1714:	c3                   	ret
    printf(1, "create lf1 failed\n");
    1715:	50                   	push   %eax
    1716:	50                   	push   %eax
    1717:	68 de 43 00 00       	push   $0x43de
    171c:	6a 01                	push   $0x1
    171e:	e8 5d 23 00 00       	call   3a80 <printf>
    exit();
    1723:	e8 ef 21 00 00       	call   3917 <exit>
    printf(1, "link . lf1 succeeded! oops\n");
    1728:	50                   	push   %eax
    1729:	50                   	push   %eax
    172a:	68 58 44 00 00       	push   $0x4458
    172f:	6a 01                	push   $0x1
    1731:	e8 4a 23 00 00       	call   3a80 <printf>
    exit();
    1736:	e8 dc 21 00 00       	call   3917 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    173b:	52                   	push   %edx
    173c:	52                   	push   %edx
    173d:	68 14 50 00 00       	push   $0x5014
    1742:	6a 01                	push   $0x1
    1744:	e8 37 23 00 00       	call   3a80 <printf>
    exit();
    1749:	e8 c9 21 00 00       	call   3917 <exit>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    174e:	50                   	push   %eax
    174f:	50                   	push   %eax
    1750:	68 3a 44 00 00       	push   $0x443a
    1755:	6a 01                	push   $0x1
    1757:	e8 24 23 00 00       	call   3a80 <printf>
    exit();
    175c:	e8 b6 21 00 00       	call   3917 <exit>
    printf(1, "read lf2 failed\n");
    1761:	51                   	push   %ecx
    1762:	51                   	push   %ecx
    1763:	68 29 44 00 00       	push   $0x4429
    1768:	6a 01                	push   $0x1
    176a:	e8 11 23 00 00       	call   3a80 <printf>
    exit();
    176f:	e8 a3 21 00 00       	call   3917 <exit>
    printf(1, "open lf2 failed\n");
    1774:	53                   	push   %ebx
    1775:	53                   	push   %ebx
    1776:	68 18 44 00 00       	push   $0x4418
    177b:	6a 01                	push   $0x1
    177d:	e8 fe 22 00 00       	call   3a80 <printf>
    exit();
    1782:	e8 90 21 00 00       	call   3917 <exit>
    printf(1, "unlinked lf1 but it is still there!\n");
    1787:	50                   	push   %eax
    1788:	50                   	push   %eax
    1789:	68 ec 4f 00 00       	push   $0x4fec
    178e:	6a 01                	push   $0x1
    1790:	e8 eb 22 00 00       	call   3a80 <printf>
    exit();
    1795:	e8 7d 21 00 00       	call   3917 <exit>
    printf(1, "link lf1 lf2 failed\n");
    179a:	51                   	push   %ecx
    179b:	51                   	push   %ecx
    179c:	68 03 44 00 00       	push   $0x4403
    17a1:	6a 01                	push   $0x1
    17a3:	e8 d8 22 00 00       	call   3a80 <printf>
    exit();
    17a8:	e8 6a 21 00 00       	call   3917 <exit>
    printf(1, "write lf1 failed\n");
    17ad:	50                   	push   %eax
    17ae:	50                   	push   %eax
    17af:	68 f1 43 00 00       	push   $0x43f1
    17b4:	6a 01                	push   $0x1
    17b6:	e8 c5 22 00 00       	call   3a80 <printf>
    exit();
    17bb:	e8 57 21 00 00       	call   3917 <exit>

000017c0 <concreate>:
{
    17c0:	55                   	push   %ebp
    17c1:	89 e5                	mov    %esp,%ebp
    17c3:	57                   	push   %edi
    17c4:	56                   	push   %esi
  for(i = 0; i < 40; i++){
    17c5:	31 f6                	xor    %esi,%esi
{
    17c7:	53                   	push   %ebx
    17c8:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    17cb:	83 ec 64             	sub    $0x64,%esp
  printf(1, "concreate test\n");
    17ce:	68 81 44 00 00       	push   $0x4481
    17d3:	6a 01                	push   $0x1
    17d5:	e8 a6 22 00 00       	call   3a80 <printf>
  file[0] = 'C';
    17da:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    17de:	83 c4 10             	add    $0x10,%esp
    17e1:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
  for(i = 0; i < 40; i++){
    17e5:	eb 4c                	jmp    1833 <concreate+0x73>
    17e7:	90                   	nop
    17e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    17ef:	00 
    if(pid && (i % 3) == 1){
    17f0:	69 c6 ab aa aa aa    	imul   $0xaaaaaaab,%esi,%eax
    17f6:	3d ab aa aa aa       	cmp    $0xaaaaaaab,%eax
    17fb:	0f 83 8f 00 00 00    	jae    1890 <concreate+0xd0>
      fd = open(file, O_CREATE | O_RDWR);
    1801:	83 ec 08             	sub    $0x8,%esp
    1804:	68 02 02 00 00       	push   $0x202
    1809:	53                   	push   %ebx
    180a:	e8 48 21 00 00       	call   3957 <open>
      if(fd < 0){
    180f:	83 c4 10             	add    $0x10,%esp
    1812:	85 c0                	test   %eax,%eax
    1814:	78 63                	js     1879 <concreate+0xb9>
      close(fd);
    1816:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 40; i++){
    1819:	83 c6 01             	add    $0x1,%esi
      close(fd);
    181c:	50                   	push   %eax
    181d:	e8 1d 21 00 00       	call   393f <close>
    1822:	83 c4 10             	add    $0x10,%esp
      wait();
    1825:	e8 f5 20 00 00       	call   391f <wait>
  for(i = 0; i < 40; i++){
    182a:	83 fe 28             	cmp    $0x28,%esi
    182d:	0f 84 8d 00 00 00    	je     18c0 <concreate+0x100>
    unlink(file);
    1833:	83 ec 0c             	sub    $0xc,%esp
    file[1] = '0' + i;
    1836:	8d 46 30             	lea    0x30(%esi),%eax
    1839:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    183c:	53                   	push   %ebx
    183d:	e8 25 21 00 00       	call   3967 <unlink>
    pid = fork();
    1842:	e8 c8 20 00 00       	call   390f <fork>
    if(pid && (i % 3) == 1){
    1847:	83 c4 10             	add    $0x10,%esp
    184a:	85 c0                	test   %eax,%eax
    184c:	75 a2                	jne    17f0 <concreate+0x30>
      link("C0", file);
    184e:	69 f6 cd cc cc cc    	imul   $0xcccccccd,%esi,%esi
    } else if(pid == 0 && (i % 5) == 1){
    1854:	81 fe cd cc cc cc    	cmp    $0xcccccccd,%esi
    185a:	0f 83 e0 00 00 00    	jae    1940 <concreate+0x180>
      fd = open(file, O_CREATE | O_RDWR);
    1860:	83 ec 08             	sub    $0x8,%esp
    1863:	68 02 02 00 00       	push   $0x202
    1868:	53                   	push   %ebx
    1869:	e8 e9 20 00 00       	call   3957 <open>
      if(fd < 0){
    186e:	83 c4 10             	add    $0x10,%esp
    1871:	85 c0                	test   %eax,%eax
    1873:	0f 89 fa 01 00 00    	jns    1a73 <concreate+0x2b3>
        printf(1, "concreate create %s failed\n", file);
    1879:	83 ec 04             	sub    $0x4,%esp
    187c:	53                   	push   %ebx
    187d:	68 94 44 00 00       	push   $0x4494
    1882:	6a 01                	push   $0x1
    1884:	e8 f7 21 00 00       	call   3a80 <printf>
        exit();
    1889:	e8 89 20 00 00       	call   3917 <exit>
    188e:	66 90                	xchg   %ax,%ax
      link("C0", file);
    1890:	83 ec 08             	sub    $0x8,%esp
  for(i = 0; i < 40; i++){
    1893:	83 c6 01             	add    $0x1,%esi
      link("C0", file);
    1896:	53                   	push   %ebx
    1897:	68 91 44 00 00       	push   $0x4491
    189c:	e8 d6 20 00 00       	call   3977 <link>
    18a1:	83 c4 10             	add    $0x10,%esp
      wait();
    18a4:	e8 76 20 00 00       	call   391f <wait>
  for(i = 0; i < 40; i++){
    18a9:	83 fe 28             	cmp    $0x28,%esi
    18ac:	0f 85 81 ff ff ff    	jne    1833 <concreate+0x73>
    18b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    18b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    18bf:	00 
  memset(fa, 0, sizeof(fa));
    18c0:	83 ec 04             	sub    $0x4,%esp
    18c3:	8d 45 c0             	lea    -0x40(%ebp),%eax
    18c6:	6a 28                	push   $0x28
    18c8:	6a 00                	push   $0x0
    18ca:	50                   	push   %eax
    18cb:	e8 b0 1e 00 00       	call   3780 <memset>
  fd = open(".", 0);
    18d0:	5e                   	pop    %esi
    18d1:	5f                   	pop    %edi
    18d2:	6a 00                	push   $0x0
    18d4:	68 9e 46 00 00       	push   $0x469e
    18d9:	8d 7d b0             	lea    -0x50(%ebp),%edi
    18dc:	e8 76 20 00 00       	call   3957 <open>
  while(read(fd, &de, sizeof(de)) > 0){
    18e1:	83 c4 10             	add    $0x10,%esp
  n = 0;
    18e4:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
  fd = open(".", 0);
    18eb:	89 c6                	mov    %eax,%esi
  while(read(fd, &de, sizeof(de)) > 0){
    18ed:	8d 76 00             	lea    0x0(%esi),%esi
    18f0:	83 ec 04             	sub    $0x4,%esp
    18f3:	6a 10                	push   $0x10
    18f5:	57                   	push   %edi
    18f6:	56                   	push   %esi
    18f7:	e8 33 20 00 00       	call   392f <read>
    18fc:	83 c4 10             	add    $0x10,%esp
    18ff:	85 c0                	test   %eax,%eax
    1901:	7e 5d                	jle    1960 <concreate+0x1a0>
    if(de.inum == 0)
    1903:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1908:	74 e6                	je     18f0 <concreate+0x130>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    190a:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    190e:	75 e0                	jne    18f0 <concreate+0x130>
    1910:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    1914:	75 da                	jne    18f0 <concreate+0x130>
      i = de.name[1] - '0';
    1916:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    191a:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    191d:	83 f8 27             	cmp    $0x27,%eax
    1920:	0f 87 5e 01 00 00    	ja     1a84 <concreate+0x2c4>
      if(fa[i]){
    1926:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    192b:	0f 85 7e 01 00 00    	jne    1aaf <concreate+0x2ef>
      n++;
    1931:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
      fa[i] = 1;
    1935:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    193a:	eb b4                	jmp    18f0 <concreate+0x130>
    193c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      link("C0", file);
    1940:	83 ec 08             	sub    $0x8,%esp
    1943:	53                   	push   %ebx
    1944:	68 91 44 00 00       	push   $0x4491
    1949:	e8 29 20 00 00       	call   3977 <link>
    194e:	83 c4 10             	add    $0x10,%esp
      exit();
    1951:	e8 c1 1f 00 00       	call   3917 <exit>
    1956:	66 90                	xchg   %ax,%ax
    1958:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    195f:	00 
  close(fd);
    1960:	83 ec 0c             	sub    $0xc,%esp
    1963:	56                   	push   %esi
    1964:	e8 d6 1f 00 00       	call   393f <close>
  if(n != 40){
    1969:	83 c4 10             	add    $0x10,%esp
    196c:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    1970:	0f 85 26 01 00 00    	jne    1a9c <concreate+0x2dc>
  for(i = 0; i < 40; i++){
    1976:	31 f6                	xor    %esi,%esi
    1978:	eb 48                	jmp    19c2 <concreate+0x202>
    197a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
       ((i % 3) == 1 && pid != 0)){
    1980:	83 f8 01             	cmp    $0x1,%eax
    1983:	75 04                	jne    1989 <concreate+0x1c9>
    1985:	85 ff                	test   %edi,%edi
    1987:	75 68                	jne    19f1 <concreate+0x231>
      unlink(file);
    1989:	83 ec 0c             	sub    $0xc,%esp
    198c:	53                   	push   %ebx
    198d:	e8 d5 1f 00 00       	call   3967 <unlink>
      unlink(file);
    1992:	89 1c 24             	mov    %ebx,(%esp)
    1995:	e8 cd 1f 00 00       	call   3967 <unlink>
      unlink(file);
    199a:	89 1c 24             	mov    %ebx,(%esp)
    199d:	e8 c5 1f 00 00       	call   3967 <unlink>
      unlink(file);
    19a2:	89 1c 24             	mov    %ebx,(%esp)
    19a5:	e8 bd 1f 00 00       	call   3967 <unlink>
    19aa:	83 c4 10             	add    $0x10,%esp
    if(pid == 0)
    19ad:	85 ff                	test   %edi,%edi
    19af:	74 a0                	je     1951 <concreate+0x191>
      wait();
    19b1:	e8 69 1f 00 00       	call   391f <wait>
  for(i = 0; i < 40; i++){
    19b6:	83 c6 01             	add    $0x1,%esi
    19b9:	83 fe 28             	cmp    $0x28,%esi
    19bc:	0f 84 86 00 00 00    	je     1a48 <concreate+0x288>
    file[1] = '0' + i;
    19c2:	8d 46 30             	lea    0x30(%esi),%eax
    19c5:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork();
    19c8:	e8 42 1f 00 00       	call   390f <fork>
    19cd:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    19cf:	85 c0                	test   %eax,%eax
    19d1:	0f 88 88 00 00 00    	js     1a5f <concreate+0x29f>
    if(((i % 3) == 0 && pid == 0) ||
    19d7:	b8 ab aa aa aa       	mov    $0xaaaaaaab,%eax
    19dc:	f7 e6                	mul    %esi
    19de:	89 d0                	mov    %edx,%eax
    19e0:	83 e2 fe             	and    $0xfffffffe,%edx
    19e3:	d1 e8                	shr    $1,%eax
    19e5:	01 c2                	add    %eax,%edx
    19e7:	89 f0                	mov    %esi,%eax
    19e9:	29 d0                	sub    %edx,%eax
    19eb:	89 c1                	mov    %eax,%ecx
    19ed:	09 f9                	or     %edi,%ecx
    19ef:	75 8f                	jne    1980 <concreate+0x1c0>
      close(open(file, 0));
    19f1:	83 ec 08             	sub    $0x8,%esp
    19f4:	6a 00                	push   $0x0
    19f6:	53                   	push   %ebx
    19f7:	e8 5b 1f 00 00       	call   3957 <open>
    19fc:	89 04 24             	mov    %eax,(%esp)
    19ff:	e8 3b 1f 00 00       	call   393f <close>
      close(open(file, 0));
    1a04:	58                   	pop    %eax
    1a05:	5a                   	pop    %edx
    1a06:	6a 00                	push   $0x0
    1a08:	53                   	push   %ebx
    1a09:	e8 49 1f 00 00       	call   3957 <open>
    1a0e:	89 04 24             	mov    %eax,(%esp)
    1a11:	e8 29 1f 00 00       	call   393f <close>
      close(open(file, 0));
    1a16:	59                   	pop    %ecx
    1a17:	58                   	pop    %eax
    1a18:	6a 00                	push   $0x0
    1a1a:	53                   	push   %ebx
    1a1b:	e8 37 1f 00 00       	call   3957 <open>
    1a20:	89 04 24             	mov    %eax,(%esp)
    1a23:	e8 17 1f 00 00       	call   393f <close>
      close(open(file, 0));
    1a28:	58                   	pop    %eax
    1a29:	5a                   	pop    %edx
    1a2a:	6a 00                	push   $0x0
    1a2c:	53                   	push   %ebx
    1a2d:	e8 25 1f 00 00       	call   3957 <open>
    1a32:	89 04 24             	mov    %eax,(%esp)
    1a35:	e8 05 1f 00 00       	call   393f <close>
    1a3a:	83 c4 10             	add    $0x10,%esp
    1a3d:	e9 6b ff ff ff       	jmp    19ad <concreate+0x1ed>
    1a42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  printf(1, "concreate ok\n");
    1a48:	83 ec 08             	sub    $0x8,%esp
    1a4b:	68 e6 44 00 00       	push   $0x44e6
    1a50:	6a 01                	push   $0x1
    1a52:	e8 29 20 00 00       	call   3a80 <printf>
}
    1a57:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1a5a:	5b                   	pop    %ebx
    1a5b:	5e                   	pop    %esi
    1a5c:	5f                   	pop    %edi
    1a5d:	5d                   	pop    %ebp
    1a5e:	c3                   	ret
      printf(1, "fork failed\n");
    1a5f:	83 ec 08             	sub    $0x8,%esp
    1a62:	68 69 4d 00 00       	push   $0x4d69
    1a67:	6a 01                	push   $0x1
    1a69:	e8 12 20 00 00       	call   3a80 <printf>
      exit();
    1a6e:	e8 a4 1e 00 00       	call   3917 <exit>
      close(fd);
    1a73:	83 ec 0c             	sub    $0xc,%esp
    1a76:	50                   	push   %eax
    1a77:	e8 c3 1e 00 00       	call   393f <close>
    1a7c:	83 c4 10             	add    $0x10,%esp
    1a7f:	e9 cd fe ff ff       	jmp    1951 <concreate+0x191>
        printf(1, "concreate weird file %s\n", de.name);
    1a84:	83 ec 04             	sub    $0x4,%esp
    1a87:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1a8a:	50                   	push   %eax
    1a8b:	68 b0 44 00 00       	push   $0x44b0
    1a90:	6a 01                	push   $0x1
    1a92:	e8 e9 1f 00 00       	call   3a80 <printf>
        exit();
    1a97:	e8 7b 1e 00 00       	call   3917 <exit>
    printf(1, "concreate not enough files in directory listing\n");
    1a9c:	51                   	push   %ecx
    1a9d:	51                   	push   %ecx
    1a9e:	68 38 50 00 00       	push   $0x5038
    1aa3:	6a 01                	push   $0x1
    1aa5:	e8 d6 1f 00 00       	call   3a80 <printf>
    exit();
    1aaa:	e8 68 1e 00 00       	call   3917 <exit>
        printf(1, "concreate duplicate file %s\n", de.name);
    1aaf:	83 ec 04             	sub    $0x4,%esp
    1ab2:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1ab5:	50                   	push   %eax
    1ab6:	68 c9 44 00 00       	push   $0x44c9
    1abb:	6a 01                	push   $0x1
    1abd:	e8 be 1f 00 00       	call   3a80 <printf>
        exit();
    1ac2:	e8 50 1e 00 00       	call   3917 <exit>
    1ac7:	90                   	nop
    1ac8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1acf:	00 

00001ad0 <linkunlink>:
{
    1ad0:	55                   	push   %ebp
    1ad1:	89 e5                	mov    %esp,%ebp
    1ad3:	57                   	push   %edi
    1ad4:	56                   	push   %esi
    1ad5:	53                   	push   %ebx
    1ad6:	83 ec 24             	sub    $0x24,%esp
  printf(1, "linkunlink test\n");
    1ad9:	68 f4 44 00 00       	push   $0x44f4
    1ade:	6a 01                	push   $0x1
    1ae0:	e8 9b 1f 00 00       	call   3a80 <printf>
  unlink("x");
    1ae5:	c7 04 24 81 47 00 00 	movl   $0x4781,(%esp)
    1aec:	e8 76 1e 00 00       	call   3967 <unlink>
  pid = fork();
    1af1:	e8 19 1e 00 00       	call   390f <fork>
  if(pid < 0){
    1af6:	83 c4 10             	add    $0x10,%esp
  pid = fork();
    1af9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    1afc:	85 c0                	test   %eax,%eax
    1afe:	0f 88 b6 00 00 00    	js     1bba <linkunlink+0xea>
  unsigned int x = (pid ? 1 : 97);
    1b04:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1b08:	bb 64 00 00 00       	mov    $0x64,%ebx
    if((x % 3) == 0){
    1b0d:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  unsigned int x = (pid ? 1 : 97);
    1b12:	19 ff                	sbb    %edi,%edi
    1b14:	83 e7 60             	and    $0x60,%edi
    1b17:	83 c7 01             	add    $0x1,%edi
  for(i = 0; i < 100; i++){
    1b1a:	eb 1e                	jmp    1b3a <linkunlink+0x6a>
    1b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if((x % 3) == 1){
    1b20:	83 f8 01             	cmp    $0x1,%eax
    1b23:	74 7b                	je     1ba0 <linkunlink+0xd0>
      unlink("x");
    1b25:	83 ec 0c             	sub    $0xc,%esp
    1b28:	68 81 47 00 00       	push   $0x4781
    1b2d:	e8 35 1e 00 00       	call   3967 <unlink>
    1b32:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1b35:	83 eb 01             	sub    $0x1,%ebx
    1b38:	74 41                	je     1b7b <linkunlink+0xab>
    x = x * 1103515245 + 12345;
    1b3a:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    1b40:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    1b46:	89 f8                	mov    %edi,%eax
    1b48:	f7 e6                	mul    %esi
    1b4a:	89 d0                	mov    %edx,%eax
    1b4c:	83 e2 fe             	and    $0xfffffffe,%edx
    1b4f:	d1 e8                	shr    $1,%eax
    1b51:	01 c2                	add    %eax,%edx
    1b53:	89 f8                	mov    %edi,%eax
    1b55:	29 d0                	sub    %edx,%eax
    1b57:	75 c7                	jne    1b20 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    1b59:	83 ec 08             	sub    $0x8,%esp
    1b5c:	68 02 02 00 00       	push   $0x202
    1b61:	68 81 47 00 00       	push   $0x4781
    1b66:	e8 ec 1d 00 00       	call   3957 <open>
    1b6b:	89 04 24             	mov    %eax,(%esp)
    1b6e:	e8 cc 1d 00 00       	call   393f <close>
    1b73:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1b76:	83 eb 01             	sub    $0x1,%ebx
    1b79:	75 bf                	jne    1b3a <linkunlink+0x6a>
  if(pid)
    1b7b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b7e:	85 c0                	test   %eax,%eax
    1b80:	74 4b                	je     1bcd <linkunlink+0xfd>
    wait();
    1b82:	e8 98 1d 00 00       	call   391f <wait>
  printf(1, "linkunlink ok\n");
    1b87:	83 ec 08             	sub    $0x8,%esp
    1b8a:	68 09 45 00 00       	push   $0x4509
    1b8f:	6a 01                	push   $0x1
    1b91:	e8 ea 1e 00 00       	call   3a80 <printf>
}
    1b96:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1b99:	5b                   	pop    %ebx
    1b9a:	5e                   	pop    %esi
    1b9b:	5f                   	pop    %edi
    1b9c:	5d                   	pop    %ebp
    1b9d:	c3                   	ret
    1b9e:	66 90                	xchg   %ax,%ax
      link("cat", "x");
    1ba0:	83 ec 08             	sub    $0x8,%esp
    1ba3:	68 81 47 00 00       	push   $0x4781
    1ba8:	68 05 45 00 00       	push   $0x4505
    1bad:	e8 c5 1d 00 00       	call   3977 <link>
    1bb2:	83 c4 10             	add    $0x10,%esp
    1bb5:	e9 7b ff ff ff       	jmp    1b35 <linkunlink+0x65>
    printf(1, "fork failed\n");
    1bba:	52                   	push   %edx
    1bbb:	52                   	push   %edx
    1bbc:	68 69 4d 00 00       	push   $0x4d69
    1bc1:	6a 01                	push   $0x1
    1bc3:	e8 b8 1e 00 00       	call   3a80 <printf>
    exit();
    1bc8:	e8 4a 1d 00 00       	call   3917 <exit>
    exit();
    1bcd:	e8 45 1d 00 00       	call   3917 <exit>
    1bd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1bd8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1bdf:	00 

00001be0 <bigdir>:
{
    1be0:	55                   	push   %ebp
    1be1:	89 e5                	mov    %esp,%ebp
    1be3:	57                   	push   %edi
    1be4:	56                   	push   %esi
    1be5:	53                   	push   %ebx
    1be6:	83 ec 24             	sub    $0x24,%esp
  printf(1, "bigdir test\n");
    1be9:	68 18 45 00 00       	push   $0x4518
    1bee:	6a 01                	push   $0x1
    1bf0:	e8 8b 1e 00 00       	call   3a80 <printf>
  unlink("bd");
    1bf5:	c7 04 24 25 45 00 00 	movl   $0x4525,(%esp)
    1bfc:	e8 66 1d 00 00       	call   3967 <unlink>
  fd = open("bd", O_CREATE);
    1c01:	5a                   	pop    %edx
    1c02:	59                   	pop    %ecx
    1c03:	68 00 02 00 00       	push   $0x200
    1c08:	68 25 45 00 00       	push   $0x4525
    1c0d:	e8 45 1d 00 00       	call   3957 <open>
  if(fd < 0){
    1c12:	83 c4 10             	add    $0x10,%esp
    1c15:	85 c0                	test   %eax,%eax
    1c17:	0f 88 de 00 00 00    	js     1cfb <bigdir+0x11b>
  close(fd);
    1c1d:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 500; i++){
    1c20:	31 f6                	xor    %esi,%esi
    1c22:	8d 7d de             	lea    -0x22(%ebp),%edi
  close(fd);
    1c25:	50                   	push   %eax
    1c26:	e8 14 1d 00 00       	call   393f <close>
    1c2b:	83 c4 10             	add    $0x10,%esp
    1c2e:	66 90                	xchg   %ax,%ax
    name[1] = '0' + (i / 64);
    1c30:	89 f0                	mov    %esi,%eax
    if(link("bd", name) != 0){
    1c32:	83 ec 08             	sub    $0x8,%esp
    name[0] = 'x';
    1c35:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1c39:	c1 f8 06             	sar    $0x6,%eax
    name[3] = '\0';
    1c3c:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    name[1] = '0' + (i / 64);
    1c40:	83 c0 30             	add    $0x30,%eax
    1c43:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1c46:	89 f0                	mov    %esi,%eax
    1c48:	83 e0 3f             	and    $0x3f,%eax
    1c4b:	83 c0 30             	add    $0x30,%eax
    1c4e:	88 45 e0             	mov    %al,-0x20(%ebp)
    if(link("bd", name) != 0){
    1c51:	57                   	push   %edi
    1c52:	68 25 45 00 00       	push   $0x4525
    1c57:	e8 1b 1d 00 00       	call   3977 <link>
    1c5c:	83 c4 10             	add    $0x10,%esp
    1c5f:	89 c3                	mov    %eax,%ebx
    1c61:	85 c0                	test   %eax,%eax
    1c63:	75 6e                	jne    1cd3 <bigdir+0xf3>
  for(i = 0; i < 500; i++){
    1c65:	83 c6 01             	add    $0x1,%esi
    1c68:	81 fe f4 01 00 00    	cmp    $0x1f4,%esi
    1c6e:	75 c0                	jne    1c30 <bigdir+0x50>
  unlink("bd");
    1c70:	83 ec 0c             	sub    $0xc,%esp
    1c73:	68 25 45 00 00       	push   $0x4525
    1c78:	e8 ea 1c 00 00       	call   3967 <unlink>
    1c7d:	83 c4 10             	add    $0x10,%esp
    name[1] = '0' + (i / 64);
    1c80:	89 d8                	mov    %ebx,%eax
    if(unlink(name) != 0){
    1c82:	83 ec 0c             	sub    $0xc,%esp
    name[0] = 'x';
    1c85:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1c89:	c1 f8 06             	sar    $0x6,%eax
    name[3] = '\0';
    1c8c:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    name[1] = '0' + (i / 64);
    1c90:	83 c0 30             	add    $0x30,%eax
    1c93:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1c96:	89 d8                	mov    %ebx,%eax
    1c98:	83 e0 3f             	and    $0x3f,%eax
    1c9b:	83 c0 30             	add    $0x30,%eax
    1c9e:	88 45 e0             	mov    %al,-0x20(%ebp)
    if(unlink(name) != 0){
    1ca1:	57                   	push   %edi
    1ca2:	e8 c0 1c 00 00       	call   3967 <unlink>
    1ca7:	83 c4 10             	add    $0x10,%esp
    1caa:	85 c0                	test   %eax,%eax
    1cac:	75 39                	jne    1ce7 <bigdir+0x107>
  for(i = 0; i < 500; i++){
    1cae:	83 c3 01             	add    $0x1,%ebx
    1cb1:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1cb7:	75 c7                	jne    1c80 <bigdir+0xa0>
  printf(1, "bigdir ok\n");
    1cb9:	83 ec 08             	sub    $0x8,%esp
    1cbc:	68 67 45 00 00       	push   $0x4567
    1cc1:	6a 01                	push   $0x1
    1cc3:	e8 b8 1d 00 00       	call   3a80 <printf>
    1cc8:	83 c4 10             	add    $0x10,%esp
}
    1ccb:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1cce:	5b                   	pop    %ebx
    1ccf:	5e                   	pop    %esi
    1cd0:	5f                   	pop    %edi
    1cd1:	5d                   	pop    %ebp
    1cd2:	c3                   	ret
      printf(1, "bigdir link failed\n");
    1cd3:	83 ec 08             	sub    $0x8,%esp
    1cd6:	68 3e 45 00 00       	push   $0x453e
    1cdb:	6a 01                	push   $0x1
    1cdd:	e8 9e 1d 00 00       	call   3a80 <printf>
      exit();
    1ce2:	e8 30 1c 00 00       	call   3917 <exit>
      printf(1, "bigdir unlink failed");
    1ce7:	83 ec 08             	sub    $0x8,%esp
    1cea:	68 52 45 00 00       	push   $0x4552
    1cef:	6a 01                	push   $0x1
    1cf1:	e8 8a 1d 00 00       	call   3a80 <printf>
      exit();
    1cf6:	e8 1c 1c 00 00       	call   3917 <exit>
    printf(1, "bigdir create failed\n");
    1cfb:	50                   	push   %eax
    1cfc:	50                   	push   %eax
    1cfd:	68 28 45 00 00       	push   $0x4528
    1d02:	6a 01                	push   $0x1
    1d04:	e8 77 1d 00 00       	call   3a80 <printf>
    exit();
    1d09:	e8 09 1c 00 00       	call   3917 <exit>
    1d0e:	66 90                	xchg   %ax,%ax

00001d10 <subdir>:
{
    1d10:	55                   	push   %ebp
    1d11:	89 e5                	mov    %esp,%ebp
    1d13:	53                   	push   %ebx
    1d14:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "subdir test\n");
    1d17:	68 72 45 00 00       	push   $0x4572
    1d1c:	6a 01                	push   $0x1
    1d1e:	e8 5d 1d 00 00       	call   3a80 <printf>
  unlink("ff");
    1d23:	c7 04 24 fb 45 00 00 	movl   $0x45fb,(%esp)
    1d2a:	e8 38 1c 00 00       	call   3967 <unlink>
  if(mkdir("dd") != 0){
    1d2f:	c7 04 24 98 46 00 00 	movl   $0x4698,(%esp)
    1d36:	e8 44 1c 00 00       	call   397f <mkdir>
    1d3b:	83 c4 10             	add    $0x10,%esp
    1d3e:	85 c0                	test   %eax,%eax
    1d40:	0f 85 b3 05 00 00    	jne    22f9 <subdir+0x5e9>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d46:	83 ec 08             	sub    $0x8,%esp
    1d49:	68 02 02 00 00       	push   $0x202
    1d4e:	68 d1 45 00 00       	push   $0x45d1
    1d53:	e8 ff 1b 00 00       	call   3957 <open>
  if(fd < 0){
    1d58:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d5b:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1d5d:	85 c0                	test   %eax,%eax
    1d5f:	0f 88 81 05 00 00    	js     22e6 <subdir+0x5d6>
  write(fd, "ff", 2);
    1d65:	83 ec 04             	sub    $0x4,%esp
    1d68:	6a 02                	push   $0x2
    1d6a:	68 fb 45 00 00       	push   $0x45fb
    1d6f:	50                   	push   %eax
    1d70:	e8 c2 1b 00 00       	call   3937 <write>
  close(fd);
    1d75:	89 1c 24             	mov    %ebx,(%esp)
    1d78:	e8 c2 1b 00 00       	call   393f <close>
  if(unlink("dd") >= 0){
    1d7d:	c7 04 24 98 46 00 00 	movl   $0x4698,(%esp)
    1d84:	e8 de 1b 00 00       	call   3967 <unlink>
    1d89:	83 c4 10             	add    $0x10,%esp
    1d8c:	85 c0                	test   %eax,%eax
    1d8e:	0f 89 3f 05 00 00    	jns    22d3 <subdir+0x5c3>
  if(mkdir("/dd/dd") != 0){
    1d94:	83 ec 0c             	sub    $0xc,%esp
    1d97:	68 ac 45 00 00       	push   $0x45ac
    1d9c:	e8 de 1b 00 00       	call   397f <mkdir>
    1da1:	83 c4 10             	add    $0x10,%esp
    1da4:	85 c0                	test   %eax,%eax
    1da6:	0f 85 14 05 00 00    	jne    22c0 <subdir+0x5b0>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1dac:	83 ec 08             	sub    $0x8,%esp
    1daf:	68 02 02 00 00       	push   $0x202
    1db4:	68 ce 45 00 00       	push   $0x45ce
    1db9:	e8 99 1b 00 00       	call   3957 <open>
  if(fd < 0){
    1dbe:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1dc1:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1dc3:	85 c0                	test   %eax,%eax
    1dc5:	0f 88 24 04 00 00    	js     21ef <subdir+0x4df>
  write(fd, "FF", 2);
    1dcb:	83 ec 04             	sub    $0x4,%esp
    1dce:	6a 02                	push   $0x2
    1dd0:	68 ef 45 00 00       	push   $0x45ef
    1dd5:	50                   	push   %eax
    1dd6:	e8 5c 1b 00 00       	call   3937 <write>
  close(fd);
    1ddb:	89 1c 24             	mov    %ebx,(%esp)
    1dde:	e8 5c 1b 00 00       	call   393f <close>
  fd = open("dd/dd/../ff", 0);
    1de3:	58                   	pop    %eax
    1de4:	5a                   	pop    %edx
    1de5:	6a 00                	push   $0x0
    1de7:	68 f2 45 00 00       	push   $0x45f2
    1dec:	e8 66 1b 00 00       	call   3957 <open>
  if(fd < 0){
    1df1:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/dd/../ff", 0);
    1df4:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1df6:	85 c0                	test   %eax,%eax
    1df8:	0f 88 de 03 00 00    	js     21dc <subdir+0x4cc>
  cc = read(fd, buf, sizeof(buf));
    1dfe:	83 ec 04             	sub    $0x4,%esp
    1e01:	68 00 20 00 00       	push   $0x2000
    1e06:	68 a0 86 00 00       	push   $0x86a0
    1e0b:	50                   	push   %eax
    1e0c:	e8 1e 1b 00 00       	call   392f <read>
  if(cc != 2 || buf[0] != 'f'){
    1e11:	83 c4 10             	add    $0x10,%esp
    1e14:	83 f8 02             	cmp    $0x2,%eax
    1e17:	0f 85 3a 03 00 00    	jne    2157 <subdir+0x447>
    1e1d:	80 3d a0 86 00 00 66 	cmpb   $0x66,0x86a0
    1e24:	0f 85 2d 03 00 00    	jne    2157 <subdir+0x447>
  close(fd);
    1e2a:	83 ec 0c             	sub    $0xc,%esp
    1e2d:	53                   	push   %ebx
    1e2e:	e8 0c 1b 00 00       	call   393f <close>
  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1e33:	59                   	pop    %ecx
    1e34:	5b                   	pop    %ebx
    1e35:	68 32 46 00 00       	push   $0x4632
    1e3a:	68 ce 45 00 00       	push   $0x45ce
    1e3f:	e8 33 1b 00 00       	call   3977 <link>
    1e44:	83 c4 10             	add    $0x10,%esp
    1e47:	85 c0                	test   %eax,%eax
    1e49:	0f 85 c6 03 00 00    	jne    2215 <subdir+0x505>
  if(unlink("dd/dd/ff") != 0){
    1e4f:	83 ec 0c             	sub    $0xc,%esp
    1e52:	68 ce 45 00 00       	push   $0x45ce
    1e57:	e8 0b 1b 00 00       	call   3967 <unlink>
    1e5c:	83 c4 10             	add    $0x10,%esp
    1e5f:	85 c0                	test   %eax,%eax
    1e61:	0f 85 16 03 00 00    	jne    217d <subdir+0x46d>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1e67:	83 ec 08             	sub    $0x8,%esp
    1e6a:	6a 00                	push   $0x0
    1e6c:	68 ce 45 00 00       	push   $0x45ce
    1e71:	e8 e1 1a 00 00       	call   3957 <open>
    1e76:	83 c4 10             	add    $0x10,%esp
    1e79:	85 c0                	test   %eax,%eax
    1e7b:	0f 89 2c 04 00 00    	jns    22ad <subdir+0x59d>
  if(chdir("dd") != 0){
    1e81:	83 ec 0c             	sub    $0xc,%esp
    1e84:	68 98 46 00 00       	push   $0x4698
    1e89:	e8 f9 1a 00 00       	call   3987 <chdir>
    1e8e:	83 c4 10             	add    $0x10,%esp
    1e91:	85 c0                	test   %eax,%eax
    1e93:	0f 85 01 04 00 00    	jne    229a <subdir+0x58a>
  if(chdir("dd/../../dd") != 0){
    1e99:	83 ec 0c             	sub    $0xc,%esp
    1e9c:	68 66 46 00 00       	push   $0x4666
    1ea1:	e8 e1 1a 00 00       	call   3987 <chdir>
    1ea6:	83 c4 10             	add    $0x10,%esp
    1ea9:	85 c0                	test   %eax,%eax
    1eab:	0f 85 b9 02 00 00    	jne    216a <subdir+0x45a>
  if(chdir("dd/../../../dd") != 0){
    1eb1:	83 ec 0c             	sub    $0xc,%esp
    1eb4:	68 8c 46 00 00       	push   $0x468c
    1eb9:	e8 c9 1a 00 00       	call   3987 <chdir>
    1ebe:	83 c4 10             	add    $0x10,%esp
    1ec1:	85 c0                	test   %eax,%eax
    1ec3:	0f 85 a1 02 00 00    	jne    216a <subdir+0x45a>
  if(chdir("./..") != 0){
    1ec9:	83 ec 0c             	sub    $0xc,%esp
    1ecc:	68 9b 46 00 00       	push   $0x469b
    1ed1:	e8 b1 1a 00 00       	call   3987 <chdir>
    1ed6:	83 c4 10             	add    $0x10,%esp
    1ed9:	85 c0                	test   %eax,%eax
    1edb:	0f 85 21 03 00 00    	jne    2202 <subdir+0x4f2>
  fd = open("dd/dd/ffff", 0);
    1ee1:	83 ec 08             	sub    $0x8,%esp
    1ee4:	6a 00                	push   $0x0
    1ee6:	68 32 46 00 00       	push   $0x4632
    1eeb:	e8 67 1a 00 00       	call   3957 <open>
  if(fd < 0){
    1ef0:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/dd/ffff", 0);
    1ef3:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1ef5:	85 c0                	test   %eax,%eax
    1ef7:	0f 88 e0 04 00 00    	js     23dd <subdir+0x6cd>
  if(read(fd, buf, sizeof(buf)) != 2){
    1efd:	83 ec 04             	sub    $0x4,%esp
    1f00:	68 00 20 00 00       	push   $0x2000
    1f05:	68 a0 86 00 00       	push   $0x86a0
    1f0a:	50                   	push   %eax
    1f0b:	e8 1f 1a 00 00       	call   392f <read>
    1f10:	83 c4 10             	add    $0x10,%esp
    1f13:	83 f8 02             	cmp    $0x2,%eax
    1f16:	0f 85 ae 04 00 00    	jne    23ca <subdir+0x6ba>
  close(fd);
    1f1c:	83 ec 0c             	sub    $0xc,%esp
    1f1f:	53                   	push   %ebx
    1f20:	e8 1a 1a 00 00       	call   393f <close>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1f25:	58                   	pop    %eax
    1f26:	5a                   	pop    %edx
    1f27:	6a 00                	push   $0x0
    1f29:	68 ce 45 00 00       	push   $0x45ce
    1f2e:	e8 24 1a 00 00       	call   3957 <open>
    1f33:	83 c4 10             	add    $0x10,%esp
    1f36:	85 c0                	test   %eax,%eax
    1f38:	0f 89 65 02 00 00    	jns    21a3 <subdir+0x493>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1f3e:	83 ec 08             	sub    $0x8,%esp
    1f41:	68 02 02 00 00       	push   $0x202
    1f46:	68 e6 46 00 00       	push   $0x46e6
    1f4b:	e8 07 1a 00 00       	call   3957 <open>
    1f50:	83 c4 10             	add    $0x10,%esp
    1f53:	85 c0                	test   %eax,%eax
    1f55:	0f 89 35 02 00 00    	jns    2190 <subdir+0x480>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1f5b:	83 ec 08             	sub    $0x8,%esp
    1f5e:	68 02 02 00 00       	push   $0x202
    1f63:	68 0b 47 00 00       	push   $0x470b
    1f68:	e8 ea 19 00 00       	call   3957 <open>
    1f6d:	83 c4 10             	add    $0x10,%esp
    1f70:	85 c0                	test   %eax,%eax
    1f72:	0f 89 0f 03 00 00    	jns    2287 <subdir+0x577>
  if(open("dd", O_CREATE) >= 0){
    1f78:	83 ec 08             	sub    $0x8,%esp
    1f7b:	68 00 02 00 00       	push   $0x200
    1f80:	68 98 46 00 00       	push   $0x4698
    1f85:	e8 cd 19 00 00       	call   3957 <open>
    1f8a:	83 c4 10             	add    $0x10,%esp
    1f8d:	85 c0                	test   %eax,%eax
    1f8f:	0f 89 df 02 00 00    	jns    2274 <subdir+0x564>
  if(open("dd", O_RDWR) >= 0){
    1f95:	83 ec 08             	sub    $0x8,%esp
    1f98:	6a 02                	push   $0x2
    1f9a:	68 98 46 00 00       	push   $0x4698
    1f9f:	e8 b3 19 00 00       	call   3957 <open>
    1fa4:	83 c4 10             	add    $0x10,%esp
    1fa7:	85 c0                	test   %eax,%eax
    1fa9:	0f 89 b2 02 00 00    	jns    2261 <subdir+0x551>
  if(open("dd", O_WRONLY) >= 0){
    1faf:	83 ec 08             	sub    $0x8,%esp
    1fb2:	6a 01                	push   $0x1
    1fb4:	68 98 46 00 00       	push   $0x4698
    1fb9:	e8 99 19 00 00       	call   3957 <open>
    1fbe:	83 c4 10             	add    $0x10,%esp
    1fc1:	85 c0                	test   %eax,%eax
    1fc3:	0f 89 85 02 00 00    	jns    224e <subdir+0x53e>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    1fc9:	83 ec 08             	sub    $0x8,%esp
    1fcc:	68 7a 47 00 00       	push   $0x477a
    1fd1:	68 e6 46 00 00       	push   $0x46e6
    1fd6:	e8 9c 19 00 00       	call   3977 <link>
    1fdb:	83 c4 10             	add    $0x10,%esp
    1fde:	85 c0                	test   %eax,%eax
    1fe0:	0f 84 55 02 00 00    	je     223b <subdir+0x52b>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    1fe6:	83 ec 08             	sub    $0x8,%esp
    1fe9:	68 7a 47 00 00       	push   $0x477a
    1fee:	68 0b 47 00 00       	push   $0x470b
    1ff3:	e8 7f 19 00 00       	call   3977 <link>
    1ff8:	83 c4 10             	add    $0x10,%esp
    1ffb:	85 c0                	test   %eax,%eax
    1ffd:	0f 84 25 02 00 00    	je     2228 <subdir+0x518>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    2003:	83 ec 08             	sub    $0x8,%esp
    2006:	68 32 46 00 00       	push   $0x4632
    200b:	68 d1 45 00 00       	push   $0x45d1
    2010:	e8 62 19 00 00       	call   3977 <link>
    2015:	83 c4 10             	add    $0x10,%esp
    2018:	85 c0                	test   %eax,%eax
    201a:	0f 84 a9 01 00 00    	je     21c9 <subdir+0x4b9>
  if(mkdir("dd/ff/ff") == 0){
    2020:	83 ec 0c             	sub    $0xc,%esp
    2023:	68 e6 46 00 00       	push   $0x46e6
    2028:	e8 52 19 00 00       	call   397f <mkdir>
    202d:	83 c4 10             	add    $0x10,%esp
    2030:	85 c0                	test   %eax,%eax
    2032:	0f 84 7e 01 00 00    	je     21b6 <subdir+0x4a6>
  if(mkdir("dd/xx/ff") == 0){
    2038:	83 ec 0c             	sub    $0xc,%esp
    203b:	68 0b 47 00 00       	push   $0x470b
    2040:	e8 3a 19 00 00       	call   397f <mkdir>
    2045:	83 c4 10             	add    $0x10,%esp
    2048:	85 c0                	test   %eax,%eax
    204a:	0f 84 67 03 00 00    	je     23b7 <subdir+0x6a7>
  if(mkdir("dd/dd/ffff") == 0){
    2050:	83 ec 0c             	sub    $0xc,%esp
    2053:	68 32 46 00 00       	push   $0x4632
    2058:	e8 22 19 00 00       	call   397f <mkdir>
    205d:	83 c4 10             	add    $0x10,%esp
    2060:	85 c0                	test   %eax,%eax
    2062:	0f 84 3c 03 00 00    	je     23a4 <subdir+0x694>
  if(unlink("dd/xx/ff") == 0){
    2068:	83 ec 0c             	sub    $0xc,%esp
    206b:	68 0b 47 00 00       	push   $0x470b
    2070:	e8 f2 18 00 00       	call   3967 <unlink>
    2075:	83 c4 10             	add    $0x10,%esp
    2078:	85 c0                	test   %eax,%eax
    207a:	0f 84 11 03 00 00    	je     2391 <subdir+0x681>
  if(unlink("dd/ff/ff") == 0){
    2080:	83 ec 0c             	sub    $0xc,%esp
    2083:	68 e6 46 00 00       	push   $0x46e6
    2088:	e8 da 18 00 00       	call   3967 <unlink>
    208d:	83 c4 10             	add    $0x10,%esp
    2090:	85 c0                	test   %eax,%eax
    2092:	0f 84 e6 02 00 00    	je     237e <subdir+0x66e>
  if(chdir("dd/ff") == 0){
    2098:	83 ec 0c             	sub    $0xc,%esp
    209b:	68 d1 45 00 00       	push   $0x45d1
    20a0:	e8 e2 18 00 00       	call   3987 <chdir>
    20a5:	83 c4 10             	add    $0x10,%esp
    20a8:	85 c0                	test   %eax,%eax
    20aa:	0f 84 bb 02 00 00    	je     236b <subdir+0x65b>
  if(chdir("dd/xx") == 0){
    20b0:	83 ec 0c             	sub    $0xc,%esp
    20b3:	68 7d 47 00 00       	push   $0x477d
    20b8:	e8 ca 18 00 00       	call   3987 <chdir>
    20bd:	83 c4 10             	add    $0x10,%esp
    20c0:	85 c0                	test   %eax,%eax
    20c2:	0f 84 90 02 00 00    	je     2358 <subdir+0x648>
  if(unlink("dd/dd/ffff") != 0){
    20c8:	83 ec 0c             	sub    $0xc,%esp
    20cb:	68 32 46 00 00       	push   $0x4632
    20d0:	e8 92 18 00 00       	call   3967 <unlink>
    20d5:	83 c4 10             	add    $0x10,%esp
    20d8:	85 c0                	test   %eax,%eax
    20da:	0f 85 9d 00 00 00    	jne    217d <subdir+0x46d>
  if(unlink("dd/ff") != 0){
    20e0:	83 ec 0c             	sub    $0xc,%esp
    20e3:	68 d1 45 00 00       	push   $0x45d1
    20e8:	e8 7a 18 00 00       	call   3967 <unlink>
    20ed:	83 c4 10             	add    $0x10,%esp
    20f0:	85 c0                	test   %eax,%eax
    20f2:	0f 85 4d 02 00 00    	jne    2345 <subdir+0x635>
  if(unlink("dd") == 0){
    20f8:	83 ec 0c             	sub    $0xc,%esp
    20fb:	68 98 46 00 00       	push   $0x4698
    2100:	e8 62 18 00 00       	call   3967 <unlink>
    2105:	83 c4 10             	add    $0x10,%esp
    2108:	85 c0                	test   %eax,%eax
    210a:	0f 84 22 02 00 00    	je     2332 <subdir+0x622>
  if(unlink("dd/dd") < 0){
    2110:	83 ec 0c             	sub    $0xc,%esp
    2113:	68 ad 45 00 00       	push   $0x45ad
    2118:	e8 4a 18 00 00       	call   3967 <unlink>
    211d:	83 c4 10             	add    $0x10,%esp
    2120:	85 c0                	test   %eax,%eax
    2122:	0f 88 f7 01 00 00    	js     231f <subdir+0x60f>
  if(unlink("dd") < 0){
    2128:	83 ec 0c             	sub    $0xc,%esp
    212b:	68 98 46 00 00       	push   $0x4698
    2130:	e8 32 18 00 00       	call   3967 <unlink>
    2135:	83 c4 10             	add    $0x10,%esp
    2138:	85 c0                	test   %eax,%eax
    213a:	0f 88 cc 01 00 00    	js     230c <subdir+0x5fc>
  printf(1, "subdir ok\n");
    2140:	83 ec 08             	sub    $0x8,%esp
    2143:	68 7a 48 00 00       	push   $0x487a
    2148:	6a 01                	push   $0x1
    214a:	e8 31 19 00 00       	call   3a80 <printf>
}
    214f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2152:	83 c4 10             	add    $0x10,%esp
    2155:	c9                   	leave
    2156:	c3                   	ret
    printf(1, "dd/dd/../ff wrong content\n");
    2157:	50                   	push   %eax
    2158:	50                   	push   %eax
    2159:	68 17 46 00 00       	push   $0x4617
    215e:	6a 01                	push   $0x1
    2160:	e8 1b 19 00 00       	call   3a80 <printf>
    exit();
    2165:	e8 ad 17 00 00       	call   3917 <exit>
    printf(1, "chdir dd/../../dd failed\n");
    216a:	50                   	push   %eax
    216b:	50                   	push   %eax
    216c:	68 72 46 00 00       	push   $0x4672
    2171:	6a 01                	push   $0x1
    2173:	e8 08 19 00 00       	call   3a80 <printf>
    exit();
    2178:	e8 9a 17 00 00       	call   3917 <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    217d:	50                   	push   %eax
    217e:	50                   	push   %eax
    217f:	68 3d 46 00 00       	push   $0x463d
    2184:	6a 01                	push   $0x1
    2186:	e8 f5 18 00 00       	call   3a80 <printf>
    exit();
    218b:	e8 87 17 00 00       	call   3917 <exit>
    printf(1, "create dd/ff/ff succeeded!\n");
    2190:	51                   	push   %ecx
    2191:	51                   	push   %ecx
    2192:	68 ef 46 00 00       	push   $0x46ef
    2197:	6a 01                	push   $0x1
    2199:	e8 e2 18 00 00       	call   3a80 <printf>
    exit();
    219e:	e8 74 17 00 00       	call   3917 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    21a3:	53                   	push   %ebx
    21a4:	53                   	push   %ebx
    21a5:	68 dc 50 00 00       	push   $0x50dc
    21aa:	6a 01                	push   $0x1
    21ac:	e8 cf 18 00 00       	call   3a80 <printf>
    exit();
    21b1:	e8 61 17 00 00       	call   3917 <exit>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    21b6:	51                   	push   %ecx
    21b7:	51                   	push   %ecx
    21b8:	68 83 47 00 00       	push   $0x4783
    21bd:	6a 01                	push   $0x1
    21bf:	e8 bc 18 00 00       	call   3a80 <printf>
    exit();
    21c4:	e8 4e 17 00 00       	call   3917 <exit>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    21c9:	53                   	push   %ebx
    21ca:	53                   	push   %ebx
    21cb:	68 4c 51 00 00       	push   $0x514c
    21d0:	6a 01                	push   $0x1
    21d2:	e8 a9 18 00 00       	call   3a80 <printf>
    exit();
    21d7:	e8 3b 17 00 00       	call   3917 <exit>
    printf(1, "open dd/dd/../ff failed\n");
    21dc:	50                   	push   %eax
    21dd:	50                   	push   %eax
    21de:	68 fe 45 00 00       	push   $0x45fe
    21e3:	6a 01                	push   $0x1
    21e5:	e8 96 18 00 00       	call   3a80 <printf>
    exit();
    21ea:	e8 28 17 00 00       	call   3917 <exit>
    printf(1, "create dd/dd/ff failed\n");
    21ef:	51                   	push   %ecx
    21f0:	51                   	push   %ecx
    21f1:	68 d7 45 00 00       	push   $0x45d7
    21f6:	6a 01                	push   $0x1
    21f8:	e8 83 18 00 00       	call   3a80 <printf>
    exit();
    21fd:	e8 15 17 00 00       	call   3917 <exit>
    printf(1, "chdir ./.. failed\n");
    2202:	50                   	push   %eax
    2203:	50                   	push   %eax
    2204:	68 a0 46 00 00       	push   $0x46a0
    2209:	6a 01                	push   $0x1
    220b:	e8 70 18 00 00       	call   3a80 <printf>
    exit();
    2210:	e8 02 17 00 00       	call   3917 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    2215:	52                   	push   %edx
    2216:	52                   	push   %edx
    2217:	68 94 50 00 00       	push   $0x5094
    221c:	6a 01                	push   $0x1
    221e:	e8 5d 18 00 00       	call   3a80 <printf>
    exit();
    2223:	e8 ef 16 00 00       	call   3917 <exit>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2228:	50                   	push   %eax
    2229:	50                   	push   %eax
    222a:	68 28 51 00 00       	push   $0x5128
    222f:	6a 01                	push   $0x1
    2231:	e8 4a 18 00 00       	call   3a80 <printf>
    exit();
    2236:	e8 dc 16 00 00       	call   3917 <exit>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    223b:	50                   	push   %eax
    223c:	50                   	push   %eax
    223d:	68 04 51 00 00       	push   $0x5104
    2242:	6a 01                	push   $0x1
    2244:	e8 37 18 00 00       	call   3a80 <printf>
    exit();
    2249:	e8 c9 16 00 00       	call   3917 <exit>
    printf(1, "open dd wronly succeeded!\n");
    224e:	50                   	push   %eax
    224f:	50                   	push   %eax
    2250:	68 5f 47 00 00       	push   $0x475f
    2255:	6a 01                	push   $0x1
    2257:	e8 24 18 00 00       	call   3a80 <printf>
    exit();
    225c:	e8 b6 16 00 00       	call   3917 <exit>
    printf(1, "open dd rdwr succeeded!\n");
    2261:	50                   	push   %eax
    2262:	50                   	push   %eax
    2263:	68 46 47 00 00       	push   $0x4746
    2268:	6a 01                	push   $0x1
    226a:	e8 11 18 00 00       	call   3a80 <printf>
    exit();
    226f:	e8 a3 16 00 00       	call   3917 <exit>
    printf(1, "create dd succeeded!\n");
    2274:	50                   	push   %eax
    2275:	50                   	push   %eax
    2276:	68 30 47 00 00       	push   $0x4730
    227b:	6a 01                	push   $0x1
    227d:	e8 fe 17 00 00       	call   3a80 <printf>
    exit();
    2282:	e8 90 16 00 00       	call   3917 <exit>
    printf(1, "create dd/xx/ff succeeded!\n");
    2287:	52                   	push   %edx
    2288:	52                   	push   %edx
    2289:	68 14 47 00 00       	push   $0x4714
    228e:	6a 01                	push   $0x1
    2290:	e8 eb 17 00 00       	call   3a80 <printf>
    exit();
    2295:	e8 7d 16 00 00       	call   3917 <exit>
    printf(1, "chdir dd failed\n");
    229a:	50                   	push   %eax
    229b:	50                   	push   %eax
    229c:	68 55 46 00 00       	push   $0x4655
    22a1:	6a 01                	push   $0x1
    22a3:	e8 d8 17 00 00       	call   3a80 <printf>
    exit();
    22a8:	e8 6a 16 00 00       	call   3917 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    22ad:	50                   	push   %eax
    22ae:	50                   	push   %eax
    22af:	68 b8 50 00 00       	push   $0x50b8
    22b4:	6a 01                	push   $0x1
    22b6:	e8 c5 17 00 00       	call   3a80 <printf>
    exit();
    22bb:	e8 57 16 00 00       	call   3917 <exit>
    printf(1, "subdir mkdir dd/dd failed\n");
    22c0:	53                   	push   %ebx
    22c1:	53                   	push   %ebx
    22c2:	68 b3 45 00 00       	push   $0x45b3
    22c7:	6a 01                	push   $0x1
    22c9:	e8 b2 17 00 00       	call   3a80 <printf>
    exit();
    22ce:	e8 44 16 00 00       	call   3917 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    22d3:	50                   	push   %eax
    22d4:	50                   	push   %eax
    22d5:	68 6c 50 00 00       	push   $0x506c
    22da:	6a 01                	push   $0x1
    22dc:	e8 9f 17 00 00       	call   3a80 <printf>
    exit();
    22e1:	e8 31 16 00 00       	call   3917 <exit>
    printf(1, "create dd/ff failed\n");
    22e6:	50                   	push   %eax
    22e7:	50                   	push   %eax
    22e8:	68 97 45 00 00       	push   $0x4597
    22ed:	6a 01                	push   $0x1
    22ef:	e8 8c 17 00 00       	call   3a80 <printf>
    exit();
    22f4:	e8 1e 16 00 00       	call   3917 <exit>
    printf(1, "subdir mkdir dd failed\n");
    22f9:	50                   	push   %eax
    22fa:	50                   	push   %eax
    22fb:	68 7f 45 00 00       	push   $0x457f
    2300:	6a 01                	push   $0x1
    2302:	e8 79 17 00 00       	call   3a80 <printf>
    exit();
    2307:	e8 0b 16 00 00       	call   3917 <exit>
    printf(1, "unlink dd failed\n");
    230c:	50                   	push   %eax
    230d:	50                   	push   %eax
    230e:	68 68 48 00 00       	push   $0x4868
    2313:	6a 01                	push   $0x1
    2315:	e8 66 17 00 00       	call   3a80 <printf>
    exit();
    231a:	e8 f8 15 00 00       	call   3917 <exit>
    printf(1, "unlink dd/dd failed\n");
    231f:	52                   	push   %edx
    2320:	52                   	push   %edx
    2321:	68 53 48 00 00       	push   $0x4853
    2326:	6a 01                	push   $0x1
    2328:	e8 53 17 00 00       	call   3a80 <printf>
    exit();
    232d:	e8 e5 15 00 00       	call   3917 <exit>
    printf(1, "unlink non-empty dd succeeded!\n");
    2332:	51                   	push   %ecx
    2333:	51                   	push   %ecx
    2334:	68 70 51 00 00       	push   $0x5170
    2339:	6a 01                	push   $0x1
    233b:	e8 40 17 00 00       	call   3a80 <printf>
    exit();
    2340:	e8 d2 15 00 00       	call   3917 <exit>
    printf(1, "unlink dd/ff failed\n");
    2345:	53                   	push   %ebx
    2346:	53                   	push   %ebx
    2347:	68 3e 48 00 00       	push   $0x483e
    234c:	6a 01                	push   $0x1
    234e:	e8 2d 17 00 00       	call   3a80 <printf>
    exit();
    2353:	e8 bf 15 00 00       	call   3917 <exit>
    printf(1, "chdir dd/xx succeeded!\n");
    2358:	50                   	push   %eax
    2359:	50                   	push   %eax
    235a:	68 26 48 00 00       	push   $0x4826
    235f:	6a 01                	push   $0x1
    2361:	e8 1a 17 00 00       	call   3a80 <printf>
    exit();
    2366:	e8 ac 15 00 00       	call   3917 <exit>
    printf(1, "chdir dd/ff succeeded!\n");
    236b:	50                   	push   %eax
    236c:	50                   	push   %eax
    236d:	68 0e 48 00 00       	push   $0x480e
    2372:	6a 01                	push   $0x1
    2374:	e8 07 17 00 00       	call   3a80 <printf>
    exit();
    2379:	e8 99 15 00 00       	call   3917 <exit>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    237e:	50                   	push   %eax
    237f:	50                   	push   %eax
    2380:	68 f2 47 00 00       	push   $0x47f2
    2385:	6a 01                	push   $0x1
    2387:	e8 f4 16 00 00       	call   3a80 <printf>
    exit();
    238c:	e8 86 15 00 00       	call   3917 <exit>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    2391:	50                   	push   %eax
    2392:	50                   	push   %eax
    2393:	68 d6 47 00 00       	push   $0x47d6
    2398:	6a 01                	push   $0x1
    239a:	e8 e1 16 00 00       	call   3a80 <printf>
    exit();
    239f:	e8 73 15 00 00       	call   3917 <exit>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    23a4:	50                   	push   %eax
    23a5:	50                   	push   %eax
    23a6:	68 b9 47 00 00       	push   $0x47b9
    23ab:	6a 01                	push   $0x1
    23ad:	e8 ce 16 00 00       	call   3a80 <printf>
    exit();
    23b2:	e8 60 15 00 00       	call   3917 <exit>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    23b7:	52                   	push   %edx
    23b8:	52                   	push   %edx
    23b9:	68 9e 47 00 00       	push   $0x479e
    23be:	6a 01                	push   $0x1
    23c0:	e8 bb 16 00 00       	call   3a80 <printf>
    exit();
    23c5:	e8 4d 15 00 00       	call   3917 <exit>
    printf(1, "read dd/dd/ffff wrong len\n");
    23ca:	51                   	push   %ecx
    23cb:	51                   	push   %ecx
    23cc:	68 cb 46 00 00       	push   $0x46cb
    23d1:	6a 01                	push   $0x1
    23d3:	e8 a8 16 00 00       	call   3a80 <printf>
    exit();
    23d8:	e8 3a 15 00 00       	call   3917 <exit>
    printf(1, "open dd/dd/ffff failed\n");
    23dd:	53                   	push   %ebx
    23de:	53                   	push   %ebx
    23df:	68 b3 46 00 00       	push   $0x46b3
    23e4:	6a 01                	push   $0x1
    23e6:	e8 95 16 00 00       	call   3a80 <printf>
    exit();
    23eb:	e8 27 15 00 00       	call   3917 <exit>

000023f0 <bigwrite>:
{
    23f0:	55                   	push   %ebp
    23f1:	89 e5                	mov    %esp,%ebp
    23f3:	57                   	push   %edi
    23f4:	56                   	push   %esi
    23f5:	53                   	push   %ebx
  for(sz = 499; sz < 12*512; sz += 471){
    23f6:	bb f3 01 00 00       	mov    $0x1f3,%ebx
{
    23fb:	83 ec 14             	sub    $0x14,%esp
  printf(1, "bigwrite test\n");
    23fe:	68 85 48 00 00       	push   $0x4885
    2403:	6a 01                	push   $0x1
    2405:	e8 76 16 00 00       	call   3a80 <printf>
  unlink("bigwrite");
    240a:	c7 04 24 94 48 00 00 	movl   $0x4894,(%esp)
    2411:	e8 51 15 00 00       	call   3967 <unlink>
    2416:	83 c4 10             	add    $0x10,%esp
    2419:	eb 2b                	jmp    2446 <bigwrite+0x56>
    241b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    close(fd);
    2420:	83 ec 0c             	sub    $0xc,%esp
  for(sz = 499; sz < 12*512; sz += 471){
    2423:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
    close(fd);
    2429:	57                   	push   %edi
    242a:	e8 10 15 00 00       	call   393f <close>
    unlink("bigwrite");
    242f:	c7 04 24 94 48 00 00 	movl   $0x4894,(%esp)
    2436:	e8 2c 15 00 00       	call   3967 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    243b:	83 c4 10             	add    $0x10,%esp
    243e:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    2444:	74 4a                	je     2490 <bigwrite+0xa0>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2446:	83 ec 08             	sub    $0x8,%esp
    2449:	68 02 02 00 00       	push   $0x202
    244e:	68 94 48 00 00       	push   $0x4894
    2453:	e8 ff 14 00 00       	call   3957 <open>
    if(fd < 0){
    2458:	83 c4 10             	add    $0x10,%esp
    fd = open("bigwrite", O_CREATE | O_RDWR);
    245b:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    245d:	85 c0                	test   %eax,%eax
    245f:	78 5c                	js     24bd <bigwrite+0xcd>
    2461:	be 02 00 00 00       	mov    $0x2,%esi
      int cc = write(fd, buf, sz);
    2466:	83 ec 04             	sub    $0x4,%esp
    2469:	53                   	push   %ebx
    246a:	68 a0 86 00 00       	push   $0x86a0
    246f:	57                   	push   %edi
    2470:	e8 c2 14 00 00       	call   3937 <write>
      if(cc != sz){
    2475:	83 c4 10             	add    $0x10,%esp
    2478:	39 d8                	cmp    %ebx,%eax
    247a:	75 2e                	jne    24aa <bigwrite+0xba>
    for(i = 0; i < 2; i++){
    247c:	83 fe 01             	cmp    $0x1,%esi
    247f:	74 9f                	je     2420 <bigwrite+0x30>
    2481:	be 01 00 00 00       	mov    $0x1,%esi
    2486:	eb de                	jmp    2466 <bigwrite+0x76>
    2488:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    248f:	00 
  printf(1, "bigwrite ok\n");
    2490:	83 ec 08             	sub    $0x8,%esp
    2493:	68 c7 48 00 00       	push   $0x48c7
    2498:	6a 01                	push   $0x1
    249a:	e8 e1 15 00 00       	call   3a80 <printf>
}
    249f:	83 c4 10             	add    $0x10,%esp
    24a2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    24a5:	5b                   	pop    %ebx
    24a6:	5e                   	pop    %esi
    24a7:	5f                   	pop    %edi
    24a8:	5d                   	pop    %ebp
    24a9:	c3                   	ret
        printf(1, "write(%d) ret %d\n", sz, cc);
    24aa:	50                   	push   %eax
    24ab:	53                   	push   %ebx
    24ac:	68 b5 48 00 00       	push   $0x48b5
    24b1:	6a 01                	push   $0x1
    24b3:	e8 c8 15 00 00       	call   3a80 <printf>
        exit();
    24b8:	e8 5a 14 00 00       	call   3917 <exit>
      printf(1, "cannot create bigwrite\n");
    24bd:	83 ec 08             	sub    $0x8,%esp
    24c0:	68 9d 48 00 00       	push   $0x489d
    24c5:	6a 01                	push   $0x1
    24c7:	e8 b4 15 00 00       	call   3a80 <printf>
      exit();
    24cc:	e8 46 14 00 00       	call   3917 <exit>
    24d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    24d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    24df:	00 

000024e0 <bigfile>:
{
    24e0:	55                   	push   %ebp
    24e1:	89 e5                	mov    %esp,%ebp
    24e3:	57                   	push   %edi
    24e4:	56                   	push   %esi
    24e5:	53                   	push   %ebx
    24e6:	83 ec 14             	sub    $0x14,%esp
  printf(1, "bigfile test\n");
    24e9:	68 d4 48 00 00       	push   $0x48d4
    24ee:	6a 01                	push   $0x1
    24f0:	e8 8b 15 00 00       	call   3a80 <printf>
  unlink("bigfile");
    24f5:	c7 04 24 f0 48 00 00 	movl   $0x48f0,(%esp)
    24fc:	e8 66 14 00 00       	call   3967 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    2501:	58                   	pop    %eax
    2502:	5a                   	pop    %edx
    2503:	68 02 02 00 00       	push   $0x202
    2508:	68 f0 48 00 00       	push   $0x48f0
    250d:	e8 45 14 00 00       	call   3957 <open>
  if(fd < 0){
    2512:	83 c4 10             	add    $0x10,%esp
    2515:	85 c0                	test   %eax,%eax
    2517:	0f 88 6e 01 00 00    	js     268b <bigfile+0x1ab>
    251d:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 20; i++){
    251f:	31 db                	xor    %ebx,%ebx
    2521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2528:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    252f:	00 
    memset(buf, i, 600);
    2530:	83 ec 04             	sub    $0x4,%esp
    2533:	68 58 02 00 00       	push   $0x258
    2538:	53                   	push   %ebx
    2539:	68 a0 86 00 00       	push   $0x86a0
    253e:	e8 3d 12 00 00       	call   3780 <memset>
    if(write(fd, buf, 600) != 600){
    2543:	83 c4 0c             	add    $0xc,%esp
    2546:	68 58 02 00 00       	push   $0x258
    254b:	68 a0 86 00 00       	push   $0x86a0
    2550:	56                   	push   %esi
    2551:	e8 e1 13 00 00       	call   3937 <write>
    2556:	83 c4 10             	add    $0x10,%esp
    2559:	3d 58 02 00 00       	cmp    $0x258,%eax
    255e:	0f 85 00 01 00 00    	jne    2664 <bigfile+0x184>
  for(i = 0; i < 20; i++){
    2564:	83 c3 01             	add    $0x1,%ebx
    2567:	83 fb 14             	cmp    $0x14,%ebx
    256a:	75 c4                	jne    2530 <bigfile+0x50>
  close(fd);
    256c:	83 ec 0c             	sub    $0xc,%esp
    256f:	56                   	push   %esi
    2570:	e8 ca 13 00 00       	call   393f <close>
  fd = open("bigfile", 0);
    2575:	5e                   	pop    %esi
    2576:	5f                   	pop    %edi
    2577:	6a 00                	push   $0x0
    2579:	68 f0 48 00 00       	push   $0x48f0
    257e:	e8 d4 13 00 00       	call   3957 <open>
  if(fd < 0){
    2583:	83 c4 10             	add    $0x10,%esp
  fd = open("bigfile", 0);
    2586:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    2588:	85 c0                	test   %eax,%eax
    258a:	0f 88 e8 00 00 00    	js     2678 <bigfile+0x198>
  total = 0;
    2590:	31 db                	xor    %ebx,%ebx
  for(i = 0; ; i++){
    2592:	31 ff                	xor    %edi,%edi
    2594:	eb 38                	jmp    25ce <bigfile+0xee>
    2596:	66 90                	xchg   %ax,%ax
    2598:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    259f:	00 
    if(cc != 300){
    25a0:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    25a5:	0f 85 91 00 00 00    	jne    263c <bigfile+0x15c>
    if(buf[0] != i/2 || buf[299] != i/2){
    25ab:	89 fa                	mov    %edi,%edx
    25ad:	0f be 05 a0 86 00 00 	movsbl 0x86a0,%eax
    25b4:	d1 fa                	sar    $1,%edx
    25b6:	39 d0                	cmp    %edx,%eax
    25b8:	75 6e                	jne    2628 <bigfile+0x148>
    25ba:	0f be 15 cb 87 00 00 	movsbl 0x87cb,%edx
    25c1:	39 d0                	cmp    %edx,%eax
    25c3:	75 63                	jne    2628 <bigfile+0x148>
    total += cc;
    25c5:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  for(i = 0; ; i++){
    25cb:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    25ce:	83 ec 04             	sub    $0x4,%esp
    25d1:	68 2c 01 00 00       	push   $0x12c
    25d6:	68 a0 86 00 00       	push   $0x86a0
    25db:	56                   	push   %esi
    25dc:	e8 4e 13 00 00       	call   392f <read>
    if(cc < 0){
    25e1:	83 c4 10             	add    $0x10,%esp
    25e4:	85 c0                	test   %eax,%eax
    25e6:	78 68                	js     2650 <bigfile+0x170>
    if(cc == 0)
    25e8:	75 b6                	jne    25a0 <bigfile+0xc0>
  close(fd);
    25ea:	83 ec 0c             	sub    $0xc,%esp
    25ed:	56                   	push   %esi
    25ee:	e8 4c 13 00 00       	call   393f <close>
  if(total != 20*600){
    25f3:	83 c4 10             	add    $0x10,%esp
    25f6:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    25fc:	0f 85 9c 00 00 00    	jne    269e <bigfile+0x1be>
  unlink("bigfile");
    2602:	83 ec 0c             	sub    $0xc,%esp
    2605:	68 f0 48 00 00       	push   $0x48f0
    260a:	e8 58 13 00 00       	call   3967 <unlink>
  printf(1, "bigfile test ok\n");
    260f:	58                   	pop    %eax
    2610:	5a                   	pop    %edx
    2611:	68 7f 49 00 00       	push   $0x497f
    2616:	6a 01                	push   $0x1
    2618:	e8 63 14 00 00       	call   3a80 <printf>
}
    261d:	83 c4 10             	add    $0x10,%esp
    2620:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2623:	5b                   	pop    %ebx
    2624:	5e                   	pop    %esi
    2625:	5f                   	pop    %edi
    2626:	5d                   	pop    %ebp
    2627:	c3                   	ret
      printf(1, "read bigfile wrong data\n");
    2628:	83 ec 08             	sub    $0x8,%esp
    262b:	68 4c 49 00 00       	push   $0x494c
    2630:	6a 01                	push   $0x1
    2632:	e8 49 14 00 00       	call   3a80 <printf>
      exit();
    2637:	e8 db 12 00 00       	call   3917 <exit>
      printf(1, "short read bigfile\n");
    263c:	83 ec 08             	sub    $0x8,%esp
    263f:	68 38 49 00 00       	push   $0x4938
    2644:	6a 01                	push   $0x1
    2646:	e8 35 14 00 00       	call   3a80 <printf>
      exit();
    264b:	e8 c7 12 00 00       	call   3917 <exit>
      printf(1, "read bigfile failed\n");
    2650:	83 ec 08             	sub    $0x8,%esp
    2653:	68 23 49 00 00       	push   $0x4923
    2658:	6a 01                	push   $0x1
    265a:	e8 21 14 00 00       	call   3a80 <printf>
      exit();
    265f:	e8 b3 12 00 00       	call   3917 <exit>
      printf(1, "write bigfile failed\n");
    2664:	83 ec 08             	sub    $0x8,%esp
    2667:	68 f8 48 00 00       	push   $0x48f8
    266c:	6a 01                	push   $0x1
    266e:	e8 0d 14 00 00       	call   3a80 <printf>
      exit();
    2673:	e8 9f 12 00 00       	call   3917 <exit>
    printf(1, "cannot open bigfile\n");
    2678:	53                   	push   %ebx
    2679:	53                   	push   %ebx
    267a:	68 0e 49 00 00       	push   $0x490e
    267f:	6a 01                	push   $0x1
    2681:	e8 fa 13 00 00       	call   3a80 <printf>
    exit();
    2686:	e8 8c 12 00 00       	call   3917 <exit>
    printf(1, "cannot create bigfile");
    268b:	50                   	push   %eax
    268c:	50                   	push   %eax
    268d:	68 e2 48 00 00       	push   $0x48e2
    2692:	6a 01                	push   $0x1
    2694:	e8 e7 13 00 00       	call   3a80 <printf>
    exit();
    2699:	e8 79 12 00 00       	call   3917 <exit>
    printf(1, "read bigfile wrong total\n");
    269e:	51                   	push   %ecx
    269f:	51                   	push   %ecx
    26a0:	68 65 49 00 00       	push   $0x4965
    26a5:	6a 01                	push   $0x1
    26a7:	e8 d4 13 00 00       	call   3a80 <printf>
    exit();
    26ac:	e8 66 12 00 00       	call   3917 <exit>
    26b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    26b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    26bf:	00 

000026c0 <fourteen>:
{
    26c0:	55                   	push   %ebp
    26c1:	89 e5                	mov    %esp,%ebp
    26c3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "fourteen test\n");
    26c6:	68 90 49 00 00       	push   $0x4990
    26cb:	6a 01                	push   $0x1
    26cd:	e8 ae 13 00 00       	call   3a80 <printf>
  if(mkdir("12345678901234") != 0){
    26d2:	c7 04 24 cb 49 00 00 	movl   $0x49cb,(%esp)
    26d9:	e8 a1 12 00 00       	call   397f <mkdir>
    26de:	83 c4 10             	add    $0x10,%esp
    26e1:	85 c0                	test   %eax,%eax
    26e3:	0f 85 97 00 00 00    	jne    2780 <fourteen+0xc0>
  if(mkdir("12345678901234/123456789012345") != 0){
    26e9:	83 ec 0c             	sub    $0xc,%esp
    26ec:	68 90 51 00 00       	push   $0x5190
    26f1:	e8 89 12 00 00       	call   397f <mkdir>
    26f6:	83 c4 10             	add    $0x10,%esp
    26f9:	85 c0                	test   %eax,%eax
    26fb:	0f 85 de 00 00 00    	jne    27df <fourteen+0x11f>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2701:	83 ec 08             	sub    $0x8,%esp
    2704:	68 00 02 00 00       	push   $0x200
    2709:	68 e0 51 00 00       	push   $0x51e0
    270e:	e8 44 12 00 00       	call   3957 <open>
  if(fd < 0){
    2713:	83 c4 10             	add    $0x10,%esp
    2716:	85 c0                	test   %eax,%eax
    2718:	0f 88 ae 00 00 00    	js     27cc <fourteen+0x10c>
  close(fd);
    271e:	83 ec 0c             	sub    $0xc,%esp
    2721:	50                   	push   %eax
    2722:	e8 18 12 00 00       	call   393f <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2727:	58                   	pop    %eax
    2728:	5a                   	pop    %edx
    2729:	6a 00                	push   $0x0
    272b:	68 50 52 00 00       	push   $0x5250
    2730:	e8 22 12 00 00       	call   3957 <open>
  if(fd < 0){
    2735:	83 c4 10             	add    $0x10,%esp
    2738:	85 c0                	test   %eax,%eax
    273a:	78 7d                	js     27b9 <fourteen+0xf9>
  close(fd);
    273c:	83 ec 0c             	sub    $0xc,%esp
    273f:	50                   	push   %eax
    2740:	e8 fa 11 00 00       	call   393f <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    2745:	c7 04 24 bc 49 00 00 	movl   $0x49bc,(%esp)
    274c:	e8 2e 12 00 00       	call   397f <mkdir>
    2751:	83 c4 10             	add    $0x10,%esp
    2754:	85 c0                	test   %eax,%eax
    2756:	74 4e                	je     27a6 <fourteen+0xe6>
  if(mkdir("123456789012345/12345678901234") == 0){
    2758:	83 ec 0c             	sub    $0xc,%esp
    275b:	68 ec 52 00 00       	push   $0x52ec
    2760:	e8 1a 12 00 00       	call   397f <mkdir>
    2765:	83 c4 10             	add    $0x10,%esp
    2768:	85 c0                	test   %eax,%eax
    276a:	74 27                	je     2793 <fourteen+0xd3>
  printf(1, "fourteen ok\n");
    276c:	83 ec 08             	sub    $0x8,%esp
    276f:	68 da 49 00 00       	push   $0x49da
    2774:	6a 01                	push   $0x1
    2776:	e8 05 13 00 00       	call   3a80 <printf>
}
    277b:	83 c4 10             	add    $0x10,%esp
    277e:	c9                   	leave
    277f:	c3                   	ret
    printf(1, "mkdir 12345678901234 failed\n");
    2780:	50                   	push   %eax
    2781:	50                   	push   %eax
    2782:	68 9f 49 00 00       	push   $0x499f
    2787:	6a 01                	push   $0x1
    2789:	e8 f2 12 00 00       	call   3a80 <printf>
    exit();
    278e:	e8 84 11 00 00       	call   3917 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2793:	50                   	push   %eax
    2794:	50                   	push   %eax
    2795:	68 0c 53 00 00       	push   $0x530c
    279a:	6a 01                	push   $0x1
    279c:	e8 df 12 00 00       	call   3a80 <printf>
    exit();
    27a1:	e8 71 11 00 00       	call   3917 <exit>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    27a6:	52                   	push   %edx
    27a7:	52                   	push   %edx
    27a8:	68 bc 52 00 00       	push   $0x52bc
    27ad:	6a 01                	push   $0x1
    27af:	e8 cc 12 00 00       	call   3a80 <printf>
    exit();
    27b4:	e8 5e 11 00 00       	call   3917 <exit>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    27b9:	51                   	push   %ecx
    27ba:	51                   	push   %ecx
    27bb:	68 80 52 00 00       	push   $0x5280
    27c0:	6a 01                	push   $0x1
    27c2:	e8 b9 12 00 00       	call   3a80 <printf>
    exit();
    27c7:	e8 4b 11 00 00       	call   3917 <exit>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    27cc:	51                   	push   %ecx
    27cd:	51                   	push   %ecx
    27ce:	68 10 52 00 00       	push   $0x5210
    27d3:	6a 01                	push   $0x1
    27d5:	e8 a6 12 00 00       	call   3a80 <printf>
    exit();
    27da:	e8 38 11 00 00       	call   3917 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    27df:	50                   	push   %eax
    27e0:	50                   	push   %eax
    27e1:	68 b0 51 00 00       	push   $0x51b0
    27e6:	6a 01                	push   $0x1
    27e8:	e8 93 12 00 00       	call   3a80 <printf>
    exit();
    27ed:	e8 25 11 00 00       	call   3917 <exit>
    27f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    27f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    27ff:	00 

00002800 <rmdot>:
{
    2800:	55                   	push   %ebp
    2801:	89 e5                	mov    %esp,%ebp
    2803:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    2806:	68 e7 49 00 00       	push   $0x49e7
    280b:	6a 01                	push   $0x1
    280d:	e8 6e 12 00 00       	call   3a80 <printf>
  if(mkdir("dots") != 0){
    2812:	c7 04 24 f3 49 00 00 	movl   $0x49f3,(%esp)
    2819:	e8 61 11 00 00       	call   397f <mkdir>
    281e:	83 c4 10             	add    $0x10,%esp
    2821:	85 c0                	test   %eax,%eax
    2823:	0f 85 b0 00 00 00    	jne    28d9 <rmdot+0xd9>
  if(chdir("dots") != 0){
    2829:	83 ec 0c             	sub    $0xc,%esp
    282c:	68 f3 49 00 00       	push   $0x49f3
    2831:	e8 51 11 00 00       	call   3987 <chdir>
    2836:	83 c4 10             	add    $0x10,%esp
    2839:	85 c0                	test   %eax,%eax
    283b:	0f 85 1d 01 00 00    	jne    295e <rmdot+0x15e>
  if(unlink(".") == 0){
    2841:	83 ec 0c             	sub    $0xc,%esp
    2844:	68 9e 46 00 00       	push   $0x469e
    2849:	e8 19 11 00 00       	call   3967 <unlink>
    284e:	83 c4 10             	add    $0x10,%esp
    2851:	85 c0                	test   %eax,%eax
    2853:	0f 84 f2 00 00 00    	je     294b <rmdot+0x14b>
  if(unlink("..") == 0){
    2859:	83 ec 0c             	sub    $0xc,%esp
    285c:	68 9d 46 00 00       	push   $0x469d
    2861:	e8 01 11 00 00       	call   3967 <unlink>
    2866:	83 c4 10             	add    $0x10,%esp
    2869:	85 c0                	test   %eax,%eax
    286b:	0f 84 c7 00 00 00    	je     2938 <rmdot+0x138>
  if(chdir("/") != 0){
    2871:	83 ec 0c             	sub    $0xc,%esp
    2874:	68 71 3e 00 00       	push   $0x3e71
    2879:	e8 09 11 00 00       	call   3987 <chdir>
    287e:	83 c4 10             	add    $0x10,%esp
    2881:	85 c0                	test   %eax,%eax
    2883:	0f 85 9c 00 00 00    	jne    2925 <rmdot+0x125>
  if(unlink("dots/.") == 0){
    2889:	83 ec 0c             	sub    $0xc,%esp
    288c:	68 3b 4a 00 00       	push   $0x4a3b
    2891:	e8 d1 10 00 00       	call   3967 <unlink>
    2896:	83 c4 10             	add    $0x10,%esp
    2899:	85 c0                	test   %eax,%eax
    289b:	74 75                	je     2912 <rmdot+0x112>
  if(unlink("dots/..") == 0){
    289d:	83 ec 0c             	sub    $0xc,%esp
    28a0:	68 59 4a 00 00       	push   $0x4a59
    28a5:	e8 bd 10 00 00       	call   3967 <unlink>
    28aa:	83 c4 10             	add    $0x10,%esp
    28ad:	85 c0                	test   %eax,%eax
    28af:	74 4e                	je     28ff <rmdot+0xff>
  if(unlink("dots") != 0){
    28b1:	83 ec 0c             	sub    $0xc,%esp
    28b4:	68 f3 49 00 00       	push   $0x49f3
    28b9:	e8 a9 10 00 00       	call   3967 <unlink>
    28be:	83 c4 10             	add    $0x10,%esp
    28c1:	85 c0                	test   %eax,%eax
    28c3:	75 27                	jne    28ec <rmdot+0xec>
  printf(1, "rmdot ok\n");
    28c5:	83 ec 08             	sub    $0x8,%esp
    28c8:	68 8e 4a 00 00       	push   $0x4a8e
    28cd:	6a 01                	push   $0x1
    28cf:	e8 ac 11 00 00       	call   3a80 <printf>
}
    28d4:	83 c4 10             	add    $0x10,%esp
    28d7:	c9                   	leave
    28d8:	c3                   	ret
    printf(1, "mkdir dots failed\n");
    28d9:	50                   	push   %eax
    28da:	50                   	push   %eax
    28db:	68 f8 49 00 00       	push   $0x49f8
    28e0:	6a 01                	push   $0x1
    28e2:	e8 99 11 00 00       	call   3a80 <printf>
    exit();
    28e7:	e8 2b 10 00 00       	call   3917 <exit>
    printf(1, "unlink dots failed!\n");
    28ec:	50                   	push   %eax
    28ed:	50                   	push   %eax
    28ee:	68 79 4a 00 00       	push   $0x4a79
    28f3:	6a 01                	push   $0x1
    28f5:	e8 86 11 00 00       	call   3a80 <printf>
    exit();
    28fa:	e8 18 10 00 00       	call   3917 <exit>
    printf(1, "unlink dots/.. worked!\n");
    28ff:	52                   	push   %edx
    2900:	52                   	push   %edx
    2901:	68 61 4a 00 00       	push   $0x4a61
    2906:	6a 01                	push   $0x1
    2908:	e8 73 11 00 00       	call   3a80 <printf>
    exit();
    290d:	e8 05 10 00 00       	call   3917 <exit>
    printf(1, "unlink dots/. worked!\n");
    2912:	51                   	push   %ecx
    2913:	51                   	push   %ecx
    2914:	68 42 4a 00 00       	push   $0x4a42
    2919:	6a 01                	push   $0x1
    291b:	e8 60 11 00 00       	call   3a80 <printf>
    exit();
    2920:	e8 f2 0f 00 00       	call   3917 <exit>
    printf(1, "chdir / failed\n");
    2925:	50                   	push   %eax
    2926:	50                   	push   %eax
    2927:	68 73 3e 00 00       	push   $0x3e73
    292c:	6a 01                	push   $0x1
    292e:	e8 4d 11 00 00       	call   3a80 <printf>
    exit();
    2933:	e8 df 0f 00 00       	call   3917 <exit>
    printf(1, "rm .. worked!\n");
    2938:	50                   	push   %eax
    2939:	50                   	push   %eax
    293a:	68 2c 4a 00 00       	push   $0x4a2c
    293f:	6a 01                	push   $0x1
    2941:	e8 3a 11 00 00       	call   3a80 <printf>
    exit();
    2946:	e8 cc 0f 00 00       	call   3917 <exit>
    printf(1, "rm . worked!\n");
    294b:	50                   	push   %eax
    294c:	50                   	push   %eax
    294d:	68 1e 4a 00 00       	push   $0x4a1e
    2952:	6a 01                	push   $0x1
    2954:	e8 27 11 00 00       	call   3a80 <printf>
    exit();
    2959:	e8 b9 0f 00 00       	call   3917 <exit>
    printf(1, "chdir dots failed\n");
    295e:	50                   	push   %eax
    295f:	50                   	push   %eax
    2960:	68 0b 4a 00 00       	push   $0x4a0b
    2965:	6a 01                	push   $0x1
    2967:	e8 14 11 00 00       	call   3a80 <printf>
    exit();
    296c:	e8 a6 0f 00 00       	call   3917 <exit>
    2971:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2978:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    297f:	00 

00002980 <dirfile>:
{
    2980:	55                   	push   %ebp
    2981:	89 e5                	mov    %esp,%ebp
    2983:	53                   	push   %ebx
    2984:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "dir vs file\n");
    2987:	68 98 4a 00 00       	push   $0x4a98
    298c:	6a 01                	push   $0x1
    298e:	e8 ed 10 00 00       	call   3a80 <printf>
  fd = open("dirfile", O_CREATE);
    2993:	5b                   	pop    %ebx
    2994:	58                   	pop    %eax
    2995:	68 00 02 00 00       	push   $0x200
    299a:	68 a5 4a 00 00       	push   $0x4aa5
    299f:	e8 b3 0f 00 00       	call   3957 <open>
  if(fd < 0){
    29a4:	83 c4 10             	add    $0x10,%esp
    29a7:	85 c0                	test   %eax,%eax
    29a9:	0f 88 43 01 00 00    	js     2af2 <dirfile+0x172>
  close(fd);
    29af:	83 ec 0c             	sub    $0xc,%esp
    29b2:	50                   	push   %eax
    29b3:	e8 87 0f 00 00       	call   393f <close>
  if(chdir("dirfile") == 0){
    29b8:	c7 04 24 a5 4a 00 00 	movl   $0x4aa5,(%esp)
    29bf:	e8 c3 0f 00 00       	call   3987 <chdir>
    29c4:	83 c4 10             	add    $0x10,%esp
    29c7:	85 c0                	test   %eax,%eax
    29c9:	0f 84 10 01 00 00    	je     2adf <dirfile+0x15f>
  fd = open("dirfile/xx", 0);
    29cf:	83 ec 08             	sub    $0x8,%esp
    29d2:	6a 00                	push   $0x0
    29d4:	68 de 4a 00 00       	push   $0x4ade
    29d9:	e8 79 0f 00 00       	call   3957 <open>
  if(fd >= 0){
    29de:	83 c4 10             	add    $0x10,%esp
    29e1:	85 c0                	test   %eax,%eax
    29e3:	0f 89 e3 00 00 00    	jns    2acc <dirfile+0x14c>
  fd = open("dirfile/xx", O_CREATE);
    29e9:	83 ec 08             	sub    $0x8,%esp
    29ec:	68 00 02 00 00       	push   $0x200
    29f1:	68 de 4a 00 00       	push   $0x4ade
    29f6:	e8 5c 0f 00 00       	call   3957 <open>
  if(fd >= 0){
    29fb:	83 c4 10             	add    $0x10,%esp
    29fe:	85 c0                	test   %eax,%eax
    2a00:	0f 89 c6 00 00 00    	jns    2acc <dirfile+0x14c>
  if(mkdir("dirfile/xx") == 0){
    2a06:	83 ec 0c             	sub    $0xc,%esp
    2a09:	68 de 4a 00 00       	push   $0x4ade
    2a0e:	e8 6c 0f 00 00       	call   397f <mkdir>
    2a13:	83 c4 10             	add    $0x10,%esp
    2a16:	85 c0                	test   %eax,%eax
    2a18:	0f 84 46 01 00 00    	je     2b64 <dirfile+0x1e4>
  if(unlink("dirfile/xx") == 0){
    2a1e:	83 ec 0c             	sub    $0xc,%esp
    2a21:	68 de 4a 00 00       	push   $0x4ade
    2a26:	e8 3c 0f 00 00       	call   3967 <unlink>
    2a2b:	83 c4 10             	add    $0x10,%esp
    2a2e:	85 c0                	test   %eax,%eax
    2a30:	0f 84 1b 01 00 00    	je     2b51 <dirfile+0x1d1>
  if(link("README", "dirfile/xx") == 0){
    2a36:	83 ec 08             	sub    $0x8,%esp
    2a39:	68 de 4a 00 00       	push   $0x4ade
    2a3e:	68 42 4b 00 00       	push   $0x4b42
    2a43:	e8 2f 0f 00 00       	call   3977 <link>
    2a48:	83 c4 10             	add    $0x10,%esp
    2a4b:	85 c0                	test   %eax,%eax
    2a4d:	0f 84 eb 00 00 00    	je     2b3e <dirfile+0x1be>
  if(unlink("dirfile") != 0){
    2a53:	83 ec 0c             	sub    $0xc,%esp
    2a56:	68 a5 4a 00 00       	push   $0x4aa5
    2a5b:	e8 07 0f 00 00       	call   3967 <unlink>
    2a60:	83 c4 10             	add    $0x10,%esp
    2a63:	85 c0                	test   %eax,%eax
    2a65:	0f 85 c0 00 00 00    	jne    2b2b <dirfile+0x1ab>
  fd = open(".", O_RDWR);
    2a6b:	83 ec 08             	sub    $0x8,%esp
    2a6e:	6a 02                	push   $0x2
    2a70:	68 9e 46 00 00       	push   $0x469e
    2a75:	e8 dd 0e 00 00       	call   3957 <open>
  if(fd >= 0){
    2a7a:	83 c4 10             	add    $0x10,%esp
    2a7d:	85 c0                	test   %eax,%eax
    2a7f:	0f 89 93 00 00 00    	jns    2b18 <dirfile+0x198>
  fd = open(".", 0);
    2a85:	83 ec 08             	sub    $0x8,%esp
    2a88:	6a 00                	push   $0x0
    2a8a:	68 9e 46 00 00       	push   $0x469e
    2a8f:	e8 c3 0e 00 00       	call   3957 <open>
  if(write(fd, "x", 1) > 0){
    2a94:	83 c4 0c             	add    $0xc,%esp
    2a97:	6a 01                	push   $0x1
  fd = open(".", 0);
    2a99:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    2a9b:	68 81 47 00 00       	push   $0x4781
    2aa0:	50                   	push   %eax
    2aa1:	e8 91 0e 00 00       	call   3937 <write>
    2aa6:	83 c4 10             	add    $0x10,%esp
    2aa9:	85 c0                	test   %eax,%eax
    2aab:	7f 58                	jg     2b05 <dirfile+0x185>
  close(fd);
    2aad:	83 ec 0c             	sub    $0xc,%esp
    2ab0:	53                   	push   %ebx
    2ab1:	e8 89 0e 00 00       	call   393f <close>
  printf(1, "dir vs file OK\n");
    2ab6:	58                   	pop    %eax
    2ab7:	5a                   	pop    %edx
    2ab8:	68 75 4b 00 00       	push   $0x4b75
    2abd:	6a 01                	push   $0x1
    2abf:	e8 bc 0f 00 00       	call   3a80 <printf>
}
    2ac4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2ac7:	83 c4 10             	add    $0x10,%esp
    2aca:	c9                   	leave
    2acb:	c3                   	ret
    printf(1, "create dirfile/xx succeeded!\n");
    2acc:	50                   	push   %eax
    2acd:	50                   	push   %eax
    2ace:	68 e9 4a 00 00       	push   $0x4ae9
    2ad3:	6a 01                	push   $0x1
    2ad5:	e8 a6 0f 00 00       	call   3a80 <printf>
    exit();
    2ada:	e8 38 0e 00 00       	call   3917 <exit>
    printf(1, "chdir dirfile succeeded!\n");
    2adf:	52                   	push   %edx
    2ae0:	52                   	push   %edx
    2ae1:	68 c4 4a 00 00       	push   $0x4ac4
    2ae6:	6a 01                	push   $0x1
    2ae8:	e8 93 0f 00 00       	call   3a80 <printf>
    exit();
    2aed:	e8 25 0e 00 00       	call   3917 <exit>
    printf(1, "create dirfile failed\n");
    2af2:	51                   	push   %ecx
    2af3:	51                   	push   %ecx
    2af4:	68 ad 4a 00 00       	push   $0x4aad
    2af9:	6a 01                	push   $0x1
    2afb:	e8 80 0f 00 00       	call   3a80 <printf>
    exit();
    2b00:	e8 12 0e 00 00       	call   3917 <exit>
    printf(1, "write . succeeded!\n");
    2b05:	51                   	push   %ecx
    2b06:	51                   	push   %ecx
    2b07:	68 61 4b 00 00       	push   $0x4b61
    2b0c:	6a 01                	push   $0x1
    2b0e:	e8 6d 0f 00 00       	call   3a80 <printf>
    exit();
    2b13:	e8 ff 0d 00 00       	call   3917 <exit>
    printf(1, "open . for writing succeeded!\n");
    2b18:	53                   	push   %ebx
    2b19:	53                   	push   %ebx
    2b1a:	68 60 53 00 00       	push   $0x5360
    2b1f:	6a 01                	push   $0x1
    2b21:	e8 5a 0f 00 00       	call   3a80 <printf>
    exit();
    2b26:	e8 ec 0d 00 00       	call   3917 <exit>
    printf(1, "unlink dirfile failed!\n");
    2b2b:	50                   	push   %eax
    2b2c:	50                   	push   %eax
    2b2d:	68 49 4b 00 00       	push   $0x4b49
    2b32:	6a 01                	push   $0x1
    2b34:	e8 47 0f 00 00       	call   3a80 <printf>
    exit();
    2b39:	e8 d9 0d 00 00       	call   3917 <exit>
    printf(1, "link to dirfile/xx succeeded!\n");
    2b3e:	50                   	push   %eax
    2b3f:	50                   	push   %eax
    2b40:	68 40 53 00 00       	push   $0x5340
    2b45:	6a 01                	push   $0x1
    2b47:	e8 34 0f 00 00       	call   3a80 <printf>
    exit();
    2b4c:	e8 c6 0d 00 00       	call   3917 <exit>
    printf(1, "unlink dirfile/xx succeeded!\n");
    2b51:	50                   	push   %eax
    2b52:	50                   	push   %eax
    2b53:	68 24 4b 00 00       	push   $0x4b24
    2b58:	6a 01                	push   $0x1
    2b5a:	e8 21 0f 00 00       	call   3a80 <printf>
    exit();
    2b5f:	e8 b3 0d 00 00       	call   3917 <exit>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2b64:	50                   	push   %eax
    2b65:	50                   	push   %eax
    2b66:	68 07 4b 00 00       	push   $0x4b07
    2b6b:	6a 01                	push   $0x1
    2b6d:	e8 0e 0f 00 00       	call   3a80 <printf>
    exit();
    2b72:	e8 a0 0d 00 00       	call   3917 <exit>
    2b77:	90                   	nop
    2b78:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    2b7f:	00 

00002b80 <iref>:
{
    2b80:	55                   	push   %ebp
    2b81:	89 e5                	mov    %esp,%ebp
    2b83:	53                   	push   %ebx
  printf(1, "empty file name\n");
    2b84:	bb 33 00 00 00       	mov    $0x33,%ebx
{
    2b89:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "empty file name\n");
    2b8c:	68 85 4b 00 00       	push   $0x4b85
    2b91:	6a 01                	push   $0x1
    2b93:	e8 e8 0e 00 00       	call   3a80 <printf>
    2b98:	83 c4 10             	add    $0x10,%esp
    2b9b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    if(mkdir("irefd") != 0){
    2ba0:	83 ec 0c             	sub    $0xc,%esp
    2ba3:	68 96 4b 00 00       	push   $0x4b96
    2ba8:	e8 d2 0d 00 00       	call   397f <mkdir>
    2bad:	83 c4 10             	add    $0x10,%esp
    2bb0:	85 c0                	test   %eax,%eax
    2bb2:	0f 85 bb 00 00 00    	jne    2c73 <iref+0xf3>
    if(chdir("irefd") != 0){
    2bb8:	83 ec 0c             	sub    $0xc,%esp
    2bbb:	68 96 4b 00 00       	push   $0x4b96
    2bc0:	e8 c2 0d 00 00       	call   3987 <chdir>
    2bc5:	83 c4 10             	add    $0x10,%esp
    2bc8:	85 c0                	test   %eax,%eax
    2bca:	0f 85 b7 00 00 00    	jne    2c87 <iref+0x107>
    mkdir("");
    2bd0:	83 ec 0c             	sub    $0xc,%esp
    2bd3:	68 4b 42 00 00       	push   $0x424b
    2bd8:	e8 a2 0d 00 00       	call   397f <mkdir>
    link("README", "");
    2bdd:	59                   	pop    %ecx
    2bde:	58                   	pop    %eax
    2bdf:	68 4b 42 00 00       	push   $0x424b
    2be4:	68 42 4b 00 00       	push   $0x4b42
    2be9:	e8 89 0d 00 00       	call   3977 <link>
    fd = open("", O_CREATE);
    2bee:	58                   	pop    %eax
    2bef:	5a                   	pop    %edx
    2bf0:	68 00 02 00 00       	push   $0x200
    2bf5:	68 4b 42 00 00       	push   $0x424b
    2bfa:	e8 58 0d 00 00       	call   3957 <open>
    if(fd >= 0)
    2bff:	83 c4 10             	add    $0x10,%esp
    2c02:	85 c0                	test   %eax,%eax
    2c04:	78 0c                	js     2c12 <iref+0x92>
      close(fd);
    2c06:	83 ec 0c             	sub    $0xc,%esp
    2c09:	50                   	push   %eax
    2c0a:	e8 30 0d 00 00       	call   393f <close>
    2c0f:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    2c12:	83 ec 08             	sub    $0x8,%esp
    2c15:	68 00 02 00 00       	push   $0x200
    2c1a:	68 80 47 00 00       	push   $0x4780
    2c1f:	e8 33 0d 00 00       	call   3957 <open>
    if(fd >= 0)
    2c24:	83 c4 10             	add    $0x10,%esp
    2c27:	85 c0                	test   %eax,%eax
    2c29:	78 0c                	js     2c37 <iref+0xb7>
      close(fd);
    2c2b:	83 ec 0c             	sub    $0xc,%esp
    2c2e:	50                   	push   %eax
    2c2f:	e8 0b 0d 00 00       	call   393f <close>
    2c34:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    2c37:	83 ec 0c             	sub    $0xc,%esp
    2c3a:	68 80 47 00 00       	push   $0x4780
    2c3f:	e8 23 0d 00 00       	call   3967 <unlink>
  for(i = 0; i < 50 + 1; i++){
    2c44:	83 c4 10             	add    $0x10,%esp
    2c47:	83 eb 01             	sub    $0x1,%ebx
    2c4a:	0f 85 50 ff ff ff    	jne    2ba0 <iref+0x20>
  chdir("/");
    2c50:	83 ec 0c             	sub    $0xc,%esp
    2c53:	68 71 3e 00 00       	push   $0x3e71
    2c58:	e8 2a 0d 00 00       	call   3987 <chdir>
  printf(1, "empty file name OK\n");
    2c5d:	58                   	pop    %eax
    2c5e:	5a                   	pop    %edx
    2c5f:	68 c4 4b 00 00       	push   $0x4bc4
    2c64:	6a 01                	push   $0x1
    2c66:	e8 15 0e 00 00       	call   3a80 <printf>
}
    2c6b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2c6e:	83 c4 10             	add    $0x10,%esp
    2c71:	c9                   	leave
    2c72:	c3                   	ret
      printf(1, "mkdir irefd failed\n");
    2c73:	83 ec 08             	sub    $0x8,%esp
    2c76:	68 9c 4b 00 00       	push   $0x4b9c
    2c7b:	6a 01                	push   $0x1
    2c7d:	e8 fe 0d 00 00       	call   3a80 <printf>
      exit();
    2c82:	e8 90 0c 00 00       	call   3917 <exit>
      printf(1, "chdir irefd failed\n");
    2c87:	83 ec 08             	sub    $0x8,%esp
    2c8a:	68 b0 4b 00 00       	push   $0x4bb0
    2c8f:	6a 01                	push   $0x1
    2c91:	e8 ea 0d 00 00       	call   3a80 <printf>
      exit();
    2c96:	e8 7c 0c 00 00       	call   3917 <exit>
    2c9b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00002ca0 <forktest>:
{
    2ca0:	55                   	push   %ebp
    2ca1:	89 e5                	mov    %esp,%ebp
    2ca3:	53                   	push   %ebx
  for(n=0; n<1000; n++){
    2ca4:	31 db                	xor    %ebx,%ebx
{
    2ca6:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "fork test\n");
    2ca9:	68 d8 4b 00 00       	push   $0x4bd8
    2cae:	6a 01                	push   $0x1
    2cb0:	e8 cb 0d 00 00       	call   3a80 <printf>
    2cb5:	83 c4 10             	add    $0x10,%esp
    2cb8:	eb 13                	jmp    2ccd <forktest+0x2d>
    2cba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(pid == 0)
    2cc0:	74 4a                	je     2d0c <forktest+0x6c>
  for(n=0; n<1000; n++){
    2cc2:	83 c3 01             	add    $0x1,%ebx
    2cc5:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2ccb:	74 6b                	je     2d38 <forktest+0x98>
    pid = fork();
    2ccd:	e8 3d 0c 00 00       	call   390f <fork>
    if(pid < 0)
    2cd2:	85 c0                	test   %eax,%eax
    2cd4:	79 ea                	jns    2cc0 <forktest+0x20>
  for(; n > 0; n--){
    2cd6:	85 db                	test   %ebx,%ebx
    2cd8:	74 14                	je     2cee <forktest+0x4e>
    2cda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
    2ce0:	e8 3a 0c 00 00       	call   391f <wait>
    2ce5:	85 c0                	test   %eax,%eax
    2ce7:	78 28                	js     2d11 <forktest+0x71>
  for(; n > 0; n--){
    2ce9:	83 eb 01             	sub    $0x1,%ebx
    2cec:	75 f2                	jne    2ce0 <forktest+0x40>
  if(wait() != -1){
    2cee:	e8 2c 0c 00 00       	call   391f <wait>
    2cf3:	83 f8 ff             	cmp    $0xffffffff,%eax
    2cf6:	75 2d                	jne    2d25 <forktest+0x85>
  printf(1, "fork test OK\n");
    2cf8:	83 ec 08             	sub    $0x8,%esp
    2cfb:	68 0a 4c 00 00       	push   $0x4c0a
    2d00:	6a 01                	push   $0x1
    2d02:	e8 79 0d 00 00       	call   3a80 <printf>
}
    2d07:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2d0a:	c9                   	leave
    2d0b:	c3                   	ret
      exit();
    2d0c:	e8 06 0c 00 00       	call   3917 <exit>
      printf(1, "wait stopped early\n");
    2d11:	83 ec 08             	sub    $0x8,%esp
    2d14:	68 e3 4b 00 00       	push   $0x4be3
    2d19:	6a 01                	push   $0x1
    2d1b:	e8 60 0d 00 00       	call   3a80 <printf>
      exit();
    2d20:	e8 f2 0b 00 00       	call   3917 <exit>
    printf(1, "wait got too many\n");
    2d25:	52                   	push   %edx
    2d26:	52                   	push   %edx
    2d27:	68 f7 4b 00 00       	push   $0x4bf7
    2d2c:	6a 01                	push   $0x1
    2d2e:	e8 4d 0d 00 00       	call   3a80 <printf>
    exit();
    2d33:	e8 df 0b 00 00       	call   3917 <exit>
    printf(1, "fork claimed to work 1000 times!\n");
    2d38:	50                   	push   %eax
    2d39:	50                   	push   %eax
    2d3a:	68 80 53 00 00       	push   $0x5380
    2d3f:	6a 01                	push   $0x1
    2d41:	e8 3a 0d 00 00       	call   3a80 <printf>
    exit();
    2d46:	e8 cc 0b 00 00       	call   3917 <exit>
    2d4b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00002d50 <sbrktest>:
{
    2d50:	55                   	push   %ebp
    2d51:	89 e5                	mov    %esp,%ebp
    2d53:	57                   	push   %edi
  for(i = 0; i < 5000; i++){
    2d54:	31 ff                	xor    %edi,%edi
{
    2d56:	56                   	push   %esi
    2d57:	53                   	push   %ebx
    2d58:	83 ec 64             	sub    $0x64,%esp
  printf(stdout, "sbrk test\n");
    2d5b:	68 18 4c 00 00       	push   $0x4c18
    2d60:	ff 35 5c 5f 00 00    	push   0x5f5c
    2d66:	e8 15 0d 00 00       	call   3a80 <printf>
  oldbrk = sbrk(0);
    2d6b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d72:	e8 28 0c 00 00       	call   399f <sbrk>
    2d77:	89 45 a4             	mov    %eax,-0x5c(%ebp)
  a = sbrk(0);
    2d7a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d81:	e8 19 0c 00 00       	call   399f <sbrk>
    2d86:	83 c4 10             	add    $0x10,%esp
    2d89:	89 c3                	mov    %eax,%ebx
  for(i = 0; i < 5000; i++){
    2d8b:	eb 06                	jmp    2d93 <sbrktest+0x43>
    2d8d:	8d 76 00             	lea    0x0(%esi),%esi
    2d90:	83 c3 01             	add    $0x1,%ebx
    b = sbrk(1);
    2d93:	83 ec 0c             	sub    $0xc,%esp
    2d96:	6a 01                	push   $0x1
    2d98:	e8 02 0c 00 00       	call   399f <sbrk>
    if(b != a){
    2d9d:	83 c4 10             	add    $0x10,%esp
    2da0:	39 d8                	cmp    %ebx,%eax
    2da2:	0f 85 a9 02 00 00    	jne    3051 <sbrktest+0x301>
  for(i = 0; i < 5000; i++){
    2da8:	83 c7 01             	add    $0x1,%edi
    *b = 1;
    2dab:	c6 03 01             	movb   $0x1,(%ebx)
  for(i = 0; i < 5000; i++){
    2dae:	81 ff 88 13 00 00    	cmp    $0x1388,%edi
    2db4:	75 da                	jne    2d90 <sbrktest+0x40>
  pid = fork();
    2db6:	e8 54 0b 00 00       	call   390f <fork>
    2dbb:	89 c7                	mov    %eax,%edi
  if(pid < 0){
    2dbd:	85 c0                	test   %eax,%eax
    2dbf:	0f 88 12 03 00 00    	js     30d7 <sbrktest+0x387>
  c = sbrk(1);
    2dc5:	83 ec 0c             	sub    $0xc,%esp
  if(c != a + 1){
    2dc8:	83 c3 02             	add    $0x2,%ebx
  c = sbrk(1);
    2dcb:	6a 01                	push   $0x1
    2dcd:	e8 cd 0b 00 00       	call   399f <sbrk>
  c = sbrk(1);
    2dd2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2dd9:	e8 c1 0b 00 00       	call   399f <sbrk>
  if(c != a + 1){
    2dde:	83 c4 10             	add    $0x10,%esp
    2de1:	39 d8                	cmp    %ebx,%eax
    2de3:	0f 85 4b 03 00 00    	jne    3134 <sbrktest+0x3e4>
  if(pid == 0)
    2de9:	85 ff                	test   %edi,%edi
    2deb:	0f 84 3e 03 00 00    	je     312f <sbrktest+0x3df>
  wait();
    2df1:	e8 29 0b 00 00       	call   391f <wait>
  a = sbrk(0);
    2df6:	83 ec 0c             	sub    $0xc,%esp
    2df9:	6a 00                	push   $0x0
    2dfb:	e8 9f 0b 00 00       	call   399f <sbrk>
    2e00:	89 c3                	mov    %eax,%ebx
  amt = (BIG) - (uint)a;
    2e02:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2e07:	29 d8                	sub    %ebx,%eax
  p = sbrk(amt);
    2e09:	89 04 24             	mov    %eax,(%esp)
    2e0c:	e8 8e 0b 00 00       	call   399f <sbrk>
  if (p != a) {
    2e11:	83 c4 10             	add    $0x10,%esp
    2e14:	39 c3                	cmp    %eax,%ebx
    2e16:	0f 85 a4 02 00 00    	jne    30c0 <sbrktest+0x370>
  a = sbrk(0);
    2e1c:	83 ec 0c             	sub    $0xc,%esp
  *lastaddr = 99;
    2e1f:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff
  a = sbrk(0);
    2e26:	6a 00                	push   $0x0
    2e28:	e8 72 0b 00 00       	call   399f <sbrk>
  c = sbrk(-4096);
    2e2d:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  a = sbrk(0);
    2e34:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    2e36:	e8 64 0b 00 00       	call   399f <sbrk>
  if(c == (char*)0xffffffff){
    2e3b:	83 c4 10             	add    $0x10,%esp
    2e3e:	83 f8 ff             	cmp    $0xffffffff,%eax
    2e41:	0f 84 32 03 00 00    	je     3179 <sbrktest+0x429>
  c = sbrk(0);
    2e47:	83 ec 0c             	sub    $0xc,%esp
    2e4a:	6a 00                	push   $0x0
    2e4c:	e8 4e 0b 00 00       	call   399f <sbrk>
  if(c != a - 4096){
    2e51:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    2e57:	83 c4 10             	add    $0x10,%esp
    2e5a:	39 d0                	cmp    %edx,%eax
    2e5c:	0f 85 00 03 00 00    	jne    3162 <sbrktest+0x412>
  a = sbrk(0);
    2e62:	83 ec 0c             	sub    $0xc,%esp
    2e65:	6a 00                	push   $0x0
    2e67:	e8 33 0b 00 00       	call   399f <sbrk>
  c = sbrk(4096);
    2e6c:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
  a = sbrk(0);
    2e73:	89 c3                	mov    %eax,%ebx
  c = sbrk(4096);
    2e75:	e8 25 0b 00 00       	call   399f <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    2e7a:	83 c4 10             	add    $0x10,%esp
  c = sbrk(4096);
    2e7d:	89 c7                	mov    %eax,%edi
  if(c != a || sbrk(0) != a + 4096){
    2e7f:	39 c3                	cmp    %eax,%ebx
    2e81:	0f 85 c4 02 00 00    	jne    314b <sbrktest+0x3fb>
    2e87:	83 ec 0c             	sub    $0xc,%esp
    2e8a:	6a 00                	push   $0x0
    2e8c:	e8 0e 0b 00 00       	call   399f <sbrk>
    2e91:	83 c4 10             	add    $0x10,%esp
    2e94:	89 c2                	mov    %eax,%edx
    2e96:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
    2e9c:	39 c2                	cmp    %eax,%edx
    2e9e:	0f 85 a7 02 00 00    	jne    314b <sbrktest+0x3fb>
  if(*lastaddr == 99){
    2ea4:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2eab:	0f 84 3d 02 00 00    	je     30ee <sbrktest+0x39e>
  a = sbrk(0);
    2eb1:	83 ec 0c             	sub    $0xc,%esp
    2eb4:	6a 00                	push   $0x0
    2eb6:	e8 e4 0a 00 00       	call   399f <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    2ebb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  a = sbrk(0);
    2ec2:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    2ec4:	e8 d6 0a 00 00       	call   399f <sbrk>
    2ec9:	89 c2                	mov    %eax,%edx
    2ecb:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    2ece:	29 d0                	sub    %edx,%eax
    2ed0:	89 04 24             	mov    %eax,(%esp)
    2ed3:	e8 c7 0a 00 00       	call   399f <sbrk>
  if(c != a){
    2ed8:	83 c4 10             	add    $0x10,%esp
    2edb:	39 c3                	cmp    %eax,%ebx
    2edd:	0f 85 c6 01 00 00    	jne    30a9 <sbrktest+0x359>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2ee3:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    2ee8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    2eef:	00 
    ppid = getpid();
    2ef0:	e8 a2 0a 00 00       	call   3997 <getpid>
    2ef5:	89 c7                	mov    %eax,%edi
    pid = fork();
    2ef7:	e8 13 0a 00 00       	call   390f <fork>
    if(pid < 0){
    2efc:	85 c0                	test   %eax,%eax
    2efe:	0f 88 6b 01 00 00    	js     306f <sbrktest+0x31f>
    if(pid == 0){
    2f04:	0f 84 7d 01 00 00    	je     3087 <sbrktest+0x337>
    wait();
    2f0a:	e8 10 0a 00 00       	call   391f <wait>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2f0f:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    2f15:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    2f1b:	75 d3                	jne    2ef0 <sbrktest+0x1a0>
  if(pipe(fds) != 0){
    2f1d:	83 ec 0c             	sub    $0xc,%esp
    2f20:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2f23:	50                   	push   %eax
    2f24:	e8 fe 09 00 00       	call   3927 <pipe>
    2f29:	83 c4 10             	add    $0x10,%esp
    2f2c:	85 c0                	test   %eax,%eax
    2f2e:	0f 85 e8 01 00 00    	jne    311c <sbrktest+0x3cc>
    2f34:	8d 5d c0             	lea    -0x40(%ebp),%ebx
      read(fds[0], &scratch, 1);
    2f37:	8d 7d b7             	lea    -0x49(%ebp),%edi
  if(pipe(fds) != 0){
    2f3a:	89 de                	mov    %ebx,%esi
    2f3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((pids[i] = fork()) == 0){
    2f40:	e8 ca 09 00 00       	call   390f <fork>
    2f45:	89 06                	mov    %eax,(%esi)
    2f47:	85 c0                	test   %eax,%eax
    2f49:	0f 84 9c 00 00 00    	je     2feb <sbrktest+0x29b>
    if(pids[i] != -1)
    2f4f:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f52:	74 11                	je     2f65 <sbrktest+0x215>
      read(fds[0], &scratch, 1);
    2f54:	83 ec 04             	sub    $0x4,%esp
    2f57:	6a 01                	push   $0x1
    2f59:	57                   	push   %edi
    2f5a:	ff 75 b8             	push   -0x48(%ebp)
    2f5d:	e8 cd 09 00 00       	call   392f <read>
    2f62:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2f65:	83 c6 04             	add    $0x4,%esi
    2f68:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2f6b:	39 c6                	cmp    %eax,%esi
    2f6d:	75 d1                	jne    2f40 <sbrktest+0x1f0>
  c = sbrk(4096);
    2f6f:	83 ec 0c             	sub    $0xc,%esp
    2f72:	68 00 10 00 00       	push   $0x1000
    2f77:	e8 23 0a 00 00       	call   399f <sbrk>
    2f7c:	83 c4 10             	add    $0x10,%esp
    2f7f:	89 c7                	mov    %eax,%edi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2f81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2f88:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    2f8f:	00 
    if(pids[i] == -1)
    2f90:	8b 03                	mov    (%ebx),%eax
    2f92:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f95:	74 11                	je     2fa8 <sbrktest+0x258>
    kill(pids[i]);
    2f97:	83 ec 0c             	sub    $0xc,%esp
    2f9a:	50                   	push   %eax
    2f9b:	e8 a7 09 00 00       	call   3947 <kill>
    wait();
    2fa0:	e8 7a 09 00 00       	call   391f <wait>
    2fa5:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2fa8:	83 c3 04             	add    $0x4,%ebx
    2fab:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2fae:	39 c3                	cmp    %eax,%ebx
    2fb0:	75 de                	jne    2f90 <sbrktest+0x240>
  if(c == (char*)0xffffffff){
    2fb2:	83 ff ff             	cmp    $0xffffffff,%edi
    2fb5:	0f 84 4a 01 00 00    	je     3105 <sbrktest+0x3b5>
  if(sbrk(0) > oldbrk)
    2fbb:	83 ec 0c             	sub    $0xc,%esp
    2fbe:	6a 00                	push   $0x0
    2fc0:	e8 da 09 00 00       	call   399f <sbrk>
    2fc5:	83 c4 10             	add    $0x10,%esp
    2fc8:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
    2fcb:	72 65                	jb     3032 <sbrktest+0x2e2>
  printf(stdout, "sbrk test OK\n");
    2fcd:	83 ec 08             	sub    $0x8,%esp
    2fd0:	68 c0 4c 00 00       	push   $0x4cc0
    2fd5:	ff 35 5c 5f 00 00    	push   0x5f5c
    2fdb:	e8 a0 0a 00 00       	call   3a80 <printf>
}
    2fe0:	83 c4 10             	add    $0x10,%esp
    2fe3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2fe6:	5b                   	pop    %ebx
    2fe7:	5e                   	pop    %esi
    2fe8:	5f                   	pop    %edi
    2fe9:	5d                   	pop    %ebp
    2fea:	c3                   	ret
      sbrk(BIG - (uint)sbrk(0));
    2feb:	83 ec 0c             	sub    $0xc,%esp
    2fee:	6a 00                	push   $0x0
    2ff0:	e8 aa 09 00 00       	call   399f <sbrk>
    2ff5:	89 c2                	mov    %eax,%edx
    2ff7:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2ffc:	29 d0                	sub    %edx,%eax
    2ffe:	89 04 24             	mov    %eax,(%esp)
    3001:	e8 99 09 00 00       	call   399f <sbrk>
      write(fds[1], "x", 1);
    3006:	83 c4 0c             	add    $0xc,%esp
    3009:	6a 01                	push   $0x1
    300b:	68 81 47 00 00       	push   $0x4781
    3010:	ff 75 bc             	push   -0x44(%ebp)
    3013:	e8 1f 09 00 00       	call   3937 <write>
    3018:	83 c4 10             	add    $0x10,%esp
    301b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
      for(;;) sleep(1000);
    3020:	83 ec 0c             	sub    $0xc,%esp
    3023:	68 e8 03 00 00       	push   $0x3e8
    3028:	e8 7a 09 00 00       	call   39a7 <sleep>
    302d:	83 c4 10             	add    $0x10,%esp
    3030:	eb ee                	jmp    3020 <sbrktest+0x2d0>
    sbrk(-(sbrk(0) - oldbrk));
    3032:	83 ec 0c             	sub    $0xc,%esp
    3035:	6a 00                	push   $0x0
    3037:	e8 63 09 00 00       	call   399f <sbrk>
    303c:	8b 75 a4             	mov    -0x5c(%ebp),%esi
    303f:	29 c6                	sub    %eax,%esi
    3041:	89 34 24             	mov    %esi,(%esp)
    3044:	e8 56 09 00 00       	call   399f <sbrk>
    3049:	83 c4 10             	add    $0x10,%esp
    304c:	e9 7c ff ff ff       	jmp    2fcd <sbrktest+0x27d>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    3051:	83 ec 0c             	sub    $0xc,%esp
    3054:	50                   	push   %eax
    3055:	53                   	push   %ebx
    3056:	57                   	push   %edi
    3057:	68 23 4c 00 00       	push   $0x4c23
    305c:	ff 35 5c 5f 00 00    	push   0x5f5c
    3062:	e8 19 0a 00 00       	call   3a80 <printf>
      exit();
    3067:	83 c4 20             	add    $0x20,%esp
    306a:	e8 a8 08 00 00       	call   3917 <exit>
      printf(stdout, "fork failed\n");
    306f:	83 ec 08             	sub    $0x8,%esp
    3072:	68 69 4d 00 00       	push   $0x4d69
    3077:	ff 35 5c 5f 00 00    	push   0x5f5c
    307d:	e8 fe 09 00 00       	call   3a80 <printf>
      exit();
    3082:	e8 90 08 00 00       	call   3917 <exit>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    3087:	0f be 03             	movsbl (%ebx),%eax
    308a:	50                   	push   %eax
    308b:	53                   	push   %ebx
    308c:	68 8c 4c 00 00       	push   $0x4c8c
    3091:	ff 35 5c 5f 00 00    	push   0x5f5c
    3097:	e8 e4 09 00 00       	call   3a80 <printf>
      kill(ppid);
    309c:	89 3c 24             	mov    %edi,(%esp)
    309f:	e8 a3 08 00 00       	call   3947 <kill>
      exit();
    30a4:	e8 6e 08 00 00       	call   3917 <exit>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    30a9:	50                   	push   %eax
    30aa:	53                   	push   %ebx
    30ab:	68 74 54 00 00       	push   $0x5474
    30b0:	ff 35 5c 5f 00 00    	push   0x5f5c
    30b6:	e8 c5 09 00 00       	call   3a80 <printf>
    exit();
    30bb:	e8 57 08 00 00       	call   3917 <exit>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    30c0:	56                   	push   %esi
    30c1:	56                   	push   %esi
    30c2:	68 a4 53 00 00       	push   $0x53a4
    30c7:	ff 35 5c 5f 00 00    	push   0x5f5c
    30cd:	e8 ae 09 00 00       	call   3a80 <printf>
    exit();
    30d2:	e8 40 08 00 00       	call   3917 <exit>
    printf(stdout, "sbrk test fork failed\n");
    30d7:	50                   	push   %eax
    30d8:	50                   	push   %eax
    30d9:	68 3e 4c 00 00       	push   $0x4c3e
    30de:	ff 35 5c 5f 00 00    	push   0x5f5c
    30e4:	e8 97 09 00 00       	call   3a80 <printf>
    exit();
    30e9:	e8 29 08 00 00       	call   3917 <exit>
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    30ee:	51                   	push   %ecx
    30ef:	51                   	push   %ecx
    30f0:	68 44 54 00 00       	push   $0x5444
    30f5:	ff 35 5c 5f 00 00    	push   0x5f5c
    30fb:	e8 80 09 00 00       	call   3a80 <printf>
    exit();
    3100:	e8 12 08 00 00       	call   3917 <exit>
    printf(stdout, "failed sbrk leaked memory\n");
    3105:	50                   	push   %eax
    3106:	50                   	push   %eax
    3107:	68 a5 4c 00 00       	push   $0x4ca5
    310c:	ff 35 5c 5f 00 00    	push   0x5f5c
    3112:	e8 69 09 00 00       	call   3a80 <printf>
    exit();
    3117:	e8 fb 07 00 00       	call   3917 <exit>
    printf(1, "pipe() failed\n");
    311c:	52                   	push   %edx
    311d:	52                   	push   %edx
    311e:	68 61 41 00 00       	push   $0x4161
    3123:	6a 01                	push   $0x1
    3125:	e8 56 09 00 00       	call   3a80 <printf>
    exit();
    312a:	e8 e8 07 00 00       	call   3917 <exit>
    exit();
    312f:	e8 e3 07 00 00       	call   3917 <exit>
    printf(stdout, "sbrk test failed post-fork\n");
    3134:	57                   	push   %edi
    3135:	57                   	push   %edi
    3136:	68 55 4c 00 00       	push   $0x4c55
    313b:	ff 35 5c 5f 00 00    	push   0x5f5c
    3141:	e8 3a 09 00 00       	call   3a80 <printf>
    exit();
    3146:	e8 cc 07 00 00       	call   3917 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    314b:	57                   	push   %edi
    314c:	53                   	push   %ebx
    314d:	68 1c 54 00 00       	push   $0x541c
    3152:	ff 35 5c 5f 00 00    	push   0x5f5c
    3158:	e8 23 09 00 00       	call   3a80 <printf>
    exit();
    315d:	e8 b5 07 00 00       	call   3917 <exit>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    3162:	50                   	push   %eax
    3163:	53                   	push   %ebx
    3164:	68 e4 53 00 00       	push   $0x53e4
    3169:	ff 35 5c 5f 00 00    	push   0x5f5c
    316f:	e8 0c 09 00 00       	call   3a80 <printf>
    exit();
    3174:	e8 9e 07 00 00       	call   3917 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    3179:	53                   	push   %ebx
    317a:	53                   	push   %ebx
    317b:	68 71 4c 00 00       	push   $0x4c71
    3180:	ff 35 5c 5f 00 00    	push   0x5f5c
    3186:	e8 f5 08 00 00       	call   3a80 <printf>
    exit();
    318b:	e8 87 07 00 00       	call   3917 <exit>

00003190 <validateint>:
}
    3190:	c3                   	ret
    3191:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3198:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    319f:	00 

000031a0 <validatetest>:
{
    31a0:	55                   	push   %ebp
    31a1:	89 e5                	mov    %esp,%ebp
    31a3:	56                   	push   %esi
  for(p = 0; p <= (uint)hi; p += 4096){
    31a4:	31 f6                	xor    %esi,%esi
{
    31a6:	53                   	push   %ebx
  printf(stdout, "validate test\n");
    31a7:	83 ec 08             	sub    $0x8,%esp
    31aa:	68 ce 4c 00 00       	push   $0x4cce
    31af:	ff 35 5c 5f 00 00    	push   0x5f5c
    31b5:	e8 c6 08 00 00       	call   3a80 <printf>
    31ba:	83 c4 10             	add    $0x10,%esp
    31bd:	8d 76 00             	lea    0x0(%esi),%esi
    if((pid = fork()) == 0){
    31c0:	e8 4a 07 00 00       	call   390f <fork>
    31c5:	89 c3                	mov    %eax,%ebx
    31c7:	85 c0                	test   %eax,%eax
    31c9:	74 63                	je     322e <validatetest+0x8e>
    sleep(0);
    31cb:	83 ec 0c             	sub    $0xc,%esp
    31ce:	6a 00                	push   $0x0
    31d0:	e8 d2 07 00 00       	call   39a7 <sleep>
    sleep(0);
    31d5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    31dc:	e8 c6 07 00 00       	call   39a7 <sleep>
    kill(pid);
    31e1:	89 1c 24             	mov    %ebx,(%esp)
    31e4:	e8 5e 07 00 00       	call   3947 <kill>
    wait();
    31e9:	e8 31 07 00 00       	call   391f <wait>
    if(link("nosuchfile", (char*)p) != -1){
    31ee:	58                   	pop    %eax
    31ef:	5a                   	pop    %edx
    31f0:	56                   	push   %esi
    31f1:	68 dd 4c 00 00       	push   $0x4cdd
    31f6:	e8 7c 07 00 00       	call   3977 <link>
    31fb:	83 c4 10             	add    $0x10,%esp
    31fe:	83 f8 ff             	cmp    $0xffffffff,%eax
    3201:	75 30                	jne    3233 <validatetest+0x93>
  for(p = 0; p <= (uint)hi; p += 4096){
    3203:	81 c6 00 10 00 00    	add    $0x1000,%esi
    3209:	81 fe 00 40 11 00    	cmp    $0x114000,%esi
    320f:	75 af                	jne    31c0 <validatetest+0x20>
  printf(stdout, "validate ok\n");
    3211:	83 ec 08             	sub    $0x8,%esp
    3214:	68 01 4d 00 00       	push   $0x4d01
    3219:	ff 35 5c 5f 00 00    	push   0x5f5c
    321f:	e8 5c 08 00 00       	call   3a80 <printf>
}
    3224:	83 c4 10             	add    $0x10,%esp
    3227:	8d 65 f8             	lea    -0x8(%ebp),%esp
    322a:	5b                   	pop    %ebx
    322b:	5e                   	pop    %esi
    322c:	5d                   	pop    %ebp
    322d:	c3                   	ret
      exit();
    322e:	e8 e4 06 00 00       	call   3917 <exit>
      printf(stdout, "link should not succeed\n");
    3233:	83 ec 08             	sub    $0x8,%esp
    3236:	68 e8 4c 00 00       	push   $0x4ce8
    323b:	ff 35 5c 5f 00 00    	push   0x5f5c
    3241:	e8 3a 08 00 00       	call   3a80 <printf>
      exit();
    3246:	e8 cc 06 00 00       	call   3917 <exit>
    324b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00003250 <bsstest>:
{
    3250:	55                   	push   %ebp
    3251:	89 e5                	mov    %esp,%ebp
    3253:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "bss test\n");
    3256:	68 0e 4d 00 00       	push   $0x4d0e
    325b:	ff 35 5c 5f 00 00    	push   0x5f5c
    3261:	e8 1a 08 00 00       	call   3a80 <printf>
    3266:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(uninit); i++){
    3269:	31 c0                	xor    %eax,%eax
    326b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    3270:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    3277:	00 
    3278:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    327f:	00 
    if(uninit[i] != '\0'){
    3280:	80 b8 80 5f 00 00 00 	cmpb   $0x0,0x5f80(%eax)
    3287:	75 22                	jne    32ab <bsstest+0x5b>
  for(i = 0; i < sizeof(uninit); i++){
    3289:	83 c0 01             	add    $0x1,%eax
    328c:	3d 10 27 00 00       	cmp    $0x2710,%eax
    3291:	75 ed                	jne    3280 <bsstest+0x30>
  printf(stdout, "bss test ok\n");
    3293:	83 ec 08             	sub    $0x8,%esp
    3296:	68 29 4d 00 00       	push   $0x4d29
    329b:	ff 35 5c 5f 00 00    	push   0x5f5c
    32a1:	e8 da 07 00 00       	call   3a80 <printf>
}
    32a6:	83 c4 10             	add    $0x10,%esp
    32a9:	c9                   	leave
    32aa:	c3                   	ret
      printf(stdout, "bss test failed\n");
    32ab:	83 ec 08             	sub    $0x8,%esp
    32ae:	68 18 4d 00 00       	push   $0x4d18
    32b3:	ff 35 5c 5f 00 00    	push   0x5f5c
    32b9:	e8 c2 07 00 00       	call   3a80 <printf>
      exit();
    32be:	e8 54 06 00 00       	call   3917 <exit>
    32c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    32c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    32cf:	00 

000032d0 <bigargtest>:
{
    32d0:	55                   	push   %ebp
    32d1:	89 e5                	mov    %esp,%ebp
    32d3:	83 ec 14             	sub    $0x14,%esp
  unlink("bigarg-ok");
    32d6:	68 36 4d 00 00       	push   $0x4d36
    32db:	e8 87 06 00 00       	call   3967 <unlink>
  pid = fork();
    32e0:	e8 2a 06 00 00       	call   390f <fork>
  if(pid == 0){
    32e5:	83 c4 10             	add    $0x10,%esp
    32e8:	85 c0                	test   %eax,%eax
    32ea:	74 3f                	je     332b <bigargtest+0x5b>
  } else if(pid < 0){
    32ec:	0f 88 d9 00 00 00    	js     33cb <bigargtest+0xfb>
  wait();
    32f2:	e8 28 06 00 00       	call   391f <wait>
  fd = open("bigarg-ok", 0);
    32f7:	83 ec 08             	sub    $0x8,%esp
    32fa:	6a 00                	push   $0x0
    32fc:	68 36 4d 00 00       	push   $0x4d36
    3301:	e8 51 06 00 00       	call   3957 <open>
  if(fd < 0){
    3306:	83 c4 10             	add    $0x10,%esp
    3309:	85 c0                	test   %eax,%eax
    330b:	0f 88 a3 00 00 00    	js     33b4 <bigargtest+0xe4>
  close(fd);
    3311:	83 ec 0c             	sub    $0xc,%esp
    3314:	50                   	push   %eax
    3315:	e8 25 06 00 00       	call   393f <close>
  unlink("bigarg-ok");
    331a:	c7 04 24 36 4d 00 00 	movl   $0x4d36,(%esp)
    3321:	e8 41 06 00 00       	call   3967 <unlink>
}
    3326:	83 c4 10             	add    $0x10,%esp
    3329:	c9                   	leave
    332a:	c3                   	ret
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    332b:	c7 04 85 a0 a6 00 00 	movl   $0x5498,0xa6a0(,%eax,4)
    3332:	98 54 00 00 
    for(i = 0; i < MAXARG-1; i++)
    3336:	b8 01 00 00 00       	mov    $0x1,%eax
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    333b:	c7 04 85 a0 a6 00 00 	movl   $0x5498,0xa6a0(,%eax,4)
    3342:	98 54 00 00 
    3346:	c7 04 85 a4 a6 00 00 	movl   $0x5498,0xa6a4(,%eax,4)
    334d:	98 54 00 00 
    for(i = 0; i < MAXARG-1; i++)
    3351:	83 c0 02             	add    $0x2,%eax
    3354:	83 f8 1f             	cmp    $0x1f,%eax
    3357:	75 e2                	jne    333b <bigargtest+0x6b>
    printf(stdout, "bigarg test\n");
    3359:	50                   	push   %eax
    args[MAXARG-1] = 0;
    335a:	31 c9                	xor    %ecx,%ecx
    printf(stdout, "bigarg test\n");
    335c:	50                   	push   %eax
    335d:	68 40 4d 00 00       	push   $0x4d40
    3362:	ff 35 5c 5f 00 00    	push   0x5f5c
    args[MAXARG-1] = 0;
    3368:	89 0d 1c a7 00 00    	mov    %ecx,0xa71c
    printf(stdout, "bigarg test\n");
    336e:	e8 0d 07 00 00       	call   3a80 <printf>
    exec("echo", args);
    3373:	58                   	pop    %eax
    3374:	5a                   	pop    %edx
    3375:	68 a0 a6 00 00       	push   $0xa6a0
    337a:	68 0d 3f 00 00       	push   $0x3f0d
    337f:	e8 cb 05 00 00       	call   394f <exec>
    printf(stdout, "bigarg test ok\n");
    3384:	59                   	pop    %ecx
    3385:	58                   	pop    %eax
    3386:	68 4d 4d 00 00       	push   $0x4d4d
    338b:	ff 35 5c 5f 00 00    	push   0x5f5c
    3391:	e8 ea 06 00 00       	call   3a80 <printf>
    fd = open("bigarg-ok", O_CREATE);
    3396:	58                   	pop    %eax
    3397:	5a                   	pop    %edx
    3398:	68 00 02 00 00       	push   $0x200
    339d:	68 36 4d 00 00       	push   $0x4d36
    33a2:	e8 b0 05 00 00       	call   3957 <open>
    close(fd);
    33a7:	89 04 24             	mov    %eax,(%esp)
    33aa:	e8 90 05 00 00       	call   393f <close>
    exit();
    33af:	e8 63 05 00 00       	call   3917 <exit>
    printf(stdout, "bigarg test failed!\n");
    33b4:	50                   	push   %eax
    33b5:	50                   	push   %eax
    33b6:	68 76 4d 00 00       	push   $0x4d76
    33bb:	ff 35 5c 5f 00 00    	push   0x5f5c
    33c1:	e8 ba 06 00 00       	call   3a80 <printf>
    exit();
    33c6:	e8 4c 05 00 00       	call   3917 <exit>
    printf(stdout, "bigargtest: fork failed\n");
    33cb:	52                   	push   %edx
    33cc:	52                   	push   %edx
    33cd:	68 5d 4d 00 00       	push   $0x4d5d
    33d2:	ff 35 5c 5f 00 00    	push   0x5f5c
    33d8:	e8 a3 06 00 00       	call   3a80 <printf>
    exit();
    33dd:	e8 35 05 00 00       	call   3917 <exit>
    33e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    33e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    33ef:	00 

000033f0 <fsfull>:
{
    33f0:	55                   	push   %ebp
    33f1:	89 e5                	mov    %esp,%ebp
    33f3:	57                   	push   %edi
    33f4:	56                   	push   %esi
    33f5:	8d 7d a8             	lea    -0x58(%ebp),%edi
    33f8:	53                   	push   %ebx
  for(nfiles = 0; ; nfiles++){
    33f9:	31 db                	xor    %ebx,%ebx
{
    33fb:	83 ec 64             	sub    $0x64,%esp
  printf(1, "fsfull test\n");
    33fe:	68 8b 4d 00 00       	push   $0x4d8b
    3403:	6a 01                	push   $0x1
    3405:	e8 76 06 00 00       	call   3a80 <printf>
    340a:	83 c4 10             	add    $0x10,%esp
    name[1] = '0' + nfiles / 1000;
    340d:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    3412:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    printf(1, "writing %s\n", name);
    3417:	83 ec 04             	sub    $0x4,%esp
    name[0] = 'f';
    341a:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    341e:	f7 e3                	mul    %ebx
    name[5] = '\0';
    3420:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    3424:	c1 ea 06             	shr    $0x6,%edx
    3427:	8d 42 30             	lea    0x30(%edx),%eax
    342a:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    342d:	69 c2 e8 03 00 00    	imul   $0x3e8,%edx,%eax
    3433:	89 da                	mov    %ebx,%edx
    3435:	29 c2                	sub    %eax,%edx
    3437:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    343c:	f7 e2                	mul    %edx
    name[3] = '0' + (nfiles % 100) / 10;
    343e:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    3443:	c1 ea 05             	shr    $0x5,%edx
    3446:	83 c2 30             	add    $0x30,%edx
    3449:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    344c:	f7 e3                	mul    %ebx
    344e:	c1 ea 05             	shr    $0x5,%edx
    3451:	6b c2 64             	imul   $0x64,%edx,%eax
    3454:	89 da                	mov    %ebx,%edx
    3456:	29 c2                	sub    %eax,%edx
    3458:	89 d0                	mov    %edx,%eax
    345a:	f7 e1                	mul    %ecx
    name[4] = '0' + (nfiles % 10);
    345c:	89 d8                	mov    %ebx,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    345e:	c1 ea 03             	shr    $0x3,%edx
    3461:	83 c2 30             	add    $0x30,%edx
    3464:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    3467:	f7 e1                	mul    %ecx
    3469:	89 d8                	mov    %ebx,%eax
    346b:	c1 ea 03             	shr    $0x3,%edx
    346e:	8d 14 92             	lea    (%edx,%edx,4),%edx
    3471:	01 d2                	add    %edx,%edx
    3473:	29 d0                	sub    %edx,%eax
    3475:	83 c0 30             	add    $0x30,%eax
    3478:	88 45 ac             	mov    %al,-0x54(%ebp)
    printf(1, "writing %s\n", name);
    347b:	57                   	push   %edi
    347c:	68 98 4d 00 00       	push   $0x4d98
    3481:	6a 01                	push   $0x1
    3483:	e8 f8 05 00 00       	call   3a80 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    3488:	58                   	pop    %eax
    3489:	5a                   	pop    %edx
    348a:	68 02 02 00 00       	push   $0x202
    348f:	57                   	push   %edi
    3490:	e8 c2 04 00 00       	call   3957 <open>
    if(fd < 0){
    3495:	83 c4 10             	add    $0x10,%esp
    3498:	85 c0                	test   %eax,%eax
    349a:	0f 89 b8 00 00 00    	jns    3558 <fsfull+0x168>
      printf(1, "open %s failed\n", name);
    34a0:	83 ec 04             	sub    $0x4,%esp
    34a3:	57                   	push   %edi
    34a4:	68 a4 4d 00 00       	push   $0x4da4
    34a9:	6a 01                	push   $0x1
    34ab:	e8 d0 05 00 00       	call   3a80 <printf>
      break;
    34b0:	83 c4 10             	add    $0x10,%esp
    name[2] = '0' + (nfiles % 1000) / 100;
    34b3:	be 1f 85 eb 51       	mov    $0x51eb851f,%esi
    34b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    34bf:	00 
    name[1] = '0' + nfiles / 1000;
    34c0:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    unlink(name);
    34c5:	83 ec 0c             	sub    $0xc,%esp
    name[0] = 'f';
    34c8:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    34cc:	f7 e3                	mul    %ebx
    name[5] = '\0';
    34ce:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    34d2:	c1 ea 06             	shr    $0x6,%edx
    34d5:	8d 42 30             	lea    0x30(%edx),%eax
    34d8:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    34db:	69 c2 e8 03 00 00    	imul   $0x3e8,%edx,%eax
    34e1:	89 da                	mov    %ebx,%edx
    34e3:	29 c2                	sub    %eax,%edx
    34e5:	89 d0                	mov    %edx,%eax
    34e7:	f7 e6                	mul    %esi
    name[3] = '0' + (nfiles % 100) / 10;
    34e9:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    34eb:	c1 ea 05             	shr    $0x5,%edx
    34ee:	83 c2 30             	add    $0x30,%edx
    34f1:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    34f4:	f7 e6                	mul    %esi
    34f6:	c1 ea 05             	shr    $0x5,%edx
    34f9:	6b ca 64             	imul   $0x64,%edx,%ecx
    34fc:	89 da                	mov    %ebx,%edx
    34fe:	29 ca                	sub    %ecx,%edx
    3500:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    3505:	89 d0                	mov    %edx,%eax
    3507:	f7 e1                	mul    %ecx
    name[4] = '0' + (nfiles % 10);
    3509:	89 d8                	mov    %ebx,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    350b:	c1 ea 03             	shr    $0x3,%edx
    350e:	83 c2 30             	add    $0x30,%edx
    3511:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    3514:	f7 e1                	mul    %ecx
    3516:	89 d8                	mov    %ebx,%eax
    nfiles--;
    3518:	83 eb 01             	sub    $0x1,%ebx
    name[4] = '0' + (nfiles % 10);
    351b:	c1 ea 03             	shr    $0x3,%edx
    351e:	8d 14 92             	lea    (%edx,%edx,4),%edx
    3521:	01 d2                	add    %edx,%edx
    3523:	29 d0                	sub    %edx,%eax
    3525:	83 c0 30             	add    $0x30,%eax
    3528:	88 45 ac             	mov    %al,-0x54(%ebp)
    unlink(name);
    352b:	57                   	push   %edi
    352c:	e8 36 04 00 00       	call   3967 <unlink>
  while(nfiles >= 0){
    3531:	83 c4 10             	add    $0x10,%esp
    3534:	83 fb ff             	cmp    $0xffffffff,%ebx
    3537:	75 87                	jne    34c0 <fsfull+0xd0>
  printf(1, "fsfull test finished\n");
    3539:	83 ec 08             	sub    $0x8,%esp
    353c:	68 c4 4d 00 00       	push   $0x4dc4
    3541:	6a 01                	push   $0x1
    3543:	e8 38 05 00 00       	call   3a80 <printf>
}
    3548:	83 c4 10             	add    $0x10,%esp
    354b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    354e:	5b                   	pop    %ebx
    354f:	5e                   	pop    %esi
    3550:	5f                   	pop    %edi
    3551:	5d                   	pop    %ebp
    3552:	c3                   	ret
    3553:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    int total = 0;
    3558:	89 5d a4             	mov    %ebx,-0x5c(%ebp)
    355b:	31 f6                	xor    %esi,%esi
    355d:	89 c3                	mov    %eax,%ebx
    355f:	eb 09                	jmp    356a <fsfull+0x17a>
    3561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      total += cc;
    3568:	01 c6                	add    %eax,%esi
      int cc = write(fd, buf, 512);
    356a:	83 ec 04             	sub    $0x4,%esp
    356d:	68 00 02 00 00       	push   $0x200
    3572:	68 a0 86 00 00       	push   $0x86a0
    3577:	53                   	push   %ebx
    3578:	e8 ba 03 00 00       	call   3937 <write>
      if(cc < 512)
    357d:	83 c4 10             	add    $0x10,%esp
    3580:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    3585:	7f e1                	jg     3568 <fsfull+0x178>
    printf(1, "wrote %d bytes\n", total);
    3587:	83 ec 04             	sub    $0x4,%esp
    358a:	89 5d a0             	mov    %ebx,-0x60(%ebp)
    358d:	8b 5d a4             	mov    -0x5c(%ebp),%ebx
    3590:	56                   	push   %esi
    3591:	68 b4 4d 00 00       	push   $0x4db4
    3596:	6a 01                	push   $0x1
    3598:	e8 e3 04 00 00       	call   3a80 <printf>
    close(fd);
    359d:	8b 55 a0             	mov    -0x60(%ebp),%edx
    35a0:	89 14 24             	mov    %edx,(%esp)
    35a3:	e8 97 03 00 00       	call   393f <close>
    if(total == 0)
    35a8:	83 c4 10             	add    $0x10,%esp
    35ab:	85 f6                	test   %esi,%esi
    35ad:	0f 84 00 ff ff ff    	je     34b3 <fsfull+0xc3>
  for(nfiles = 0; ; nfiles++){
    35b3:	83 c3 01             	add    $0x1,%ebx
    35b6:	e9 52 fe ff ff       	jmp    340d <fsfull+0x1d>
    35bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000035c0 <uio>:
{
    35c0:	55                   	push   %ebp
    35c1:	89 e5                	mov    %esp,%ebp
    35c3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "uio test\n");
    35c6:	68 da 4d 00 00       	push   $0x4dda
    35cb:	6a 01                	push   $0x1
    35cd:	e8 ae 04 00 00       	call   3a80 <printf>
  pid = fork();
    35d2:	e8 38 03 00 00       	call   390f <fork>
  if(pid == 0){
    35d7:	83 c4 10             	add    $0x10,%esp
    35da:	85 c0                	test   %eax,%eax
    35dc:	74 1b                	je     35f9 <uio+0x39>
  } else if(pid < 0){
    35de:	78 3d                	js     361d <uio+0x5d>
  wait();
    35e0:	e8 3a 03 00 00       	call   391f <wait>
  printf(1, "uio test done\n");
    35e5:	83 ec 08             	sub    $0x8,%esp
    35e8:	68 e4 4d 00 00       	push   $0x4de4
    35ed:	6a 01                	push   $0x1
    35ef:	e8 8c 04 00 00       	call   3a80 <printf>
}
    35f4:	83 c4 10             	add    $0x10,%esp
    35f7:	c9                   	leave
    35f8:	c3                   	ret
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    35f9:	b8 09 00 00 00       	mov    $0x9,%eax
    35fe:	ba 70 00 00 00       	mov    $0x70,%edx
    3603:	ee                   	out    %al,(%dx)
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    3604:	ba 71 00 00 00       	mov    $0x71,%edx
    3609:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    360a:	52                   	push   %edx
    360b:	52                   	push   %edx
    360c:	68 78 55 00 00       	push   $0x5578
    3611:	6a 01                	push   $0x1
    3613:	e8 68 04 00 00       	call   3a80 <printf>
    exit();
    3618:	e8 fa 02 00 00       	call   3917 <exit>
    printf (1, "fork failed\n");
    361d:	50                   	push   %eax
    361e:	50                   	push   %eax
    361f:	68 69 4d 00 00       	push   $0x4d69
    3624:	6a 01                	push   $0x1
    3626:	e8 55 04 00 00       	call   3a80 <printf>
    exit();
    362b:	e8 e7 02 00 00       	call   3917 <exit>

00003630 <argptest>:
{
    3630:	55                   	push   %ebp
    3631:	89 e5                	mov    %esp,%ebp
    3633:	53                   	push   %ebx
    3634:	83 ec 0c             	sub    $0xc,%esp
  fd = open("init", O_RDONLY);
    3637:	6a 00                	push   $0x0
    3639:	68 f3 4d 00 00       	push   $0x4df3
    363e:	e8 14 03 00 00       	call   3957 <open>
  if (fd < 0) {
    3643:	83 c4 10             	add    $0x10,%esp
    3646:	85 c0                	test   %eax,%eax
    3648:	78 39                	js     3683 <argptest+0x53>
  read(fd, sbrk(0) - 1, -1);
    364a:	83 ec 0c             	sub    $0xc,%esp
    364d:	89 c3                	mov    %eax,%ebx
    364f:	6a 00                	push   $0x0
    3651:	e8 49 03 00 00       	call   399f <sbrk>
    3656:	83 c4 0c             	add    $0xc,%esp
    3659:	83 e8 01             	sub    $0x1,%eax
    365c:	6a ff                	push   $0xffffffff
    365e:	50                   	push   %eax
    365f:	53                   	push   %ebx
    3660:	e8 ca 02 00 00       	call   392f <read>
  close(fd);
    3665:	89 1c 24             	mov    %ebx,(%esp)
    3668:	e8 d2 02 00 00       	call   393f <close>
  printf(1, "arg test passed\n");
    366d:	58                   	pop    %eax
    366e:	5a                   	pop    %edx
    366f:	68 05 4e 00 00       	push   $0x4e05
    3674:	6a 01                	push   $0x1
    3676:	e8 05 04 00 00       	call   3a80 <printf>
}
    367b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    367e:	83 c4 10             	add    $0x10,%esp
    3681:	c9                   	leave
    3682:	c3                   	ret
    printf(2, "open failed\n");
    3683:	51                   	push   %ecx
    3684:	51                   	push   %ecx
    3685:	68 f8 4d 00 00       	push   $0x4df8
    368a:	6a 02                	push   $0x2
    368c:	e8 ef 03 00 00       	call   3a80 <printf>
    exit();
    3691:	e8 81 02 00 00       	call   3917 <exit>
    3696:	66 90                	xchg   %ax,%ax
    3698:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    369f:	00 

000036a0 <rand>:
  randstate = randstate * 1664525 + 1013904223;
    36a0:	69 05 58 5f 00 00 0d 	imul   $0x19660d,0x5f58,%eax
    36a7:	66 19 00 
    36aa:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    36af:	a3 58 5f 00 00       	mov    %eax,0x5f58
}
    36b4:	c3                   	ret
    36b5:	66 90                	xchg   %ax,%ax
    36b7:	66 90                	xchg   %ax,%ax
    36b9:	66 90                	xchg   %ax,%ax
    36bb:	66 90                	xchg   %ax,%ax
    36bd:	66 90                	xchg   %ax,%ax
    36bf:	90                   	nop

000036c0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    36c0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    36c1:	31 c0                	xor    %eax,%eax
{
    36c3:	89 e5                	mov    %esp,%ebp
    36c5:	53                   	push   %ebx
    36c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
    36c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    36cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    36d0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    36d4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    36d7:	83 c0 01             	add    $0x1,%eax
    36da:	84 d2                	test   %dl,%dl
    36dc:	75 f2                	jne    36d0 <strcpy+0x10>
    ;
  return os;
}
    36de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    36e1:	89 c8                	mov    %ecx,%eax
    36e3:	c9                   	leave
    36e4:	c3                   	ret
    36e5:	8d 76 00             	lea    0x0(%esi),%esi
    36e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    36ef:	00 

000036f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    36f0:	55                   	push   %ebp
    36f1:	89 e5                	mov    %esp,%ebp
    36f3:	53                   	push   %ebx
    36f4:	8b 55 08             	mov    0x8(%ebp),%edx
    36f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    36fa:	0f b6 02             	movzbl (%edx),%eax
    36fd:	84 c0                	test   %al,%al
    36ff:	75 2d                	jne    372e <strcmp+0x3e>
    3701:	eb 3d                	jmp    3740 <strcmp+0x50>
    3703:	eb 1b                	jmp    3720 <strcmp+0x30>
    3705:	8d 76 00             	lea    0x0(%esi),%esi
    3708:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    370f:	00 
    3710:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    3717:	00 
    3718:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    371f:	00 
    3720:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    3724:	83 c2 01             	add    $0x1,%edx
    3727:	83 c1 01             	add    $0x1,%ecx
  while(*p && *p == *q)
    372a:	84 c0                	test   %al,%al
    372c:	74 12                	je     3740 <strcmp+0x50>
    372e:	0f b6 19             	movzbl (%ecx),%ebx
    3731:	38 c3                	cmp    %al,%bl
    3733:	74 eb                	je     3720 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
    3735:	29 d8                	sub    %ebx,%eax
}
    3737:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    373a:	c9                   	leave
    373b:	c3                   	ret
    373c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return (uchar)*p - (uchar)*q;
    3740:	0f b6 19             	movzbl (%ecx),%ebx
    3743:	31 c0                	xor    %eax,%eax
    3745:	29 d8                	sub    %ebx,%eax
}
    3747:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    374a:	c9                   	leave
    374b:	c3                   	ret
    374c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003750 <strlen>:

uint
strlen(const char *s)
{
    3750:	55                   	push   %ebp
    3751:	89 e5                	mov    %esp,%ebp
    3753:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    3756:	80 3a 00             	cmpb   $0x0,(%edx)
    3759:	74 15                	je     3770 <strlen+0x20>
    375b:	31 c0                	xor    %eax,%eax
    375d:	8d 76 00             	lea    0x0(%esi),%esi
    3760:	83 c0 01             	add    $0x1,%eax
    3763:	89 c1                	mov    %eax,%ecx
    3765:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    3769:	75 f5                	jne    3760 <strlen+0x10>
    ;
  return n;
}
    376b:	89 c8                	mov    %ecx,%eax
    376d:	5d                   	pop    %ebp
    376e:	c3                   	ret
    376f:	90                   	nop
  for(n = 0; s[n]; n++)
    3770:	31 c9                	xor    %ecx,%ecx
}
    3772:	5d                   	pop    %ebp
    3773:	89 c8                	mov    %ecx,%eax
    3775:	c3                   	ret
    3776:	66 90                	xchg   %ax,%ax
    3778:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    377f:	00 

00003780 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3780:	55                   	push   %ebp
    3781:	89 e5                	mov    %esp,%ebp
    3783:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    3784:	8b 4d 10             	mov    0x10(%ebp),%ecx
    3787:	8b 45 0c             	mov    0xc(%ebp),%eax
    378a:	8b 7d 08             	mov    0x8(%ebp),%edi
    378d:	fc                   	cld
    378e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    3790:	8b 45 08             	mov    0x8(%ebp),%eax
    3793:	8b 7d fc             	mov    -0x4(%ebp),%edi
    3796:	c9                   	leave
    3797:	c3                   	ret
    3798:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    379f:	00 

000037a0 <strchr>:

char*
strchr(const char *s, char c)
{
    37a0:	55                   	push   %ebp
    37a1:	89 e5                	mov    %esp,%ebp
    37a3:	8b 45 08             	mov    0x8(%ebp),%eax
    37a6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    37aa:	0f b6 10             	movzbl (%eax),%edx
    37ad:	84 d2                	test   %dl,%dl
    37af:	75 1a                	jne    37cb <strchr+0x2b>
    37b1:	eb 25                	jmp    37d8 <strchr+0x38>
    37b3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    37b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    37bf:	00 
    37c0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    37c4:	83 c0 01             	add    $0x1,%eax
    37c7:	84 d2                	test   %dl,%dl
    37c9:	74 0d                	je     37d8 <strchr+0x38>
    if(*s == c)
    37cb:	38 d1                	cmp    %dl,%cl
    37cd:	75 f1                	jne    37c0 <strchr+0x20>
      return (char*)s;
  return 0;
}
    37cf:	5d                   	pop    %ebp
    37d0:	c3                   	ret
    37d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    37d8:	31 c0                	xor    %eax,%eax
}
    37da:	5d                   	pop    %ebp
    37db:	c3                   	ret
    37dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000037e0 <gets>:

char*
gets(char *buf, int max)
{
    37e0:	55                   	push   %ebp
    37e1:	89 e5                	mov    %esp,%ebp
    37e3:	57                   	push   %edi
    37e4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    37e5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    37e8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    37e9:	31 db                	xor    %ebx,%ebx
{
    37eb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    37ee:	eb 27                	jmp    3817 <gets+0x37>
    cc = read(0, &c, 1);
    37f0:	83 ec 04             	sub    $0x4,%esp
    37f3:	6a 01                	push   $0x1
    37f5:	57                   	push   %edi
    37f6:	6a 00                	push   $0x0
    37f8:	e8 32 01 00 00       	call   392f <read>
    if(cc < 1)
    37fd:	83 c4 10             	add    $0x10,%esp
    3800:	85 c0                	test   %eax,%eax
    3802:	7e 1d                	jle    3821 <gets+0x41>
      break;
    buf[i++] = c;
    3804:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    3808:	8b 55 08             	mov    0x8(%ebp),%edx
    380b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    380f:	3c 0a                	cmp    $0xa,%al
    3811:	74 1d                	je     3830 <gets+0x50>
    3813:	3c 0d                	cmp    $0xd,%al
    3815:	74 19                	je     3830 <gets+0x50>
  for(i=0; i+1 < max; ){
    3817:	89 de                	mov    %ebx,%esi
    3819:	83 c3 01             	add    $0x1,%ebx
    381c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    381f:	7c cf                	jl     37f0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    3821:	8b 45 08             	mov    0x8(%ebp),%eax
    3824:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    3828:	8d 65 f4             	lea    -0xc(%ebp),%esp
    382b:	5b                   	pop    %ebx
    382c:	5e                   	pop    %esi
    382d:	5f                   	pop    %edi
    382e:	5d                   	pop    %ebp
    382f:	c3                   	ret
  buf[i] = '\0';
    3830:	8b 45 08             	mov    0x8(%ebp),%eax
    buf[i++] = c;
    3833:	89 de                	mov    %ebx,%esi
  buf[i] = '\0';
    3835:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    3839:	8d 65 f4             	lea    -0xc(%ebp),%esp
    383c:	5b                   	pop    %ebx
    383d:	5e                   	pop    %esi
    383e:	5f                   	pop    %edi
    383f:	5d                   	pop    %ebp
    3840:	c3                   	ret
    3841:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3848:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    384f:	00 

00003850 <stat>:

int
stat(const char *n, struct stat *st)
{
    3850:	55                   	push   %ebp
    3851:	89 e5                	mov    %esp,%ebp
    3853:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3856:	6a 00                	push   $0x0
    3858:	ff 75 08             	push   0x8(%ebp)
{
    385b:	89 75 fc             	mov    %esi,-0x4(%ebp)
  fd = open(n, O_RDONLY);
    385e:	e8 f4 00 00 00       	call   3957 <open>
  if(fd < 0)
    3863:	83 c4 10             	add    $0x10,%esp
    3866:	85 c0                	test   %eax,%eax
    3868:	78 2e                	js     3898 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    386a:	83 ec 08             	sub    $0x8,%esp
    386d:	ff 75 0c             	push   0xc(%ebp)
    3870:	50                   	push   %eax
    3871:	89 5d f8             	mov    %ebx,-0x8(%ebp)
    3874:	89 c3                	mov    %eax,%ebx
    3876:	e8 f4 00 00 00       	call   396f <fstat>
  close(fd);
    387b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    387e:	89 c6                	mov    %eax,%esi
  close(fd);
    3880:	e8 ba 00 00 00       	call   393f <close>
  return r;
    3885:	8b 5d f8             	mov    -0x8(%ebp),%ebx
    3888:	83 c4 10             	add    $0x10,%esp
}
    388b:	89 f0                	mov    %esi,%eax
    388d:	8b 75 fc             	mov    -0x4(%ebp),%esi
    3890:	c9                   	leave
    3891:	c3                   	ret
    3892:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
    3898:	be ff ff ff ff       	mov    $0xffffffff,%esi
    389d:	eb ec                	jmp    388b <stat+0x3b>
    389f:	90                   	nop

000038a0 <atoi>:

int
atoi(const char *s)
{
    38a0:	55                   	push   %ebp
    38a1:	89 e5                	mov    %esp,%ebp
    38a3:	53                   	push   %ebx
    38a4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    38a7:	0f be 02             	movsbl (%edx),%eax
    38aa:	8d 48 d0             	lea    -0x30(%eax),%ecx
    38ad:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    38b0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    38b5:	77 1e                	ja     38d5 <atoi+0x35>
    38b7:	90                   	nop
    38b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    38bf:	00 
    n = n*10 + *s++ - '0';
    38c0:	83 c2 01             	add    $0x1,%edx
    38c3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    38c6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    38ca:	0f be 02             	movsbl (%edx),%eax
    38cd:	8d 58 d0             	lea    -0x30(%eax),%ebx
    38d0:	80 fb 09             	cmp    $0x9,%bl
    38d3:	76 eb                	jbe    38c0 <atoi+0x20>
  return n;
}
    38d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    38d8:	89 c8                	mov    %ecx,%eax
    38da:	c9                   	leave
    38db:	c3                   	ret
    38dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000038e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    38e0:	55                   	push   %ebp
    38e1:	89 e5                	mov    %esp,%ebp
    38e3:	83 ec 08             	sub    $0x8,%esp
    38e6:	8b 45 10             	mov    0x10(%ebp),%eax
    38e9:	8b 55 08             	mov    0x8(%ebp),%edx
    38ec:	89 75 f8             	mov    %esi,-0x8(%ebp)
    38ef:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    38f2:	85 c0                	test   %eax,%eax
    38f4:	7e 12                	jle    3908 <memmove+0x28>
    38f6:	89 7d fc             	mov    %edi,-0x4(%ebp)
    38f9:	01 d0                	add    %edx,%eax
  dst = vdst;
    38fb:	89 d7                	mov    %edx,%edi
    38fd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    3900:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    3901:	39 f8                	cmp    %edi,%eax
    3903:	75 fb                	jne    3900 <memmove+0x20>
    3905:	8b 7d fc             	mov    -0x4(%ebp),%edi
  return vdst;
}
    3908:	8b 75 f8             	mov    -0x8(%ebp),%esi
    390b:	89 d0                	mov    %edx,%eax
    390d:	c9                   	leave
    390e:	c3                   	ret

0000390f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    390f:	b8 01 00 00 00       	mov    $0x1,%eax
    3914:	cd 40                	int    $0x40
    3916:	c3                   	ret

00003917 <exit>:
SYSCALL(exit)
    3917:	b8 02 00 00 00       	mov    $0x2,%eax
    391c:	cd 40                	int    $0x40
    391e:	c3                   	ret

0000391f <wait>:
SYSCALL(wait)
    391f:	b8 03 00 00 00       	mov    $0x3,%eax
    3924:	cd 40                	int    $0x40
    3926:	c3                   	ret

00003927 <pipe>:
SYSCALL(pipe)
    3927:	b8 04 00 00 00       	mov    $0x4,%eax
    392c:	cd 40                	int    $0x40
    392e:	c3                   	ret

0000392f <read>:
SYSCALL(read)
    392f:	b8 05 00 00 00       	mov    $0x5,%eax
    3934:	cd 40                	int    $0x40
    3936:	c3                   	ret

00003937 <write>:
SYSCALL(write)
    3937:	b8 10 00 00 00       	mov    $0x10,%eax
    393c:	cd 40                	int    $0x40
    393e:	c3                   	ret

0000393f <close>:
SYSCALL(close)
    393f:	b8 15 00 00 00       	mov    $0x15,%eax
    3944:	cd 40                	int    $0x40
    3946:	c3                   	ret

00003947 <kill>:
SYSCALL(kill)
    3947:	b8 06 00 00 00       	mov    $0x6,%eax
    394c:	cd 40                	int    $0x40
    394e:	c3                   	ret

0000394f <exec>:
SYSCALL(exec)
    394f:	b8 07 00 00 00       	mov    $0x7,%eax
    3954:	cd 40                	int    $0x40
    3956:	c3                   	ret

00003957 <open>:
SYSCALL(open)
    3957:	b8 0f 00 00 00       	mov    $0xf,%eax
    395c:	cd 40                	int    $0x40
    395e:	c3                   	ret

0000395f <mknod>:
SYSCALL(mknod)
    395f:	b8 11 00 00 00       	mov    $0x11,%eax
    3964:	cd 40                	int    $0x40
    3966:	c3                   	ret

00003967 <unlink>:
SYSCALL(unlink)
    3967:	b8 12 00 00 00       	mov    $0x12,%eax
    396c:	cd 40                	int    $0x40
    396e:	c3                   	ret

0000396f <fstat>:
SYSCALL(fstat)
    396f:	b8 08 00 00 00       	mov    $0x8,%eax
    3974:	cd 40                	int    $0x40
    3976:	c3                   	ret

00003977 <link>:
SYSCALL(link)
    3977:	b8 13 00 00 00       	mov    $0x13,%eax
    397c:	cd 40                	int    $0x40
    397e:	c3                   	ret

0000397f <mkdir>:
SYSCALL(mkdir)
    397f:	b8 14 00 00 00       	mov    $0x14,%eax
    3984:	cd 40                	int    $0x40
    3986:	c3                   	ret

00003987 <chdir>:
SYSCALL(chdir)
    3987:	b8 09 00 00 00       	mov    $0x9,%eax
    398c:	cd 40                	int    $0x40
    398e:	c3                   	ret

0000398f <dup>:
SYSCALL(dup)
    398f:	b8 0a 00 00 00       	mov    $0xa,%eax
    3994:	cd 40                	int    $0x40
    3996:	c3                   	ret

00003997 <getpid>:
SYSCALL(getpid)
    3997:	b8 0b 00 00 00       	mov    $0xb,%eax
    399c:	cd 40                	int    $0x40
    399e:	c3                   	ret

0000399f <sbrk>:
SYSCALL(sbrk)
    399f:	b8 0c 00 00 00       	mov    $0xc,%eax
    39a4:	cd 40                	int    $0x40
    39a6:	c3                   	ret

000039a7 <sleep>:
SYSCALL(sleep)
    39a7:	b8 0d 00 00 00       	mov    $0xd,%eax
    39ac:	cd 40                	int    $0x40
    39ae:	c3                   	ret

000039af <uptime>:
SYSCALL(uptime)
    39af:	b8 0e 00 00 00       	mov    $0xe,%eax
    39b4:	cd 40                	int    $0x40
    39b6:	c3                   	ret
    39b7:	66 90                	xchg   %ax,%ax
    39b9:	66 90                	xchg   %ax,%ax
    39bb:	66 90                	xchg   %ax,%ax
    39bd:	66 90                	xchg   %ax,%ax
    39bf:	90                   	nop

000039c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    39c0:	55                   	push   %ebp
    39c1:	89 e5                	mov    %esp,%ebp
    39c3:	57                   	push   %edi
    39c4:	56                   	push   %esi
    39c5:	53                   	push   %ebx
    39c6:	89 cb                	mov    %ecx,%ebx
    39c8:	83 ec 3c             	sub    $0x3c,%esp
    39cb:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    39ce:	85 d2                	test   %edx,%edx
    39d0:	0f 89 9a 00 00 00    	jns    3a70 <printint+0xb0>
    39d6:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    39da:	0f 84 90 00 00 00    	je     3a70 <printint+0xb0>
    neg = 1;
    x = -xx;
    39e0:	f7 da                	neg    %edx
    neg = 1;
    39e2:	b8 01 00 00 00       	mov    $0x1,%eax
    39e7:	89 45 c0             	mov    %eax,-0x40(%ebp)
    39ea:	89 d1                	mov    %edx,%ecx
  } else {
    x = xx;
  }

  i = 0;
    39ec:	31 f6                	xor    %esi,%esi
    39ee:	66 90                	xchg   %ax,%ax
    39f0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    39f7:	00 
    39f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    39ff:	00 
  do{
    buf[i++] = digits[x % base];
    3a00:	89 c8                	mov    %ecx,%eax
    3a02:	31 d2                	xor    %edx,%edx
    3a04:	89 f7                	mov    %esi,%edi
    3a06:	f7 f3                	div    %ebx
    3a08:	8d 76 01             	lea    0x1(%esi),%esi
  }while((x /= base) != 0);
    3a0b:	39 d9                	cmp    %ebx,%ecx
    buf[i++] = digits[x % base];
    3a0d:	0f b6 92 20 56 00 00 	movzbl 0x5620(%edx),%edx
  }while((x /= base) != 0);
    3a14:	89 c1                	mov    %eax,%ecx
    buf[i++] = digits[x % base];
    3a16:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
    3a1a:	73 e4                	jae    3a00 <printint+0x40>
  if(neg)
    3a1c:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3a1f:	85 c0                	test   %eax,%eax
    3a21:	74 07                	je     3a2a <printint+0x6a>
    buf[i++] = '-';
    3a23:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
    3a28:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
    3a2a:	8d 74 3d d8          	lea    -0x28(%ebp,%edi,1),%esi
    3a2e:	8b 7d c4             	mov    -0x3c(%ebp),%edi
    3a31:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    3a34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3a38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    3a3f:	00 
    putc(fd, buf[i]);
    3a40:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    3a43:	83 ec 04             	sub    $0x4,%esp
  while(--i >= 0)
    3a46:	83 ee 01             	sub    $0x1,%esi
    3a49:	88 45 d7             	mov    %al,-0x29(%ebp)
  write(fd, &c, 1);
    3a4c:	8d 45 d7             	lea    -0x29(%ebp),%eax
    3a4f:	6a 01                	push   $0x1
    3a51:	50                   	push   %eax
    3a52:	57                   	push   %edi
    3a53:	e8 df fe ff ff       	call   3937 <write>
  while(--i >= 0)
    3a58:	83 c4 10             	add    $0x10,%esp
    3a5b:	39 f3                	cmp    %esi,%ebx
    3a5d:	75 e1                	jne    3a40 <printint+0x80>
}
    3a5f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3a62:	5b                   	pop    %ebx
    3a63:	5e                   	pop    %esi
    3a64:	5f                   	pop    %edi
    3a65:	5d                   	pop    %ebp
    3a66:	c3                   	ret
    3a67:	90                   	nop
    3a68:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    3a6f:	00 
  neg = 0;
    3a70:	31 c0                	xor    %eax,%eax
    3a72:	e9 70 ff ff ff       	jmp    39e7 <printint+0x27>
    3a77:	90                   	nop
    3a78:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    3a7f:	00 

00003a80 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    3a80:	55                   	push   %ebp
    3a81:	89 e5                	mov    %esp,%ebp
    3a83:	83 ec 38             	sub    $0x38,%esp
    3a86:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3a89:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    3a8c:	89 75 f8             	mov    %esi,-0x8(%ebp)
    3a8f:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    3a92:	0f b6 03             	movzbl (%ebx),%eax
    3a95:	84 c0                	test   %al,%al
    3a97:	0f 84 b6 00 00 00    	je     3b53 <printf+0xd3>
  ap = (uint*)(void*)&fmt + 1;
    3a9d:	8d 4d 10             	lea    0x10(%ebp),%ecx
    3aa0:	89 7d fc             	mov    %edi,-0x4(%ebp)
    3aa3:	83 c3 01             	add    $0x1,%ebx
    3aa6:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    3aa9:	8b 7d d4             	mov    -0x2c(%ebp),%edi
    3aac:	0f b6 d0             	movzbl %al,%edx
    if(state == 0){
    3aaf:	eb 2a                	jmp    3adb <printf+0x5b>
    3ab1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    3ab8:	83 ec 04             	sub    $0x4,%esp
    3abb:	88 45 e7             	mov    %al,-0x19(%ebp)
    3abe:	8d 45 e7             	lea    -0x19(%ebp),%eax
  for(i = 0; fmt[i]; i++){
    3ac1:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    3ac4:	6a 01                	push   $0x1
    3ac6:	50                   	push   %eax
    3ac7:	56                   	push   %esi
    3ac8:	e8 6a fe ff ff       	call   3937 <write>
  for(i = 0; fmt[i]; i++){
    3acd:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
    3ad1:	83 c4 10             	add    $0x10,%esp
    3ad4:	84 c0                	test   %al,%al
    3ad6:	74 78                	je     3b50 <printf+0xd0>
    c = fmt[i] & 0xff;
    3ad8:	0f b6 d0             	movzbl %al,%edx
      if(c == '%'){
    3adb:	83 fa 25             	cmp    $0x25,%edx
    3ade:	75 d8                	jne    3ab8 <printf+0x38>
  for(i = 0; fmt[i]; i++){
    3ae0:	0f b6 13             	movzbl (%ebx),%edx
    3ae3:	84 d2                	test   %dl,%dl
    3ae5:	74 69                	je     3b50 <printf+0xd0>
    c = fmt[i] & 0xff;
    3ae7:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
    3aea:	80 fa 25             	cmp    $0x25,%dl
    3aed:	0f 84 25 01 00 00    	je     3c18 <printf+0x198>
    3af3:	83 e8 63             	sub    $0x63,%eax
    3af6:	83 f8 15             	cmp    $0x15,%eax
    3af9:	77 0d                	ja     3b08 <printf+0x88>
    3afb:	ff 24 85 c8 55 00 00 	jmp    *0x55c8(,%eax,4)
    3b02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    3b08:	83 ec 04             	sub    $0x4,%esp
    3b0b:	8d 4d e7             	lea    -0x19(%ebp),%ecx
    3b0e:	88 55 d0             	mov    %dl,-0x30(%ebp)
    3b11:	6a 01                	push   $0x1
    3b13:	51                   	push   %ecx
    3b14:	56                   	push   %esi
    3b15:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    3b18:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    3b1c:	e8 16 fe ff ff       	call   3937 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    3b21:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
    3b25:	83 c4 0c             	add    $0xc,%esp
    3b28:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    3b2b:	6a 01                	push   $0x1
    3b2d:	88 55 e7             	mov    %dl,-0x19(%ebp)
    3b30:	51                   	push   %ecx
  for(i = 0; fmt[i]; i++){
    3b31:	83 c3 02             	add    $0x2,%ebx
  write(fd, &c, 1);
    3b34:	56                   	push   %esi
    3b35:	e8 fd fd ff ff       	call   3937 <write>
  for(i = 0; fmt[i]; i++){
    3b3a:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
    3b3e:	83 c4 10             	add    $0x10,%esp
    3b41:	84 c0                	test   %al,%al
    3b43:	75 93                	jne    3ad8 <printf+0x58>
    3b45:	8d 76 00             	lea    0x0(%esi),%esi
    3b48:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    3b4f:	00 
    3b50:	8b 7d fc             	mov    -0x4(%ebp),%edi
      }
      state = 0;
    }
  }
}
    3b53:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3b56:	8b 75 f8             	mov    -0x8(%ebp),%esi
    3b59:	c9                   	leave
    3b5a:	c3                   	ret
    3b5b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 16, 0);
    3b60:	83 ec 0c             	sub    $0xc,%esp
    3b63:	8b 17                	mov    (%edi),%edx
    3b65:	b9 10 00 00 00       	mov    $0x10,%ecx
    3b6a:	89 f0                	mov    %esi,%eax
    3b6c:	6a 00                	push   $0x0
    3b6e:	e8 4d fe ff ff       	call   39c0 <printint>
  for(i = 0; fmt[i]; i++){
    3b73:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
    3b77:	83 c3 02             	add    $0x2,%ebx
    3b7a:	83 c4 10             	add    $0x10,%esp
    3b7d:	84 c0                	test   %al,%al
    3b7f:	74 cf                	je     3b50 <printf+0xd0>
        ap++;
    3b81:	83 c7 04             	add    $0x4,%edi
    3b84:	e9 4f ff ff ff       	jmp    3ad8 <printf+0x58>
    3b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    3b90:	83 ec 0c             	sub    $0xc,%esp
    3b93:	8b 17                	mov    (%edi),%edx
    3b95:	b9 0a 00 00 00       	mov    $0xa,%ecx
    3b9a:	89 f0                	mov    %esi,%eax
    3b9c:	6a 01                	push   $0x1
    3b9e:	e8 1d fe ff ff       	call   39c0 <printint>
  for(i = 0; fmt[i]; i++){
    3ba3:	eb ce                	jmp    3b73 <printf+0xf3>
    3ba5:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    3ba8:	83 ec 04             	sub    $0x4,%esp
    3bab:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        putc(fd, *ap);
    3bae:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    3bb0:	6a 01                	push   $0x1
    3bb2:	51                   	push   %ecx
    3bb3:	56                   	push   %esi
        putc(fd, *ap);
    3bb4:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    3bb7:	e8 7b fd ff ff       	call   3937 <write>
    3bbc:	eb b5                	jmp    3b73 <printf+0xf3>
    3bbe:	66 90                	xchg   %ax,%ax
        s = (char*)*ap;
    3bc0:	8b 07                	mov    (%edi),%eax
        ap++;
    3bc2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    3bc5:	85 c0                	test   %eax,%eax
    3bc7:	74 67                	je     3c30 <printf+0x1b0>
        while(*s != 0){
    3bc9:	0f b6 10             	movzbl (%eax),%edx
    3bcc:	84 d2                	test   %dl,%dl
    3bce:	74 6f                	je     3c3f <printf+0x1bf>
    3bd0:	89 7d d4             	mov    %edi,-0x2c(%ebp)
    3bd3:	89 c7                	mov    %eax,%edi
    3bd5:	89 d0                	mov    %edx,%eax
    3bd7:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    3bda:	89 fb                	mov    %edi,%ebx
    3bdc:	8d 7d e7             	lea    -0x19(%ebp),%edi
    3bdf:	90                   	nop
  write(fd, &c, 1);
    3be0:	83 ec 04             	sub    $0x4,%esp
          s++;
    3be3:	83 c3 01             	add    $0x1,%ebx
    3be6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    3be9:	6a 01                	push   $0x1
    3beb:	57                   	push   %edi
    3bec:	56                   	push   %esi
    3bed:	e8 45 fd ff ff       	call   3937 <write>
        while(*s != 0){
    3bf2:	0f b6 03             	movzbl (%ebx),%eax
    3bf5:	83 c4 10             	add    $0x10,%esp
    3bf8:	84 c0                	test   %al,%al
    3bfa:	75 e4                	jne    3be0 <printf+0x160>
    3bfc:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
    3bff:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
    3c03:	83 c3 02             	add    $0x2,%ebx
    3c06:	84 c0                	test   %al,%al
    3c08:	0f 85 9b fe ff ff    	jne    3aa9 <printf+0x29>
    3c0e:	e9 3d ff ff ff       	jmp    3b50 <printf+0xd0>
    3c13:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    3c18:	83 ec 04             	sub    $0x4,%esp
    3c1b:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    3c1f:	8d 4d e7             	lea    -0x19(%ebp),%ecx
    3c22:	6a 01                	push   $0x1
    3c24:	e9 07 ff ff ff       	jmp    3b30 <printf+0xb0>
    3c29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
          s = "(null)";
    3c30:	89 7d d4             	mov    %edi,-0x2c(%ebp)
        if(s == 0)
    3c33:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
    3c38:	bf 49 4e 00 00       	mov    $0x4e49,%edi
    3c3d:	eb 98                	jmp    3bd7 <printf+0x157>
  for(i = 0; fmt[i]; i++){
    3c3f:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
    3c43:	83 c3 02             	add    $0x2,%ebx
    3c46:	84 c0                	test   %al,%al
    3c48:	0f 85 8a fe ff ff    	jne    3ad8 <printf+0x58>
    3c4e:	e9 fd fe ff ff       	jmp    3b50 <printf+0xd0>
    3c53:	66 90                	xchg   %ax,%ax
    3c55:	66 90                	xchg   %ax,%ax
    3c57:	66 90                	xchg   %ax,%ax
    3c59:	66 90                	xchg   %ax,%ax
    3c5b:	66 90                	xchg   %ax,%ax
    3c5d:	66 90                	xchg   %ax,%ax
    3c5f:	90                   	nop

00003c60 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3c60:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c61:	a1 20 a7 00 00       	mov    0xa720,%eax
{
    3c66:	89 e5                	mov    %esp,%ebp
    3c68:	57                   	push   %edi
    3c69:	56                   	push   %esi
    3c6a:	53                   	push   %ebx
    3c6b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    3c6e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3c78:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    3c7f:	00 
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c80:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c82:	39 c8                	cmp    %ecx,%eax
    3c84:	73 32                	jae    3cb8 <free+0x58>
    3c86:	39 d1                	cmp    %edx,%ecx
    3c88:	72 04                	jb     3c8e <free+0x2e>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c8a:	39 d0                	cmp    %edx,%eax
    3c8c:	72 32                	jb     3cc0 <free+0x60>
      break;
  if(bp + bp->s.size == p->s.ptr){
    3c8e:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3c91:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3c94:	39 fa                	cmp    %edi,%edx
    3c96:	74 30                	je     3cc8 <free+0x68>
    3c98:	89 53 f8             	mov    %edx,-0x8(%ebx)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    3c9b:	8b 50 04             	mov    0x4(%eax),%edx
    3c9e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3ca1:	39 f1                	cmp    %esi,%ecx
    3ca3:	74 3a                	je     3cdf <free+0x7f>
    3ca5:	89 08                	mov    %ecx,(%eax)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
}
    3ca7:	5b                   	pop    %ebx
  freep = p;
    3ca8:	a3 20 a7 00 00       	mov    %eax,0xa720
}
    3cad:	5e                   	pop    %esi
    3cae:	5f                   	pop    %edi
    3caf:	5d                   	pop    %ebp
    3cb0:	c3                   	ret
    3cb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3cb8:	39 d0                	cmp    %edx,%eax
    3cba:	72 04                	jb     3cc0 <free+0x60>
    3cbc:	39 d1                	cmp    %edx,%ecx
    3cbe:	72 ce                	jb     3c8e <free+0x2e>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3cc0:	89 d0                	mov    %edx,%eax
    3cc2:	eb bc                	jmp    3c80 <free+0x20>
    3cc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    3cc8:	03 72 04             	add    0x4(%edx),%esi
    3ccb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    3cce:	8b 10                	mov    (%eax),%edx
    3cd0:	8b 12                	mov    (%edx),%edx
    3cd2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3cd5:	8b 50 04             	mov    0x4(%eax),%edx
    3cd8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3cdb:	39 f1                	cmp    %esi,%ecx
    3cdd:	75 c6                	jne    3ca5 <free+0x45>
    p->s.size += bp->s.size;
    3cdf:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    3ce2:	a3 20 a7 00 00       	mov    %eax,0xa720
    p->s.size += bp->s.size;
    3ce7:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    3cea:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    3ced:	89 08                	mov    %ecx,(%eax)
}
    3cef:	5b                   	pop    %ebx
    3cf0:	5e                   	pop    %esi
    3cf1:	5f                   	pop    %edi
    3cf2:	5d                   	pop    %ebp
    3cf3:	c3                   	ret
    3cf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3cf8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    3cff:	00 

00003d00 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    3d00:	55                   	push   %ebp
    3d01:	89 e5                	mov    %esp,%ebp
    3d03:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3d06:	8b 45 08             	mov    0x8(%ebp),%eax
{
    3d09:	89 7d fc             	mov    %edi,-0x4(%ebp)
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3d0c:	8d 78 07             	lea    0x7(%eax),%edi
  if((prevp = freep) == 0){
    3d0f:	a1 20 a7 00 00       	mov    0xa720,%eax
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3d14:	c1 ef 03             	shr    $0x3,%edi
    3d17:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    3d1a:	85 c0                	test   %eax,%eax
    3d1c:	0f 84 c6 00 00 00    	je     3de8 <malloc+0xe8>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3d22:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    3d24:	8b 4a 04             	mov    0x4(%edx),%ecx
    3d27:	39 f9                	cmp    %edi,%ecx
    3d29:	0f 83 87 00 00 00    	jae    3db6 <malloc+0xb6>
    3d2f:	89 5d f4             	mov    %ebx,-0xc(%ebp)
    3d32:	89 75 f8             	mov    %esi,-0x8(%ebp)
  if(nu < 4096)
    3d35:	bb 00 10 00 00       	mov    $0x1000,%ebx
    3d3a:	39 df                	cmp    %ebx,%edi
    3d3c:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    3d3f:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    3d46:	eb 21                	jmp    3d69 <malloc+0x69>
    3d48:	eb 16                	jmp    3d60 <malloc+0x60>
    3d4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3d50:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    3d57:	00 
    3d58:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    3d5f:	00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3d60:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    3d62:	8b 4a 04             	mov    0x4(%edx),%ecx
    3d65:	39 f9                	cmp    %edi,%ecx
    3d67:	73 47                	jae    3db0 <malloc+0xb0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    3d69:	89 d0                	mov    %edx,%eax
    3d6b:	39 15 20 a7 00 00    	cmp    %edx,0xa720
    3d71:	75 ed                	jne    3d60 <malloc+0x60>
  p = sbrk(nu * sizeof(Header));
    3d73:	83 ec 0c             	sub    $0xc,%esp
    3d76:	56                   	push   %esi
    3d77:	e8 23 fc ff ff       	call   399f <sbrk>
  if(p == (char*)-1)
    3d7c:	83 c4 10             	add    $0x10,%esp
    3d7f:	83 f8 ff             	cmp    $0xffffffff,%eax
    3d82:	74 54                	je     3dd8 <malloc+0xd8>
  hp->s.size = nu;
    3d84:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    3d87:	83 ec 0c             	sub    $0xc,%esp
    3d8a:	83 c0 08             	add    $0x8,%eax
    3d8d:	50                   	push   %eax
    3d8e:	e8 cd fe ff ff       	call   3c60 <free>
  return freep;
    3d93:	a1 20 a7 00 00       	mov    0xa720,%eax
      if((p = morecore(nunits)) == 0)
    3d98:	83 c4 10             	add    $0x10,%esp
    3d9b:	85 c0                	test   %eax,%eax
    3d9d:	75 c1                	jne    3d60 <malloc+0x60>
    3d9f:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3da2:	8b 75 f8             	mov    -0x8(%ebp),%esi
    3da5:	eb 26                	jmp    3dcd <malloc+0xcd>
    3da7:	90                   	nop
    3da8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    3daf:	00 
    3db0:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3db3:	8b 75 f8             	mov    -0x8(%ebp),%esi
      if(p->s.size == nunits)
    3db6:	39 cf                	cmp    %ecx,%edi
    3db8:	74 66                	je     3e20 <malloc+0x120>
        p->s.size -= nunits;
    3dba:	29 f9                	sub    %edi,%ecx
    3dbc:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    3dbf:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    3dc2:	89 7a 04             	mov    %edi,0x4(%edx)
      freep = prevp;
    3dc5:	a3 20 a7 00 00       	mov    %eax,0xa720
      return (void*)(p + 1);
    3dca:	8d 42 08             	lea    0x8(%edx),%eax
        return 0;
  }
}
    3dcd:	8b 7d fc             	mov    -0x4(%ebp),%edi
    3dd0:	c9                   	leave
    3dd1:	c3                   	ret
    3dd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        return 0;
    3dd8:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3ddb:	8b 75 f8             	mov    -0x8(%ebp),%esi
    3dde:	31 c0                	xor    %eax,%eax
}
    3de0:	8b 7d fc             	mov    -0x4(%ebp),%edi
    3de3:	c9                   	leave
    3de4:	c3                   	ret
    3de5:	8d 76 00             	lea    0x0(%esi),%esi
    3de8:	89 5d f4             	mov    %ebx,-0xc(%ebp)
    base.s.size = 0;
    3deb:	ba 24 a7 00 00       	mov    $0xa724,%edx
    3df0:	89 75 f8             	mov    %esi,-0x8(%ebp)
    base.s.ptr = freep = prevp = &base;
    3df3:	c7 05 20 a7 00 00 24 	movl   $0xa724,0xa720
    3dfa:	a7 00 00 
    3dfd:	c7 05 24 a7 00 00 24 	movl   $0xa724,0xa724
    3e04:	a7 00 00 
    base.s.size = 0;
    3e07:	c7 05 28 a7 00 00 00 	movl   $0x0,0xa728
    3e0e:	00 00 00 
    if(p->s.size >= nunits){
    3e11:	e9 1f ff ff ff       	jmp    3d35 <malloc+0x35>
    3e16:	66 90                	xchg   %ax,%ax
    3e18:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    3e1f:	00 
        prevp->s.ptr = p->s.ptr;
    3e20:	8b 0a                	mov    (%edx),%ecx
    3e22:	89 08                	mov    %ecx,(%eax)
    3e24:	eb 9f                	jmp    3dc5 <malloc+0xc5>
