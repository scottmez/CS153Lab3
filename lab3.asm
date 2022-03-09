
_lab3:     file format elf32-i386


Disassembly of section .text:

00001000 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	8b 45 08             	mov    0x8(%ebp),%eax
    1006:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1009:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    100a:	89 c2                	mov    %eax,%edx
    100c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1010:	83 c1 01             	add    $0x1,%ecx
    1013:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1017:	83 c2 01             	add    $0x1,%edx
    101a:	84 db                	test   %bl,%bl
    101c:	88 5a ff             	mov    %bl,-0x1(%edx)
    101f:	75 ef                	jne    1010 <strcpy+0x10>
    ;
  return os;
}
    1021:	5b                   	pop    %ebx
    1022:	5d                   	pop    %ebp
    1023:	c3                   	ret    
    1024:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    102a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001030 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1030:	55                   	push   %ebp
    1031:	89 e5                	mov    %esp,%ebp
    1033:	8b 55 08             	mov    0x8(%ebp),%edx
    1036:	53                   	push   %ebx
    1037:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    103a:	0f b6 02             	movzbl (%edx),%eax
    103d:	84 c0                	test   %al,%al
    103f:	74 2d                	je     106e <strcmp+0x3e>
    1041:	0f b6 19             	movzbl (%ecx),%ebx
    1044:	38 d8                	cmp    %bl,%al
    1046:	74 0e                	je     1056 <strcmp+0x26>
    1048:	eb 2b                	jmp    1075 <strcmp+0x45>
    104a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1050:	38 c8                	cmp    %cl,%al
    1052:	75 15                	jne    1069 <strcmp+0x39>
    p++, q++;
    1054:	89 d9                	mov    %ebx,%ecx
    1056:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1059:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    105c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    105f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
    1063:	84 c0                	test   %al,%al
    1065:	75 e9                	jne    1050 <strcmp+0x20>
    1067:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1069:	29 c8                	sub    %ecx,%eax
}
    106b:	5b                   	pop    %ebx
    106c:	5d                   	pop    %ebp
    106d:	c3                   	ret    
    106e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
    1071:	31 c0                	xor    %eax,%eax
    1073:	eb f4                	jmp    1069 <strcmp+0x39>
    1075:	0f b6 cb             	movzbl %bl,%ecx
    1078:	eb ef                	jmp    1069 <strcmp+0x39>
    107a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001080 <strlen>:

uint
strlen(char *s)
{
    1080:	55                   	push   %ebp
    1081:	89 e5                	mov    %esp,%ebp
    1083:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1086:	80 39 00             	cmpb   $0x0,(%ecx)
    1089:	74 12                	je     109d <strlen+0x1d>
    108b:	31 d2                	xor    %edx,%edx
    108d:	8d 76 00             	lea    0x0(%esi),%esi
    1090:	83 c2 01             	add    $0x1,%edx
    1093:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1097:	89 d0                	mov    %edx,%eax
    1099:	75 f5                	jne    1090 <strlen+0x10>
    ;
  return n;
}
    109b:	5d                   	pop    %ebp
    109c:	c3                   	ret    
  for(n = 0; s[n]; n++)
    109d:	31 c0                	xor    %eax,%eax
}
    109f:	5d                   	pop    %ebp
    10a0:	c3                   	ret    
    10a1:	eb 0d                	jmp    10b0 <memset>
    10a3:	90                   	nop
    10a4:	90                   	nop
    10a5:	90                   	nop
    10a6:	90                   	nop
    10a7:	90                   	nop
    10a8:	90                   	nop
    10a9:	90                   	nop
    10aa:	90                   	nop
    10ab:	90                   	nop
    10ac:	90                   	nop
    10ad:	90                   	nop
    10ae:	90                   	nop
    10af:	90                   	nop

000010b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    10b0:	55                   	push   %ebp
    10b1:	89 e5                	mov    %esp,%ebp
    10b3:	8b 55 08             	mov    0x8(%ebp),%edx
    10b6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    10b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    10ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    10bd:	89 d7                	mov    %edx,%edi
    10bf:	fc                   	cld    
    10c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    10c2:	89 d0                	mov    %edx,%eax
    10c4:	5f                   	pop    %edi
    10c5:	5d                   	pop    %ebp
    10c6:	c3                   	ret    
    10c7:	89 f6                	mov    %esi,%esi
    10c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010d0 <strchr>:

char*
strchr(const char *s, char c)
{
    10d0:	55                   	push   %ebp
    10d1:	89 e5                	mov    %esp,%ebp
    10d3:	8b 45 08             	mov    0x8(%ebp),%eax
    10d6:	53                   	push   %ebx
    10d7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
    10da:	0f b6 18             	movzbl (%eax),%ebx
    10dd:	84 db                	test   %bl,%bl
    10df:	74 1d                	je     10fe <strchr+0x2e>
    if(*s == c)
    10e1:	38 d3                	cmp    %dl,%bl
    10e3:	89 d1                	mov    %edx,%ecx
    10e5:	75 0d                	jne    10f4 <strchr+0x24>
    10e7:	eb 17                	jmp    1100 <strchr+0x30>
    10e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10f0:	38 ca                	cmp    %cl,%dl
    10f2:	74 0c                	je     1100 <strchr+0x30>
  for(; *s; s++)
    10f4:	83 c0 01             	add    $0x1,%eax
    10f7:	0f b6 10             	movzbl (%eax),%edx
    10fa:	84 d2                	test   %dl,%dl
    10fc:	75 f2                	jne    10f0 <strchr+0x20>
      return (char*)s;
  return 0;
    10fe:	31 c0                	xor    %eax,%eax
}
    1100:	5b                   	pop    %ebx
    1101:	5d                   	pop    %ebp
    1102:	c3                   	ret    
    1103:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001110 <gets>:

char*
gets(char *buf, int max)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	57                   	push   %edi
    1114:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1115:	31 f6                	xor    %esi,%esi
{
    1117:	53                   	push   %ebx
    1118:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
    111b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
    111e:	eb 31                	jmp    1151 <gets+0x41>
    cc = read(0, &c, 1);
    1120:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1127:	00 
    1128:	89 7c 24 04          	mov    %edi,0x4(%esp)
    112c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1133:	e8 02 01 00 00       	call   123a <read>
    if(cc < 1)
    1138:	85 c0                	test   %eax,%eax
    113a:	7e 1d                	jle    1159 <gets+0x49>
      break;
    buf[i++] = c;
    113c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
    1140:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
    1142:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
    1145:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
    1147:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    114b:	74 0c                	je     1159 <gets+0x49>
    114d:	3c 0a                	cmp    $0xa,%al
    114f:	74 08                	je     1159 <gets+0x49>
  for(i=0; i+1 < max; ){
    1151:	8d 5e 01             	lea    0x1(%esi),%ebx
    1154:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1157:	7c c7                	jl     1120 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    1159:	8b 45 08             	mov    0x8(%ebp),%eax
    115c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1160:	83 c4 2c             	add    $0x2c,%esp
    1163:	5b                   	pop    %ebx
    1164:	5e                   	pop    %esi
    1165:	5f                   	pop    %edi
    1166:	5d                   	pop    %ebp
    1167:	c3                   	ret    
    1168:	90                   	nop
    1169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001170 <stat>:

int
stat(char *n, struct stat *st)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	56                   	push   %esi
    1174:	53                   	push   %ebx
    1175:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1178:	8b 45 08             	mov    0x8(%ebp),%eax
    117b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1182:	00 
    1183:	89 04 24             	mov    %eax,(%esp)
    1186:	e8 d7 00 00 00       	call   1262 <open>
  if(fd < 0)
    118b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
    118d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
    118f:	78 27                	js     11b8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    1191:	8b 45 0c             	mov    0xc(%ebp),%eax
    1194:	89 1c 24             	mov    %ebx,(%esp)
    1197:	89 44 24 04          	mov    %eax,0x4(%esp)
    119b:	e8 da 00 00 00       	call   127a <fstat>
  close(fd);
    11a0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    11a3:	89 c6                	mov    %eax,%esi
  close(fd);
    11a5:	e8 a0 00 00 00       	call   124a <close>
  return r;
    11aa:	89 f0                	mov    %esi,%eax
}
    11ac:	83 c4 10             	add    $0x10,%esp
    11af:	5b                   	pop    %ebx
    11b0:	5e                   	pop    %esi
    11b1:	5d                   	pop    %ebp
    11b2:	c3                   	ret    
    11b3:	90                   	nop
    11b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    11b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    11bd:	eb ed                	jmp    11ac <stat+0x3c>
    11bf:	90                   	nop

000011c0 <atoi>:

int
atoi(const char *s)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
    11c6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    11c7:	0f be 11             	movsbl (%ecx),%edx
    11ca:	8d 42 d0             	lea    -0x30(%edx),%eax
    11cd:	3c 09                	cmp    $0x9,%al
  n = 0;
    11cf:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    11d4:	77 17                	ja     11ed <atoi+0x2d>
    11d6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    11d8:	83 c1 01             	add    $0x1,%ecx
    11db:	8d 04 80             	lea    (%eax,%eax,4),%eax
    11de:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    11e2:	0f be 11             	movsbl (%ecx),%edx
    11e5:	8d 5a d0             	lea    -0x30(%edx),%ebx
    11e8:	80 fb 09             	cmp    $0x9,%bl
    11eb:	76 eb                	jbe    11d8 <atoi+0x18>
  return n;
}
    11ed:	5b                   	pop    %ebx
    11ee:	5d                   	pop    %ebp
    11ef:	c3                   	ret    

000011f0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    11f0:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    11f1:	31 d2                	xor    %edx,%edx
{
    11f3:	89 e5                	mov    %esp,%ebp
    11f5:	56                   	push   %esi
    11f6:	8b 45 08             	mov    0x8(%ebp),%eax
    11f9:	53                   	push   %ebx
    11fa:	8b 5d 10             	mov    0x10(%ebp),%ebx
    11fd:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
    1200:	85 db                	test   %ebx,%ebx
    1202:	7e 12                	jle    1216 <memmove+0x26>
    1204:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1208:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    120c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    120f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1212:	39 da                	cmp    %ebx,%edx
    1214:	75 f2                	jne    1208 <memmove+0x18>
  return vdst;
}
    1216:	5b                   	pop    %ebx
    1217:	5e                   	pop    %esi
    1218:	5d                   	pop    %ebp
    1219:	c3                   	ret    

0000121a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    121a:	b8 01 00 00 00       	mov    $0x1,%eax
    121f:	cd 40                	int    $0x40
    1221:	c3                   	ret    

00001222 <exit>:
SYSCALL(exit)
    1222:	b8 02 00 00 00       	mov    $0x2,%eax
    1227:	cd 40                	int    $0x40
    1229:	c3                   	ret    

0000122a <wait>:
SYSCALL(wait)
    122a:	b8 03 00 00 00       	mov    $0x3,%eax
    122f:	cd 40                	int    $0x40
    1231:	c3                   	ret    

00001232 <pipe>:
SYSCALL(pipe)
    1232:	b8 04 00 00 00       	mov    $0x4,%eax
    1237:	cd 40                	int    $0x40
    1239:	c3                   	ret    

0000123a <read>:
SYSCALL(read)
    123a:	b8 05 00 00 00       	mov    $0x5,%eax
    123f:	cd 40                	int    $0x40
    1241:	c3                   	ret    

00001242 <write>:
SYSCALL(write)
    1242:	b8 10 00 00 00       	mov    $0x10,%eax
    1247:	cd 40                	int    $0x40
    1249:	c3                   	ret    

0000124a <close>:
SYSCALL(close)
    124a:	b8 15 00 00 00       	mov    $0x15,%eax
    124f:	cd 40                	int    $0x40
    1251:	c3                   	ret    

00001252 <kill>:
SYSCALL(kill)
    1252:	b8 06 00 00 00       	mov    $0x6,%eax
    1257:	cd 40                	int    $0x40
    1259:	c3                   	ret    

0000125a <exec>:
SYSCALL(exec)
    125a:	b8 07 00 00 00       	mov    $0x7,%eax
    125f:	cd 40                	int    $0x40
    1261:	c3                   	ret    

00001262 <open>:
SYSCALL(open)
    1262:	b8 0f 00 00 00       	mov    $0xf,%eax
    1267:	cd 40                	int    $0x40
    1269:	c3                   	ret    

0000126a <mknod>:
SYSCALL(mknod)
    126a:	b8 11 00 00 00       	mov    $0x11,%eax
    126f:	cd 40                	int    $0x40
    1271:	c3                   	ret    

00001272 <unlink>:
SYSCALL(unlink)
    1272:	b8 12 00 00 00       	mov    $0x12,%eax
    1277:	cd 40                	int    $0x40
    1279:	c3                   	ret    

0000127a <fstat>:
SYSCALL(fstat)
    127a:	b8 08 00 00 00       	mov    $0x8,%eax
    127f:	cd 40                	int    $0x40
    1281:	c3                   	ret    

00001282 <link>:
SYSCALL(link)
    1282:	b8 13 00 00 00       	mov    $0x13,%eax
    1287:	cd 40                	int    $0x40
    1289:	c3                   	ret    

0000128a <mkdir>:
SYSCALL(mkdir)
    128a:	b8 14 00 00 00       	mov    $0x14,%eax
    128f:	cd 40                	int    $0x40
    1291:	c3                   	ret    

00001292 <chdir>:
SYSCALL(chdir)
    1292:	b8 09 00 00 00       	mov    $0x9,%eax
    1297:	cd 40                	int    $0x40
    1299:	c3                   	ret    

0000129a <dup>:
SYSCALL(dup)
    129a:	b8 0a 00 00 00       	mov    $0xa,%eax
    129f:	cd 40                	int    $0x40
    12a1:	c3                   	ret    

000012a2 <getpid>:
SYSCALL(getpid)
    12a2:	b8 0b 00 00 00       	mov    $0xb,%eax
    12a7:	cd 40                	int    $0x40
    12a9:	c3                   	ret    

000012aa <sbrk>:
SYSCALL(sbrk)
    12aa:	b8 0c 00 00 00       	mov    $0xc,%eax
    12af:	cd 40                	int    $0x40
    12b1:	c3                   	ret    

000012b2 <sleep>:
SYSCALL(sleep)
    12b2:	b8 0d 00 00 00       	mov    $0xd,%eax
    12b7:	cd 40                	int    $0x40
    12b9:	c3                   	ret    

000012ba <uptime>:
SYSCALL(uptime)
    12ba:	b8 0e 00 00 00       	mov    $0xe,%eax
    12bf:	cd 40                	int    $0x40
    12c1:	c3                   	ret    

000012c2 <shm_open>:
SYSCALL(shm_open)
    12c2:	b8 16 00 00 00       	mov    $0x16,%eax
    12c7:	cd 40                	int    $0x40
    12c9:	c3                   	ret    

000012ca <shm_close>:
SYSCALL(shm_close)	
    12ca:	b8 17 00 00 00       	mov    $0x17,%eax
    12cf:	cd 40                	int    $0x40
    12d1:	c3                   	ret    
    12d2:	66 90                	xchg   %ax,%ax
    12d4:	66 90                	xchg   %ax,%ax
    12d6:	66 90                	xchg   %ax,%ax
    12d8:	66 90                	xchg   %ax,%ax
    12da:	66 90                	xchg   %ax,%ax
    12dc:	66 90                	xchg   %ax,%ax
    12de:	66 90                	xchg   %ax,%ax

000012e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    12e0:	55                   	push   %ebp
    12e1:	89 e5                	mov    %esp,%ebp
    12e3:	57                   	push   %edi
    12e4:	56                   	push   %esi
    12e5:	89 c6                	mov    %eax,%esi
    12e7:	53                   	push   %ebx
    12e8:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    12eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    12ee:	85 db                	test   %ebx,%ebx
    12f0:	74 09                	je     12fb <printint+0x1b>
    12f2:	89 d0                	mov    %edx,%eax
    12f4:	c1 e8 1f             	shr    $0x1f,%eax
    12f7:	84 c0                	test   %al,%al
    12f9:	75 75                	jne    1370 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    12fb:	89 d0                	mov    %edx,%eax
  neg = 0;
    12fd:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1304:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
    1307:	31 ff                	xor    %edi,%edi
    1309:	89 ce                	mov    %ecx,%esi
    130b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    130e:	eb 02                	jmp    1312 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
    1310:	89 cf                	mov    %ecx,%edi
    1312:	31 d2                	xor    %edx,%edx
    1314:	f7 f6                	div    %esi
    1316:	8d 4f 01             	lea    0x1(%edi),%ecx
    1319:	0f b6 92 28 17 00 00 	movzbl 0x1728(%edx),%edx
  }while((x /= base) != 0);
    1320:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1322:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    1325:	75 e9                	jne    1310 <printint+0x30>
  if(neg)
    1327:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
    132a:	89 c8                	mov    %ecx,%eax
    132c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
    132f:	85 d2                	test   %edx,%edx
    1331:	74 08                	je     133b <printint+0x5b>
    buf[i++] = '-';
    1333:	8d 4f 02             	lea    0x2(%edi),%ecx
    1336:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
    133b:	8d 79 ff             	lea    -0x1(%ecx),%edi
    133e:	66 90                	xchg   %ax,%ax
    1340:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
    1345:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
    1348:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    134f:	00 
    1350:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1354:	89 34 24             	mov    %esi,(%esp)
    1357:	88 45 d7             	mov    %al,-0x29(%ebp)
    135a:	e8 e3 fe ff ff       	call   1242 <write>
  while(--i >= 0)
    135f:	83 ff ff             	cmp    $0xffffffff,%edi
    1362:	75 dc                	jne    1340 <printint+0x60>
    putc(fd, buf[i]);
}
    1364:	83 c4 4c             	add    $0x4c,%esp
    1367:	5b                   	pop    %ebx
    1368:	5e                   	pop    %esi
    1369:	5f                   	pop    %edi
    136a:	5d                   	pop    %ebp
    136b:	c3                   	ret    
    136c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
    1370:	89 d0                	mov    %edx,%eax
    1372:	f7 d8                	neg    %eax
    neg = 1;
    1374:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    137b:	eb 87                	jmp    1304 <printint+0x24>
    137d:	8d 76 00             	lea    0x0(%esi),%esi

00001380 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1380:	55                   	push   %ebp
    1381:	89 e5                	mov    %esp,%ebp
    1383:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1384:	31 ff                	xor    %edi,%edi
{
    1386:	56                   	push   %esi
    1387:	53                   	push   %ebx
    1388:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    138b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
    138e:	8d 45 10             	lea    0x10(%ebp),%eax
{
    1391:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
    1394:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
    1397:	0f b6 13             	movzbl (%ebx),%edx
    139a:	83 c3 01             	add    $0x1,%ebx
    139d:	84 d2                	test   %dl,%dl
    139f:	75 39                	jne    13da <printf+0x5a>
    13a1:	e9 c2 00 00 00       	jmp    1468 <printf+0xe8>
    13a6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    13a8:	83 fa 25             	cmp    $0x25,%edx
    13ab:	0f 84 bf 00 00 00    	je     1470 <printf+0xf0>
  write(fd, &c, 1);
    13b1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    13b4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    13bb:	00 
    13bc:	89 44 24 04          	mov    %eax,0x4(%esp)
    13c0:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
    13c3:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
    13c6:	e8 77 fe ff ff       	call   1242 <write>
    13cb:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
    13ce:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    13d2:	84 d2                	test   %dl,%dl
    13d4:	0f 84 8e 00 00 00    	je     1468 <printf+0xe8>
    if(state == 0){
    13da:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    13dc:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
    13df:	74 c7                	je     13a8 <printf+0x28>
      }
    } else if(state == '%'){
    13e1:	83 ff 25             	cmp    $0x25,%edi
    13e4:	75 e5                	jne    13cb <printf+0x4b>
      if(c == 'd'){
    13e6:	83 fa 64             	cmp    $0x64,%edx
    13e9:	0f 84 31 01 00 00    	je     1520 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    13ef:	25 f7 00 00 00       	and    $0xf7,%eax
    13f4:	83 f8 70             	cmp    $0x70,%eax
    13f7:	0f 84 83 00 00 00    	je     1480 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    13fd:	83 fa 73             	cmp    $0x73,%edx
    1400:	0f 84 a2 00 00 00    	je     14a8 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1406:	83 fa 63             	cmp    $0x63,%edx
    1409:	0f 84 35 01 00 00    	je     1544 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    140f:	83 fa 25             	cmp    $0x25,%edx
    1412:	0f 84 e0 00 00 00    	je     14f8 <printf+0x178>
  write(fd, &c, 1);
    1418:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    141b:	83 c3 01             	add    $0x1,%ebx
    141e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1425:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1426:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    1428:	89 44 24 04          	mov    %eax,0x4(%esp)
    142c:	89 34 24             	mov    %esi,(%esp)
    142f:	89 55 d0             	mov    %edx,-0x30(%ebp)
    1432:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    1436:	e8 07 fe ff ff       	call   1242 <write>
        putc(fd, c);
    143b:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
    143e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1441:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1448:	00 
    1449:	89 44 24 04          	mov    %eax,0x4(%esp)
    144d:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
    1450:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    1453:	e8 ea fd ff ff       	call   1242 <write>
  for(i = 0; fmt[i]; i++){
    1458:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    145c:	84 d2                	test   %dl,%dl
    145e:	0f 85 76 ff ff ff    	jne    13da <printf+0x5a>
    1464:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
    1468:	83 c4 3c             	add    $0x3c,%esp
    146b:	5b                   	pop    %ebx
    146c:	5e                   	pop    %esi
    146d:	5f                   	pop    %edi
    146e:	5d                   	pop    %ebp
    146f:	c3                   	ret    
        state = '%';
    1470:	bf 25 00 00 00       	mov    $0x25,%edi
    1475:	e9 51 ff ff ff       	jmp    13cb <printf+0x4b>
    147a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1480:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1483:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
    1488:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
    148a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1491:	8b 10                	mov    (%eax),%edx
    1493:	89 f0                	mov    %esi,%eax
    1495:	e8 46 fe ff ff       	call   12e0 <printint>
        ap++;
    149a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    149e:	e9 28 ff ff ff       	jmp    13cb <printf+0x4b>
    14a3:	90                   	nop
    14a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    14a8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
    14ab:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
    14af:	8b 38                	mov    (%eax),%edi
          s = "(null)";
    14b1:	b8 21 17 00 00       	mov    $0x1721,%eax
    14b6:	85 ff                	test   %edi,%edi
    14b8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
    14bb:	0f b6 07             	movzbl (%edi),%eax
    14be:	84 c0                	test   %al,%al
    14c0:	74 2a                	je     14ec <printf+0x16c>
    14c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    14c8:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    14cb:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
    14ce:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
    14d1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    14d8:	00 
    14d9:	89 44 24 04          	mov    %eax,0x4(%esp)
    14dd:	89 34 24             	mov    %esi,(%esp)
    14e0:	e8 5d fd ff ff       	call   1242 <write>
        while(*s != 0){
    14e5:	0f b6 07             	movzbl (%edi),%eax
    14e8:	84 c0                	test   %al,%al
    14ea:	75 dc                	jne    14c8 <printf+0x148>
      state = 0;
    14ec:	31 ff                	xor    %edi,%edi
    14ee:	e9 d8 fe ff ff       	jmp    13cb <printf+0x4b>
    14f3:	90                   	nop
    14f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    14f8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
    14fb:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    14fd:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1504:	00 
    1505:	89 44 24 04          	mov    %eax,0x4(%esp)
    1509:	89 34 24             	mov    %esi,(%esp)
    150c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    1510:	e8 2d fd ff ff       	call   1242 <write>
    1515:	e9 b1 fe ff ff       	jmp    13cb <printf+0x4b>
    151a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1520:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1523:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
    1528:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
    152b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1532:	8b 10                	mov    (%eax),%edx
    1534:	89 f0                	mov    %esi,%eax
    1536:	e8 a5 fd ff ff       	call   12e0 <printint>
        ap++;
    153b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    153f:	e9 87 fe ff ff       	jmp    13cb <printf+0x4b>
        putc(fd, *ap);
    1544:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
    1547:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
    1549:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    154b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1552:	00 
    1553:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
    1556:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    1559:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    155c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1560:	e8 dd fc ff ff       	call   1242 <write>
        ap++;
    1565:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    1569:	e9 5d fe ff ff       	jmp    13cb <printf+0x4b>
    156e:	66 90                	xchg   %ax,%ax

00001570 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1570:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1571:	a1 c4 19 00 00       	mov    0x19c4,%eax
{
    1576:	89 e5                	mov    %esp,%ebp
    1578:	57                   	push   %edi
    1579:	56                   	push   %esi
    157a:	53                   	push   %ebx
    157b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    157e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
    1580:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1583:	39 d0                	cmp    %edx,%eax
    1585:	72 11                	jb     1598 <free+0x28>
    1587:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1588:	39 c8                	cmp    %ecx,%eax
    158a:	72 04                	jb     1590 <free+0x20>
    158c:	39 ca                	cmp    %ecx,%edx
    158e:	72 10                	jb     15a0 <free+0x30>
    1590:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1592:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1594:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1596:	73 f0                	jae    1588 <free+0x18>
    1598:	39 ca                	cmp    %ecx,%edx
    159a:	72 04                	jb     15a0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    159c:	39 c8                	cmp    %ecx,%eax
    159e:	72 f0                	jb     1590 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    15a0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    15a3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
    15a6:	39 cf                	cmp    %ecx,%edi
    15a8:	74 1e                	je     15c8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    15aa:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    15ad:	8b 48 04             	mov    0x4(%eax),%ecx
    15b0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    15b3:	39 f2                	cmp    %esi,%edx
    15b5:	74 28                	je     15df <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    15b7:	89 10                	mov    %edx,(%eax)
  freep = p;
    15b9:	a3 c4 19 00 00       	mov    %eax,0x19c4
}
    15be:	5b                   	pop    %ebx
    15bf:	5e                   	pop    %esi
    15c0:	5f                   	pop    %edi
    15c1:	5d                   	pop    %ebp
    15c2:	c3                   	ret    
    15c3:	90                   	nop
    15c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    15c8:	03 71 04             	add    0x4(%ecx),%esi
    15cb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    15ce:	8b 08                	mov    (%eax),%ecx
    15d0:	8b 09                	mov    (%ecx),%ecx
    15d2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    15d5:	8b 48 04             	mov    0x4(%eax),%ecx
    15d8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    15db:	39 f2                	cmp    %esi,%edx
    15dd:	75 d8                	jne    15b7 <free+0x47>
    p->s.size += bp->s.size;
    15df:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
    15e2:	a3 c4 19 00 00       	mov    %eax,0x19c4
    p->s.size += bp->s.size;
    15e7:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    15ea:	8b 53 f8             	mov    -0x8(%ebx),%edx
    15ed:	89 10                	mov    %edx,(%eax)
}
    15ef:	5b                   	pop    %ebx
    15f0:	5e                   	pop    %esi
    15f1:	5f                   	pop    %edi
    15f2:	5d                   	pop    %ebp
    15f3:	c3                   	ret    
    15f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    15fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001600 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1600:	55                   	push   %ebp
    1601:	89 e5                	mov    %esp,%ebp
    1603:	57                   	push   %edi
    1604:	56                   	push   %esi
    1605:	53                   	push   %ebx
    1606:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1609:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    160c:	8b 1d c4 19 00 00    	mov    0x19c4,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1612:	8d 48 07             	lea    0x7(%eax),%ecx
    1615:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
    1618:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    161a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
    161d:	0f 84 9b 00 00 00    	je     16be <malloc+0xbe>
    1623:	8b 13                	mov    (%ebx),%edx
    1625:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1628:	39 fe                	cmp    %edi,%esi
    162a:	76 64                	jbe    1690 <malloc+0x90>
    162c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
    1633:	bb 00 80 00 00       	mov    $0x8000,%ebx
    1638:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    163b:	eb 0e                	jmp    164b <malloc+0x4b>
    163d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1640:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1642:	8b 78 04             	mov    0x4(%eax),%edi
    1645:	39 fe                	cmp    %edi,%esi
    1647:	76 4f                	jbe    1698 <malloc+0x98>
    1649:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    164b:	3b 15 c4 19 00 00    	cmp    0x19c4,%edx
    1651:	75 ed                	jne    1640 <malloc+0x40>
  if(nu < 4096)
    1653:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1656:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    165c:	bf 00 10 00 00       	mov    $0x1000,%edi
    1661:	0f 43 fe             	cmovae %esi,%edi
    1664:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
    1667:	89 04 24             	mov    %eax,(%esp)
    166a:	e8 3b fc ff ff       	call   12aa <sbrk>
  if(p == (char*)-1)
    166f:	83 f8 ff             	cmp    $0xffffffff,%eax
    1672:	74 18                	je     168c <malloc+0x8c>
  hp->s.size = nu;
    1674:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    1677:	83 c0 08             	add    $0x8,%eax
    167a:	89 04 24             	mov    %eax,(%esp)
    167d:	e8 ee fe ff ff       	call   1570 <free>
  return freep;
    1682:	8b 15 c4 19 00 00    	mov    0x19c4,%edx
      if((p = morecore(nunits)) == 0)
    1688:	85 d2                	test   %edx,%edx
    168a:	75 b4                	jne    1640 <malloc+0x40>
        return 0;
    168c:	31 c0                	xor    %eax,%eax
    168e:	eb 20                	jmp    16b0 <malloc+0xb0>
    if(p->s.size >= nunits){
    1690:	89 d0                	mov    %edx,%eax
    1692:	89 da                	mov    %ebx,%edx
    1694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1698:	39 fe                	cmp    %edi,%esi
    169a:	74 1c                	je     16b8 <malloc+0xb8>
        p->s.size -= nunits;
    169c:	29 f7                	sub    %esi,%edi
    169e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
    16a1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
    16a4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    16a7:	89 15 c4 19 00 00    	mov    %edx,0x19c4
      return (void*)(p + 1);
    16ad:	83 c0 08             	add    $0x8,%eax
  }
}
    16b0:	83 c4 1c             	add    $0x1c,%esp
    16b3:	5b                   	pop    %ebx
    16b4:	5e                   	pop    %esi
    16b5:	5f                   	pop    %edi
    16b6:	5d                   	pop    %ebp
    16b7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    16b8:	8b 08                	mov    (%eax),%ecx
    16ba:	89 0a                	mov    %ecx,(%edx)
    16bc:	eb e9                	jmp    16a7 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
    16be:	c7 05 c4 19 00 00 c8 	movl   $0x19c8,0x19c4
    16c5:	19 00 00 
    base.s.size = 0;
    16c8:	ba c8 19 00 00       	mov    $0x19c8,%edx
    base.s.ptr = freep = prevp = &base;
    16cd:	c7 05 c8 19 00 00 c8 	movl   $0x19c8,0x19c8
    16d4:	19 00 00 
    base.s.size = 0;
    16d7:	c7 05 cc 19 00 00 00 	movl   $0x0,0x19cc
    16de:	00 00 00 
    16e1:	e9 46 ff ff ff       	jmp    162c <malloc+0x2c>
    16e6:	66 90                	xchg   %ax,%ax
    16e8:	66 90                	xchg   %ax,%ax
    16ea:	66 90                	xchg   %ax,%ax
    16ec:	66 90                	xchg   %ax,%ax
    16ee:	66 90                	xchg   %ax,%ax

000016f0 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    16f0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    16f1:	b9 01 00 00 00       	mov    $0x1,%ecx
    16f6:	89 e5                	mov    %esp,%ebp
    16f8:	8b 55 08             	mov    0x8(%ebp),%edx
    16fb:	90                   	nop
    16fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1700:	89 c8                	mov    %ecx,%eax
    1702:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    1705:	85 c0                	test   %eax,%eax
    1707:	75 f7                	jne    1700 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    1709:	0f ae f0             	mfence 
}
    170c:	5d                   	pop    %ebp
    170d:	c3                   	ret    
    170e:	66 90                	xchg   %ax,%ax

00001710 <urelease>:

void urelease (struct uspinlock *lk) {
    1710:	55                   	push   %ebp
    1711:	89 e5                	mov    %esp,%ebp
    1713:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    1716:	0f ae f0             	mfence 

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    1719:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    171f:	5d                   	pop    %ebp
    1720:	c3                   	ret    
