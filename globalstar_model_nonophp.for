      PROGRAM SINDA
      CHARACTER*6 H
      COMMON /TITLE/H(20)
      COMMON /TEMP/T(     54)
      COMMON /CAP/C(     45)
      COMMON /SOURCE/Q(     53)
      COMMON /COND/G(     214)
      COMMON /KONST/K(      9)
      COMMON /ARRAY/A(       1)
      COMMON /PC1/LSQ1(    1437)
      COMMON /PC2/LSQ2(       1)
      COMMON /DIMENS/NND,NNC,NNT,NGL,NGT,NGE,NCC,NUC,NCT,NAT,LENA
     +,NSQ1,NSQ2,NPC,NPT,NSQ3,NVL,NPM,NTE,NSQ4,NCS,LCS
      COMMON /POINTN/LNODE,LCOND,LCONS,LARRY,IVB,LPRES,LTUBE,LCHAR
      COMMON /TAPE/NIN,NOUT,LDAT,LDIC,ASCI,FLUD,GNRL,CHAR
      COMMON /XSPACE/NDIM,NTH,X(  100000)
      COMMON /FIXCON/
     +TIMEN ,DTIMEU,TIMEND,CSGFAC,NLOOP ,DTMPCA,ITROUT,DTIMEH,
     +DAMPA ,DAMPD ,ATMPCA,BACKUP,TIMEO ,TIMEM ,DTMPCC,ATMPCC,
     +CSGMIN,OUTPUT,ARLXCA,LOOPCT,DTIMEL,DTIMEI,CSGMAX,CSGRAL,
     +CSGRCL,DRLXCA,DRLXCC,NLINE ,NPAGE ,ARLXCC,LSPCS ,ENGBAL,
     +BALENG,ATSLIM,NCSGMN,NDTMPC,NARLXC,NATMPC,ITEST ,JTEST ,
     +KTEST ,LTEST ,MTEST ,RTEST ,STEST ,TTEST ,UTEST ,VTEST ,
     +LAXFAC,SIGMA ,TMPZRO,NDRLXC,TDERV ,NTDERV,BENODE,EBNODE,
     +NODEEB,EXTLIM,NCOLUM,PRLXCA,PRLXCC,NEGSIV,GRVCON,PZERO ,
     +NCSGMX,NTEST ,ATEST ,BTEST ,CTEST ,DTEST ,ETEST ,FTEST ,
     +GTEST ,HTEST ,OTEST ,PTEST ,QTEST ,WTEST ,XTEST ,YTEST ,
     +ZTEST ,NTROSS,ISNUNC,NLINPP,LOTEMP,ERRMAX,ERRMIN,SENGIN,
     +DBLPRC,MPCNTL,IPCNT1,IPCNT2,ATSLM1,NLOOP1,JDIFQ ,KMAX  ,
     +FRACHG,EPS   ,PRSABS,PRSREL,FLOABS,FLOREL,FLOMAX,PRANGE,
     +ISOLVE,NPASS ,DEFLIM,ICHECK,GRAV  ,GC1   ,GC2   ,USRFLO,
     +PMPTOL,DEBUGF,NOFERR,GC3   ,SPARE1,SPARE2,SPARE3,SPARE4,
     +SPARE5,SPARE6,SPARE7,NNGSPM,NCONVG
      DIMENSION XK(      9),NX(  100000),IA(       1)
      EQUIVALENCE (K(1),XK(1)),(X(1),NX(1)),(A(1),IA(1))
      LOGICAL ASCI,FLUD,GNRL,CHAR
      COMMON /MODNAME/MODNAME
      CHARACTER *50 MODNAME
      COMMON /IMODNAME/MODNSTRT,MODNEND,IFILESYS
      MODNAME='sinda'                                                                               
      MODNSTRT=  1
      MODNEND=  5
      IFILESYS=  1
      NIN=5
      LDAT=2
      LDIC=4
      OPEN(LDAT,FILE='sinda.TP2',STATUS='UNKNOWN',FORM='UNFORMATTED')                               
      OPEN(LDIC,FILE='sinda.TP4',STATUS='UNKNOWN',FORM='UNFORMATTED')                               
      ASCI=.FALSE.
      CHAR=.FALSE.
      FLUD=.FALSE.
      GNRL=.FALSE.
      T(1)=0.
      C(1)=0.
      Q(1)=0.
      G(1)=0.
      LSQ1(1)=0
      LSQ2(1)=0
      K(1)=0
      A(1)=0.
      X(1)=0.
      NOUT=   6
      OPEN(NOUT ,FILE='sinda.OUT',STATUS='UNKNOWN',FORM='FORMATTED')                                
      CALL INPUT
      CALL EXECT
      CLOSE(LDAT)
      CLOSE(LDIC)
      CLOSE(NIN)
      CLOSE(NOUT)
      END
      SUBROUTINE EXECT 
      CHARACTER*6 H
      COMMON /TITLE/H(20)
      COMMON /TEMP/T(     54)
      COMMON /CAP/C(     45)
      COMMON /SOURCE/Q(     53)
      COMMON /COND/G(     214)
      COMMON /KONST/K(      9)
      COMMON /ARRAY/A(       1)
      COMMON /PC1/LSQ1(    1437)
      COMMON /PC2/LSQ2(       1)
      COMMON /DIMENS/NND,NNC,NNT,NGL,NGT,NGE,NCC,NUC,NCT,NAT,LENA
     +,NSQ1,NSQ2,NPC,NPT,NSQ3,NVL,NPM,NTE,NSQ4,NCS,LCS
      COMMON /POINTN/LNODE,LCOND,LCONS,LARRY,IVB,LPRES,LTUBE,LCHAR
      COMMON /TAPE/NIN,NOUT,LDAT,LDIC,ASCI,FLUD,GNRL,CHAR
      COMMON /XSPACE/NDIM,NTH,X(  100000)
      COMMON /FIXCON/
     +TIMEN ,DTIMEU,TIMEND,CSGFAC,NLOOP ,DTMPCA,ITROUT,DTIMEH,
     +DAMPA ,DAMPD ,ATMPCA,BACKUP,TIMEO ,TIMEM ,DTMPCC,ATMPCC,
     +CSGMIN,OUTPUT,ARLXCA,LOOPCT,DTIMEL,DTIMEI,CSGMAX,CSGRAL,
     +CSGRCL,DRLXCA,DRLXCC,NLINE ,NPAGE ,ARLXCC,LSPCS ,ENGBAL,
     +BALENG,ATSLIM,NCSGMN,NDTMPC,NARLXC,NATMPC,ITEST ,JTEST ,
     +KTEST ,LTEST ,MTEST ,RTEST ,STEST ,TTEST ,UTEST ,VTEST ,
     +LAXFAC,SIGMA ,TMPZRO,NDRLXC,TDERV ,NTDERV,BENODE,EBNODE,
     +NODEEB,EXTLIM,NCOLUM,PRLXCA,PRLXCC,NEGSIV,GRVCON,PZERO ,
     +NCSGMX,NTEST ,ATEST ,BTEST ,CTEST ,DTEST ,ETEST ,FTEST ,
     +GTEST ,HTEST ,OTEST ,PTEST ,QTEST ,WTEST ,XTEST ,YTEST ,
     +ZTEST ,NTROSS,ISNUNC,NLINPP,LOTEMP,ERRMAX,ERRMIN,SENGIN,
     +DBLPRC,MPCNTL,IPCNT1,IPCNT2,ATSLM1,NLOOP1,JDIFQ ,KMAX  ,
     +FRACHG,EPS   ,PRSABS,PRSREL,FLOABS,FLOREL,FLOMAX,PRANGE,
     +ISOLVE,NPASS ,DEFLIM,ICHECK,GRAV  ,GC1   ,GC2   ,USRFLO,
     +PMPTOL,DEBUGF,NOFERR,GC3   ,SPARE1,SPARE2,SPARE3,SPARE4,
     +SPARE5,SPARE6,SPARE7,NNGSPM,NCONVG
      DIMENSION XK(      9),NX(  100000),IA(       1)
      EQUIVALENCE (K(1),XK(1)),(X(1),NX(1)),(A(1),IA(1))
      LOGICAL ASCI,FLUD,GNRL,CHAR
      CALL SNADE                                                        
      RETURN
      END
      SUBROUTINE VARBL1
      CHARACTER*6 H
      COMMON /TITLE/H(20)
      COMMON /TEMP/T(     54)
      COMMON /CAP/C(     45)
      COMMON /SOURCE/Q(     53)
      COMMON /COND/G(     214)
      COMMON /KONST/K(      9)
      COMMON /ARRAY/A(       1)
      COMMON /PC1/LSQ1(    1437)
      COMMON /PC2/LSQ2(       1)
      COMMON /DIMENS/NND,NNC,NNT,NGL,NGT,NGE,NCC,NUC,NCT,NAT,LENA
     +,NSQ1,NSQ2,NPC,NPT,NSQ3,NVL,NPM,NTE,NSQ4,NCS,LCS
      COMMON /POINTN/LNODE,LCOND,LCONS,LARRY,IVB,LPRES,LTUBE,LCHAR
      COMMON /TAPE/NIN,NOUT,LDAT,LDIC,ASCI,FLUD,GNRL,CHAR
      COMMON /XSPACE/NDIM,NTH,X(  100000)
      COMMON /FIXCON/
     +TIMEN ,DTIMEU,TIMEND,CSGFAC,NLOOP ,DTMPCA,ITROUT,DTIMEH,
     +DAMPA ,DAMPD ,ATMPCA,BACKUP,TIMEO ,TIMEM ,DTMPCC,ATMPCC,
     +CSGMIN,OUTPUT,ARLXCA,LOOPCT,DTIMEL,DTIMEI,CSGMAX,CSGRAL,
     +CSGRCL,DRLXCA,DRLXCC,NLINE ,NPAGE ,ARLXCC,LSPCS ,ENGBAL,
     +BALENG,ATSLIM,NCSGMN,NDTMPC,NARLXC,NATMPC,ITEST ,JTEST ,
     +KTEST ,LTEST ,MTEST ,RTEST ,STEST ,TTEST ,UTEST ,VTEST ,
     +LAXFAC,SIGMA ,TMPZRO,NDRLXC,TDERV ,NTDERV,BENODE,EBNODE,
     +NODEEB,EXTLIM,NCOLUM,PRLXCA,PRLXCC,NEGSIV,GRVCON,PZERO ,
     +NCSGMX,NTEST ,ATEST ,BTEST ,CTEST ,DTEST ,ETEST ,FTEST ,
     +GTEST ,HTEST ,OTEST ,PTEST ,QTEST ,WTEST ,XTEST ,YTEST ,
     +ZTEST ,NTROSS,ISNUNC,NLINPP,LOTEMP,ERRMAX,ERRMIN,SENGIN,
     +DBLPRC,MPCNTL,IPCNT1,IPCNT2,ATSLM1,NLOOP1,JDIFQ ,KMAX  ,
     +FRACHG,EPS   ,PRSABS,PRSREL,FLOABS,FLOREL,FLOMAX,PRANGE,
     +ISOLVE,NPASS ,DEFLIM,ICHECK,GRAV  ,GC1   ,GC2   ,USRFLO,
     +PMPTOL,DEBUGF,NOFERR,GC3   ,SPARE1,SPARE2,SPARE3,SPARE4,
     +SPARE5,SPARE6,SPARE7,NNGSPM,NCONVG
      DIMENSION XK(      9),NX(  100000),IA(       1)
      EQUIVALENCE (K(1),XK(1)),(X(1),NX(1)),(A(1),IA(1))
      LOGICAL ASCI,FLUD,GNRL,CHAR
           XK(2)=11.3                                                   
      CALL TRMSTD(T(21), 18.30,    32.20,    K(3),    0,    K(2), Q(21))
           XK(4)=105.0                                                  
           XK(5)=105.0                                                  
      CALL TRMSTD(T(23),  0.00,   4.960,    K (6),    0,    K(4), Q(23))
      CALL TRMSTD(T(24),  0.00,   4.960,    K (7),    0,    K(5), Q(24))
      CALL TRMSTD(T(22),  -5.00,  0.000,    K (8),  0,   100.,   Q(22)) 
        Q(20)= 41.1                                                     
        Q(19)= 9.00                                                     
        Q(7)= Q(7)+ 6.7                                                 
        Q(8)= Q(8)+ 12.4                                                
      RETURN
      END
      SUBROUTINE VARBL2
      CHARACTER*6 H
      COMMON /TITLE/H(20)
      COMMON /TEMP/T(     54)
      COMMON /CAP/C(     45)
      COMMON /SOURCE/Q(     53)
      COMMON /COND/G(     214)
      COMMON /KONST/K(      9)
      COMMON /ARRAY/A(       1)
      COMMON /PC1/LSQ1(    1437)
      COMMON /PC2/LSQ2(       1)
      COMMON /DIMENS/NND,NNC,NNT,NGL,NGT,NGE,NCC,NUC,NCT,NAT,LENA
     +,NSQ1,NSQ2,NPC,NPT,NSQ3,NVL,NPM,NTE,NSQ4,NCS,LCS
      COMMON /POINTN/LNODE,LCOND,LCONS,LARRY,IVB,LPRES,LTUBE,LCHAR
      COMMON /TAPE/NIN,NOUT,LDAT,LDIC,ASCI,FLUD,GNRL,CHAR
      COMMON /XSPACE/NDIM,NTH,X(  100000)
      COMMON /FIXCON/
     +TIMEN ,DTIMEU,TIMEND,CSGFAC,NLOOP ,DTMPCA,ITROUT,DTIMEH,
     +DAMPA ,DAMPD ,ATMPCA,BACKUP,TIMEO ,TIMEM ,DTMPCC,ATMPCC,
     +CSGMIN,OUTPUT,ARLXCA,LOOPCT,DTIMEL,DTIMEI,CSGMAX,CSGRAL,
     +CSGRCL,DRLXCA,DRLXCC,NLINE ,NPAGE ,ARLXCC,LSPCS ,ENGBAL,
     +BALENG,ATSLIM,NCSGMN,NDTMPC,NARLXC,NATMPC,ITEST ,JTEST ,
     +KTEST ,LTEST ,MTEST ,RTEST ,STEST ,TTEST ,UTEST ,VTEST ,
     +LAXFAC,SIGMA ,TMPZRO,NDRLXC,TDERV ,NTDERV,BENODE,EBNODE,
     +NODEEB,EXTLIM,NCOLUM,PRLXCA,PRLXCC,NEGSIV,GRVCON,PZERO ,
     +NCSGMX,NTEST ,ATEST ,BTEST ,CTEST ,DTEST ,ETEST ,FTEST ,
     +GTEST ,HTEST ,OTEST ,PTEST ,QTEST ,WTEST ,XTEST ,YTEST ,
     +ZTEST ,NTROSS,ISNUNC,NLINPP,LOTEMP,ERRMAX,ERRMIN,SENGIN,
     +DBLPRC,MPCNTL,IPCNT1,IPCNT2,ATSLM1,NLOOP1,JDIFQ ,KMAX  ,
     +FRACHG,EPS   ,PRSABS,PRSREL,FLOABS,FLOREL,FLOMAX,PRANGE,
     +ISOLVE,NPASS ,DEFLIM,ICHECK,GRAV  ,GC1   ,GC2   ,USRFLO,
     +PMPTOL,DEBUGF,NOFERR,GC3   ,SPARE1,SPARE2,SPARE3,SPARE4,
     +SPARE5,SPARE6,SPARE7,NNGSPM,NCONVG
      DIMENSION XK(      9),NX(  100000),IA(       1)
      EQUIVALENCE (K(1),XK(1)),(X(1),NX(1)),(A(1),IA(1))
      LOGICAL ASCI,FLUD,GNRL,CHAR
      RETURN
      END
      SUBROUTINE OUTCAL
      CHARACTER*6 H
      COMMON /TITLE/H(20)
      COMMON /TEMP/T(     54)
      COMMON /CAP/C(     45)
      COMMON /SOURCE/Q(     53)
      COMMON /COND/G(     214)
      COMMON /KONST/K(      9)
      COMMON /ARRAY/A(       1)
      COMMON /PC1/LSQ1(    1437)
      COMMON /PC2/LSQ2(       1)
      COMMON /DIMENS/NND,NNC,NNT,NGL,NGT,NGE,NCC,NUC,NCT,NAT,LENA
     +,NSQ1,NSQ2,NPC,NPT,NSQ3,NVL,NPM,NTE,NSQ4,NCS,LCS
      COMMON /POINTN/LNODE,LCOND,LCONS,LARRY,IVB,LPRES,LTUBE,LCHAR
      COMMON /TAPE/NIN,NOUT,LDAT,LDIC,ASCI,FLUD,GNRL,CHAR
      COMMON /XSPACE/NDIM,NTH,X(  100000)
      COMMON /FIXCON/
     +TIMEN ,DTIMEU,TIMEND,CSGFAC,NLOOP ,DTMPCA,ITROUT,DTIMEH,
     +DAMPA ,DAMPD ,ATMPCA,BACKUP,TIMEO ,TIMEM ,DTMPCC,ATMPCC,
     +CSGMIN,OUTPUT,ARLXCA,LOOPCT,DTIMEL,DTIMEI,CSGMAX,CSGRAL,
     +CSGRCL,DRLXCA,DRLXCC,NLINE ,NPAGE ,ARLXCC,LSPCS ,ENGBAL,
     +BALENG,ATSLIM,NCSGMN,NDTMPC,NARLXC,NATMPC,ITEST ,JTEST ,
     +KTEST ,LTEST ,MTEST ,RTEST ,STEST ,TTEST ,UTEST ,VTEST ,
     +LAXFAC,SIGMA ,TMPZRO,NDRLXC,TDERV ,NTDERV,BENODE,EBNODE,
     +NODEEB,EXTLIM,NCOLUM,PRLXCA,PRLXCC,NEGSIV,GRVCON,PZERO ,
     +NCSGMX,NTEST ,ATEST ,BTEST ,CTEST ,DTEST ,ETEST ,FTEST ,
     +GTEST ,HTEST ,OTEST ,PTEST ,QTEST ,WTEST ,XTEST ,YTEST ,
     +ZTEST ,NTROSS,ISNUNC,NLINPP,LOTEMP,ERRMAX,ERRMIN,SENGIN,
     +DBLPRC,MPCNTL,IPCNT1,IPCNT2,ATSLM1,NLOOP1,JDIFQ ,KMAX  ,
     +FRACHG,EPS   ,PRSABS,PRSREL,FLOABS,FLOREL,FLOMAX,PRANGE,
     +ISOLVE,NPASS ,DEFLIM,ICHECK,GRAV  ,GC1   ,GC2   ,USRFLO,
     +PMPTOL,DEBUGF,NOFERR,GC3   ,SPARE1,SPARE2,SPARE3,SPARE4,
     +SPARE5,SPARE6,SPARE7,NNGSPM,NCONVG
      DIMENSION XK(      9),NX(  100000),IA(       1)
      EQUIVALENCE (K(1),XK(1)),(X(1),NX(1)),(A(1),IA(1))
      LOGICAL ASCI,FLUD,GNRL,CHAR
      CALL TPRINT                                                       
      RETURN
      END
      SUBROUTINE VARBLF
      RETURN
      END