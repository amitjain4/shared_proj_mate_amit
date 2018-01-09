* **********************************************
* *             TSMC SPICE MODEL               *
* **********************************************
*  
*    PROCESS :  0.25um Mixed-Signal SALICIDE(2P5M or 1P5M+, 2.5V/3.3V)
*     MODEL  :  BSIM3 ( Mixed V3.1 & V3.2 )
*    DOC. NO.:  T-025-MM-SP-001
*    VERSION :  1.7
*    DATE    :  Sep. 26, 2001
*    HSPICE VERSION : For H98.2 & H98.4 only
*
******************************************************************************
*                                                                            *
*       IN THIS MODEL LIB CONTAINS :                                         *
*                                                                            *
*       1.LIB TT                                                             *
*             SS                                                             *
*             FF                                                             *                                                          *
*       (2.5V Nominal Vt devices with different geometric and corner models) *
*                                                                            *
*                                                                            *
*       9.LIB TT_BIP                                                         *
*             SS_BIP                                                         *
*             FF_BIP                                                         *
*        ( 10x10, 5x5 and 2x2 vertical PNP bipolar)                    *
*                                                                            *
*                                                                            *
*      11.LIB RES                                                            *
*                                                                            *
******************************************************************************
*
* 1)To use these models directly by programming in this style: 
*
*     .lib 'lib_path/lib_name' corner_name 
*
*  EX: .lib '/home/user/tsmc/MIXED025/mix025_1.l' TT   
*        
*             for typical 2.5V Nominal Vt Devices
*      
*      
* note:
* corner_name
* TT : typical model for 2.5V Nominal Vt devices
* SS : Slow NMOS Slow PMOS model for 2.5V Nominal Vt devices
* FF : Fast NMOS Fast PMOS model for 2.5V Nominal Vt devices
*
*
***************************************************************
*                                                             *
*              2.5V NOMINAL Vt DEVICES LIB                    *
*                                                             *
***************************************************************
***************** CORNER_LIB OF TYPICAL MODEL ******************
.LIB TT
.param toxp = 5.4e-9 toxn = 5.4e-9 
+dxl = 0 dxw = 0 
+dvthn = 0.0 dvthp = 0.00 
+cjn = 1.836615E-03    cjp= 1.833935E-03           
+cjswn = 4.234822E-10  cjswp = 3.472876E-10       
+cgon    = 1.3E-10    cgop = 1.6E-10
+cgln = 2.1E-10    cglp = 2.1E-10  
+cjgaten = 3.286035E-10 cjgatep = 2.500235E-10     
+hdifn = 2.625e-07 hdifp = 2.625e-7 
.lib 'mix025_1.l' MOS
.ENDL TT
**************** CORNER_LIB OF  SNSP   MODEL *******************
.LIB SS
.param toxp = 5.7e-9 toxn = 5.7e-9 
+dxl = 2.0e-8 dxw = -3e-8  
+dvthn = 0.06 dvthp = -0.05
+cjn = 1.92844575E-3 cjp= 1.92563175e-3  
+cjswn = 4.4465631E-10 cjswp = 3.6465198e-10 
+cgon    = 1.235E-10 cgop = 1.52e-10
+cgln = 1.995E-10    cglp = 1.995E-10 
+cjgaten = 3.45033675E-10 cjgatep = 2.62524675e-10
+hdifn = 2.625e-07 hdifp = 2.625e-7
.lib 'mix025_1.l' MOS
.ENDL SS
**************** CORNER_LIB OF  FNFP   MODEL *******************
.LIB FF
.param toxp = 5.1e-9 toxn = 5.1e-9 
+dxl = -2.0e-8 dxw = 3e-8  
+dvthn = -0.06 dvthp = 0.05 
+cjn = 1.74478425e-3 cjp= 1.74223825e-3  
+cjswn = 4.0230809e-10 cjswp = 3.2992322e-10 
+cgon    = 1.365e-10 cgop = 1.68e-10
+cgln = 2.205E-10    cglp = 2.205E-10 
+cjgaten = 3.12173325e-10 cjgatep = 2.37522325e-10
+hdifn = 2.625e-07 hdifp = 2.625e-7 
.lib 'mix025_1.l' MOS
.ENDL FF
**************************************************************************
************** CORNER_LIB OF TYPICAL MODEL *********************************
.LIB TT_BIP
.param
+isa= 1         bfa= 1         nfa= 1         rba= 1         rea= 1         
+rca= 1         rbma= 1        cjea= 1        cjca= 1         
.lib 'mix025_1.l' BIP
.ENDL TT_BIP

.LIB MOS
***************************************************************
*                                                             *
*               NORMAL DEVICES MODEL                          *
*                                                             *
***************************************************************
***************************************************************
*                 NMOS DEVICES MODEL                          *
***************************************************************
.MODEL nch.1            NMOS   (                    LMIN     = '1.2E-06-dxl'  
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+LMAX    = 2.1E-01        WMIN     = '1.2E-06-dxw'  WMAX     = 1.01E-01       
+LEVEL   = 49             TNOM     = 25             XL       = '3E-08+dxl'    
+NLEV    = 3              AF       = 0.8824         KF       = 3.454E-24      
+XW      = '0+dxw'        VERSION  = 3.2            TOX      = toxn           
+XJ      = 1E-07          NCH      = 1.63E+17       LLN      = 1              
+LWN     = 1              WLN      = 1              WWN      = 1              
+LINT    = 2E-08          WINT     = 2E-08          MOBMOD   = 1              
+BINUNIT = 2              DWG      = 0              DWB      = 0              
+VTH0    = '0.4767749+dvthn' LVTH0 = 3.507137E-08   WVTH0    = -1.453229E-08  
+PVTH0   = -6.620086E-15  K1       = 0.4472964      LK1      = -5.39693E-08   
+WK1     = -4.269873E-08  PK1      = 5.981896E-14   K2       = 0.004538423    
+LK2     = 2.041006E-08   WK2      = 1.682965E-08   PK2      = -2.784819E-14  
+K3      = 0              DVT0     = 0              DVT1     = 0              
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0              
+DVT2W   = 0              NLX      = 0              W0       = 0              
+K3B     = 0              VSAT     = 120633         LVSAT    = -0.01265326    
+UA      = -9.218065E-10  LUA      = -1.161761E-16  WUA      = 1.451009E-16   
+PUA     = -5.566174E-23  UB       = 1.81497E-18    LUB      = 1.561614E-25   
+WUB     = -2.338524E-25  PUB      = 8.58042E-33    UC       = 4.365745E-11   
+LUC     = 8.007525E-18   WUC      = -7.436576E-18  PUC      = -6.149303E-24  
+RDSW    = 187            PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.03077917     LU0      = 5.598957E-11   
+WU0     = -8.158919E-11  PU0      = 1.090017E-15   A0       = 0.5252816      
+LA0     = 4.042826E-08   WA0      = 1.225374E-07   PA0      = -2.063631E-13  
+KETA    = 0.003461425    LKETA    = -9.223886E-09  WKETA    = -8.366612E-11  
+PKETA   = 1.672486E-15   A1       = 0              A2       = 0.65           
+AGS     = 0.01           B0       = 0              B1       = 0              
+VOFF    = -0.1517445     LVOFF    = 2.086556E-08   WVOFF    = 6.482217E-09   
+PVOFF   = -7.791971E-15  NFACTOR  = 1              CIT      = 0.000377699    
+LCIT    = 7.405382E-10   WCIT     = -6.34899E-10   PCIT     = 7.555298E-16   
+CDSC    = 0              CDSCB    = 0              CDSCD    = 0              
+ETA0    = 3.836953E-05   LETA0    = 2.324929E-10   WETA0    = 8.055062E-12   
+PETA0   = -1.610206E-16  ETAB     = -4.68351E-05   LETAB    = -6.326623E-11  
+DSUB    = 0              PCLM     = 0.4755805      LPCLM    = 4.88145E-07    
+WPCLM   = -6.231367E-09  PPCLM    = 1.245653E-13   PDIBLC1  = 1E-05          
+PDIBLC2 = 0.0002151594   LPDIBLC2 = 5.69396E-09    PDIBLCB  = 0.01           
+DROUT   = 0              PSCBE1   = 1.213673E+08   LPSCBE1  = 265.5531       
+WPSCBE1 = -3.167115      PPSCBE1  = -1.324478E-05  PSCBE2   = 1E-06          
+PVAG    = 0              DELTA    = 0.01           ALPHA0   = 0   
+BETA0   = 20.54463       KT1      = -0.2402984     LKT1     = -1.511487E-08  
+WKT1    = 1.116811E-08   PKT1     = -1.329005E-14  KT2      = -0.02232689    
+LKT2    = -1.527194E-08  WKT2     = -1.12105E-08   PKT2     = 1.287179E-14   
+AT      = 35000          UTE      = -1.688541      LUTE     = 3.778586E-09   
+WUTE    = 1.029916E-07   PUTE     = -5.895606E-14  UA1      = 9.999999E-11   
+UB1     = 0              UC1      = -4.534566E-11  LUC1     = 7.638851E-17   
+WUC1    = 8.059368E-17   PUC1     = -8.934457E-23  KT1L     = 0              
+PRT     = 0              CJ       = cjn            MJ       = 0.4708251      
+PB      = 0.9597901      CJSW     = cjswn          MJSW     = 0.379613       
+PBSW    = 0.9597901      CJSWG    = cjgaten        MJSWG    = 0.379613       
+PBSWG   = 0.9597901      TCJ      = 0.0007391288   TCJSW    = 0.0009081566   
+TPB     = 0.001293296    TPBSW    = 0.001178533    JS       = 2E-06          
+JSW     = 5E-10          CGDO     = cgon           CGSO     = cgon           
+CAPMOD  = 3              NQSMOD   = 0              XPART    = 1              
+CF      = 0              TLEV     = 1              TLEVC    = 1              
+XTI     = 3              N        = 1              HDIF     = hdifn          
+LDIF    = 1.2E-07        RSH      = 4.5            RS       = 0              
+RD      = 0              ACM      = 12             DLC      = 3.49e-9
+DWC     = 5.76e-10       CLC      = 3.82E-08       CLE      = 0.6972
+ACDE    = 0.4            MOIN     = 10             NOFF     = 1.4959
+VOFFCV  = -0.074         CKAPPA   = 2.8769          CGDL    = cgln           
+CGSL    = cgln           CGBO     = 1E-13           TOXM    = 5.4E-9
+TCJSWG  = 0.0009081566    TPBSWG  =0.001178533      ALPHA1  = 18.2625     )


.MODEL nch.2            NMOS   (                    LMIN     = '5E-07-dxl'    
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+LMAX    = '1.2E-06-dxl'  WMIN     = '1.2E-06-dxw'  WMAX     = 1.01E-04       
+LEVEL   = 49             TNOM     = 25             XL       = '3E-08+dxl'    
+NLEV    = 3              AF       = 0.8824         KF       = 3.454E-24      
+XW      = '0+dxw'        VERSION  = 3.2            TOX      = toxn           
+XJ      = 1E-07          NCH      = 1.63E+17       LLN      = 1              
+LWN     = 1              WLN      = 1              WWN      = 1              
+LINT    = 2E-08          WINT     = 2E-08          MOBMOD   = 1              
+BINUNIT = 2              DWG      = 0              DWB      = 0              
+VTH0    = '0.480085+dvthn'  LVTH0 = 3.113235E-08   WVTH0    = -1.147539E-08  
+PVTH0   = -1.02578E-14   K1       = 0.3762577      LK1      = 3.056679E-08   
+WK1     = 3.492754E-08   PK1      = -3.255631E-14  K2       = 0.0326151      
+LK2     = -1.300118E-08  WK2      = -1.660542E-08  PK2      = 1.193954E-14   
+K3      = 0              DVT0     = 0              DVT1     = 0              
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0              
+DVT2W   = 0              NLX      = 0              W0       = 0              
+K3B     = 0              VSAT     = 117000         LVSAT    = -0.008329999   
+UA      = -9.285479E-10  LUA      = -1.081538E-16  WUA      = 8.416258E-17   
+PUA     = 1.685491E-23   UB       = 1.882453E-18   LUB      = 7.585749E-26   
+WUB     = -1.971168E-25  PUB      = -3.513499E-32  UC       = 3.98105E-11    
+LUC     = 1.25854E-17    WUC      = -8.34607E-18   PUC      = -5.067005E-24  
+RDSW    = 187            PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.03199188     LU0      = -1.387133E-09  
+WU0     = 1.902013E-09   PU0      = -1.270471E-15  A0       = 0.5916095      
+LA0     = -3.850192E-08  WA0      = -4.52362E-08   PA0      = -6.712484E-15  
+KETA    = -0.008817595   LKETA    = 5.388149E-09   WKETA    = -5.223959E-09  
+PKETA   = 7.789435E-15   A1       = 0              A2       = 0.6875595      
+LA2     = -4.469588E-08  WA2      = -2.840753E-08  PA2      = 3.380497E-14   
+AGS     = 0.01           B0       = 0              B1       = 0              
+VOFF    = -0.1261269     LVOFF    = -9.619418E-09  WVOFF    = -1.316827E-08  
+PVOFF   = 1.559212E-14   NFACTOR  = 1              CIT      = 0.001          
+CDSC    = 0              CDSCB    = 0              CDSCD    = 0              
+ETA0    = -0.0007765884  LETA0    = 1.202293E-09   WETA0    = 2.948919E-10   
+PETA0   = -5.023566E-16  ETAB     = 0.00018        LETAB    = -3.332E-10     
+DSUB    = 0              PCLM     = 0.1508052      LPCLM    = 8.746276E-07   
+WPCLM   = 1.398081E-08   PPCLM    = 1.00513E-13    PDIBLC1  = 1E-05          
+PDIBLC2 = 0.007192272    LPDIBLC2 = -2.608804E-09  WPDIBLC2 = -9.190361E-10  
+PPDIBLC2= 1.093653E-15   PDIBLCB  = 0.01           DROUT    = 0              
+PSCBE1  = 3.241836E+08   LPSCBE1  = 24.20168       WPSCBE1  = -27.30385      
+PPSCBE1 = 1.547794E-05   PSCBE2   = 1E-06          PVAG     = 0              
+DELTA   = 0.01           ALPHA0   = 0              BETA0    = 20.54463       
+KT1     = -0.241585      LKT1     = -1.35838E-08   WKT1     = -7.332996E-09  
+PKT1    = 8.726266E-15   KT2      = -0.03541818    LKT2     = 3.066966E-10   
+WKT2    = -1.312909E-09  PKT2     = 1.093651E-15   AT       = 35000          
+UTE     = -1.765181      LUTE     = 9.497899E-08   WUTE     = 8.147973E-08   
+PUTE    = -3.3357E-14    UA1      = 9.999999E-11   UB1      = 0              
+UC1     = 5.786665E-11   LUC1     = -4.643415E-17  WUC1     = -4.454013E-17  
+PUC1    = 5.956468E-23   KT1L     = 0              PRT      = 0              
+CJ      = cjn            MJ       = 0.4708251      PB       = 0.9597901      
+CJSW    = cjswn          MJSW     = 0.379613       PBSW     = 0.9597901      
+CJSWG   = cjgaten        MJSWG    = 0.379613       PBSWG    = 0.9597901      
+TCJ     = 0.0007391288   TCJSW    = 0.0009081566   TPB      = 0.001293296    
+TPBSW   = 0.001178533    JS       = 2E-06          JSW      = 5E-10          
+CGDO    = cgon           CGSO     = cgon           CAPMOD   = 3              
+NQSMOD  = 0              XPART    = 1              CF       = 0              
+TLEV    = 1              TLEVC    = 1              XTI      = 3              
+N       = 1              HDIF     = hdifn          LDIF     = 1.2E-07        
+RSH     = 4.5            RS       = 0              RD       = 0              
+ACM     = 12             DLC      = 3.49e-9         DWC     = 5.76e-10       
+CLC     = 3.82E-08       CLE      = 0.6972          ACDE    = 0.4            
+MOIN    = 10             NOFF     = 1.4959          VOFFCV  = -0.074         
+CKAPPA  = 2.8769          CGDL    = cgln           CGSL     = cgln           
+CGBO    = 1E-13           TOXM    = 5.4E-9
+TCJSWG  = 0.0009081566   TPBSWG   =0.001178533     ALPHA1  = 18.2625        )


.MODEL nch.3            NMOS   (                    LMIN     = 2.4E-07        
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+LMAX    = '5E-07-dxl'    WMIN     = '1.2E-06-dxw'  WMAX     = 1.01E-04       
+LEVEL   = 49             TNOM     = 25             XL       = '3E-08+dxl'    
+NLEV    = 3              AF       = 0.8824         KF       = 3.454E-24      
+XW      = '0+dxw'        VERSION  = 3.2            TOX      = toxn           
+XJ      = 1E-07          NCH      = 1.63E+17       LLN      = 1              
+LWN     = 1              WLN      = 1              WWN      = 1              
+LINT    = 2E-08          WINT     = 2E-08          MOBMOD   = 1              
+BINUNIT = 2              DWG      = 0              DWB      = 0              
+VTH0    = '0.5486611+dvthn' LVTH0 = -2.469959E-09  WVTH0    = -7.938721E-08  
+PVTH0   = 2.301899E-14   K1       = 0.403429       LK1      = 1.725285E-08   
+WK1     = -3.072359E-08  PK1      = -3.872562E-16  K2       = 0.03135336     
+LK2     = -1.238293E-08  WK2      = 1.859888E-09   PK2      = 2.891545E-15   
+K3      = 0              DVT0     = 0              DVT1     = 0              
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0              
+DVT2W   = 0              NLX      = 0              W0       = 0              
+K3B     = 0              VSAT     = 103237.4       LVSAT    = -0.001586308   
+WVSAT   = -0.003755342   PVSAT    = 1.840118E-09   UA       = -9.466342E-10  
+LUA     = -9.929151E-17  WUA      = 8.099974E-17   PUA      = 1.840469E-23   
+UB      = 1.680473E-18   LUB      = 1.748276E-25   WUB      = -8.461158E-26  
+PUB     = -9.026253E-32  UC       = 4.822789E-11   LUC      = 8.460881E-18   
+WUC     = -2.012348E-17  PUC      = 7.039261E-25   RDSW     = 187            
+PRWB    = 0              PRWG     = 0              WR       = 1              
+U0      = 0.0300978      LU0      = -4.590353E-10  WU0      = 5.920663E-10   
+PU0     = -6.285965E-16  A0       = 0.2606796      LA0      = 1.236537E-07   
+WA0     = 4.002671E-07   PA0      = -2.250091E-13  KETA     = -0.01653278    
+LKETA   = 9.168588E-09   WKETA    = 3.342296E-08   PKETA    = -1.114756E-14  
+A1      = 0              A2       = 0.552563       LA2      = 2.145243E-08   
+WA2     = 9.555396E-08   PA2      = -2.693616E-14  AGS      = 0.02769231     
+LAGS    = -8.669232E-09  B0       = 0              B1       = 0              
+VOFF    = -0.1309933     LVOFF    = -7.23485E-09   WVOFF    = 8.131762E-09   
+PVOFF   = 5.155098E-15   NFACTOR  = 1              CIT      = 0.001          
+CDSC    = 0              CDSCB    = 0              CDSCD    = 0              
+ETA0    = -0.0009629505  LETA0    = 1.29361E-09    WETA0    = -2.950198E-10  
+PETA0   = -2.132999E-16  ETAB     = 0.0007282808   LETAB    = -6.018576E-10  
+WETAB   = -6.831655E-10  PETAB    = 3.347511E-16   DSUB     = 0              
+PCLM    = 1.549809       LPCLM    = 1.89116E-07    WPCLM    = 3.036521E-07   
+PPCLM   = -4.142599E-14  PDIBLC1  = 1E-05          PDIBLC2  = -0.0009022731  
+LPDIBLC2= 1.357523E-09   WPDIBLC2 = 2.474329E-09   PPDIBLC2 = -5.690957E-16  
+PDIBLCB = 0.01           DROUT    = 0              PSCBE1   = 3.595446E+08   
+LPSCBE1 = 6.874803       WPSCBE1  = -5.550639      PPSCBE1  = 4.818866E-06   
+PSCBE2  = 1E-06          PVAG     = 0              DELTA    = 0.01           
+ALPHA0  = 0              BETA0    = 20.54463       KT1      = -0.3197329     
+LKT1    = 2.470867E-08   WKT1     = 6.111851E-08   PKT1     = -2.481497E-14  
+KT2     = -0.03581296    LKT2     = 5.001353E-10   WKT2     = -5.655404E-09  
+PKT2    = 3.221474E-15   AT       = 35000          UTE      = -1.794323      
+LUTE    = 1.092588E-07   WUTE     = 2.077792E-07   PUTE     = -9.524377E-14  
+UA1     = 9.999999E-11   UB1      = 0              UC1      = -6.039701E-11  
+LUC1    = 1.151504E-17   WUC1     = 1.68016E-16    PUC1     = -4.458779E-23  
+KT1L    = 0              PRT      = 0              CJ       = cjn            
+MJ      = 0.4708251      PB       = 0.9597901      CJSW     = cjswn          
+MJSW    = 0.379613       PBSW     = 0.9597901      CJSWG    = cjgaten        
+MJSWG   = 0.379613       PBSWG    = 0.9597901      TCJ      = 0.0007391288   
+TCJSW   = 0.0009081566   TPB      = 0.001293296    TPBSW    = 0.001178533    
+JS      = 2E-06          JSW      = 5E-10          CGDO     = cgon           
+CGSO    = cgon           CAPMOD   = 3              NQSMOD   = 0              
+XPART   = 1              CF       = 0              TLEV     = 1              
+TLEVC   = 1              XTI      = 3              N        = 1              
+HDIF    = hdifn          LDIF     = 1.2E-07        RSH      = 4.5            
+RS      = 0              RD       = 0              ACM      = 12 
+DLC     = 3.49e-9         DWC     = 5.76e-10        CLC     = 3.82E-08       
+CLE     = 0.6972          ACDE    = 0.4            MOIN     = 10            
+NOFF    = 1.4959          VOFFCV  = -0.074         CKAPPA   = 2.8769         
+CGDL    = cgln           CGSL     = cgln           CGBO     = 1E-13          
+TOXM    = 5.4E-9  
+TCJSWG  = 0.0009081566   TPBSWG   = 0.001178533    ALPHA1  = 18.2625 )


.MODEL nch.4            NMOS   (                    LMIN     = '1.2E-06-dxl'  
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+LMAX    = 2.1E-05        WMIN     = '6E-07-dxw'    WMAX     = '1.2E-06-dxw'  
+LEVEL   = 49             TNOM     = 25             XL       = '3E-08+dxl'    
+NLEV    = 3              AF       = 0.8824         KF       = 3.454E-24      
+XW      = '0+dxw'        VERSION  = 3.2            TOX      = toxn           
+XJ      = 1E-07          NCH      = 1.63E+17       LLN      = 1              
+LWN     = 1              WLN      = 1              WWN      = 1              
+LINT    = 2E-08          WINT     = 2E-08          MOBMOD   = 1              
+BINUNIT = 2              DWG      = 0              DWB      = 0              
+VTH0    = '0.4757147+dvthn' LVTH0 = 3.377297E-08   WVTH0    = -1.330241E-08  
+PVTH0   = -5.113942E-15  K1       = 0.4482435      LK1      = -7.666146E-08  
+WK1     = -4.379736E-08  PK1      = 8.614186E-14   K2       = 0.004124679    
+LK2     = 1.931997E-08   WK2      = 1.730959E-08   PK2      = -2.658369E-14  
+K3      = 0              DVT0     = 0              DVT1     = 0              
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0              
+DVT2W   = 0              NLX      = 0              W0       = 0              
+K3B     = 0              VSAT     = 120633         LVSAT    = -0.01265326    
+UA      = -8.774753E-10  LUA      = -9.257552E-17  WUA      = 9.367673E-17   
+PUA     = -8.303838E-23  UB       = 1.732383E-18   LUB      = 1.038218E-25   
+WUB     = -1.380513E-25  PUB      = 6.929437E-32   UC       = 4.39393E-11    
+LUC     = -1.066795E-18  WUC      = -7.763515E-18  PUC      = 4.37691E-24    
+RDSW    = 187            PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.02993191     LU0      = 8.882915E-10   
+WU0     = 9.012331E-10   PU0      = 1.245466E-16   A0       = 0.5194464      
+LA0     = 8.30559E-08    WA0      = 1.293062E-07   PA0      = -2.558111E-13  
+KETA    = 0.003234427    LKETA    = -4.686199E-09  WKETA    = 1.796517E-10   
+PKETA   = -3.59123E-15   A1       = 0              A2       = 0.65           
+AGS     = 0.01           B0       = 0              B1       = 0              
+VOFF    = -0.1378668     LVOFF    = 1.011367E-08   WVOFF    = -9.615865E-09  
+PVOFF   = 4.680216E-15   NFACTOR  = 1              CIT      = -0.0001709485  
+LCIT    = 1.418262E-09   WCIT     = 1.532256E-12   PCIT     = -3.062977E-17  
+CDSC    = 0              CDSCB    = 0              CDSCD    = 0              
+ETA0    = 4.796829E-05   LETA0    = 4.061402E-11   WETA0    = -3.079489E-12  
+PETA0   = 6.155895E-17   ETAB     = -4.68351E-05   LETAB    = -6.326623E-11  
+DSUB    = 0              PCLM     = 0.484661       LPCLM    = 3.066276E-07   
+WPCLM   = -1.676466E-08  PPCLM    = 3.351254E-13   PDIBLC1  = 1E-05          
+PDIBLC2 = 0.000156081    LPDIBLC2 = 6.874929E-09   WPDIBLC2 = 6.853093E-11   
+PPDIBLC2= -1.369924E-15  PDIBLCB  = 0.01           DROUT    = 0              
+PSCBE1  = 1.163897E+08   LPSCBE1  = 228.0433       WPSCBE1  = 2.606975       
+PPSCBE1 = 3.026657E-05   PSCBE2   = 1E-06          PVAG     = 0              
+DELTA   = 0.01           ALPHA0   = 0              BETA0    = 20.54463       
+KT1     = -0.2226133     LKT1     = -3.838151E-08  WKT1     = -9.34664E-09   
+PKT1    = 1.369925E-14   KT2      = -0.02836646    LKT2     = -7.600383E-09  
+WKT2    = -4.204605E-09  PKT2     = 3.972783E-15   AT       = 35000          
+UTE     = -1.647816      LUTE     = -1.705808E-08  WUTE     = 5.575017E-08   
+PUTE    = -3.478553E-14  UA1      = 9.999999E-11   UB1      = 0              
+UC1     = 2.000607E-11   LUC1     = 1.61118E-18    WUC1     = 4.785674E-18   
+PUC1    = -2.602856E-24  KT1L     = 0              PRT      = 0              
+CJ      = cjn            MJ       = 0.4708251      PB       = 0.9597901      
+CJSW    = cjswn          MJSW     = 0.379613       PBSW     = 0.9597901      
+CJSWG   = cjgaten        MJSWG    = 0.379613       PBSWG    = 0.9597901      
+TCJ     = 0.0007391288   TCJSW    = 0.0009081566   TPB      = 0.001293296    
+TPBSW   = 0.001178533    JS       = 2E-06          JSW      = 5E-10          
+CGDO    = cgon           CGSO     = cgon           CAPMOD   = 3              
+NQSMOD  = 0              XPART    = 1              CF       = 0              
+TLEV    = 1              TLEVC    = 1              XTI      = 3              
+N       = 1              HDIF     = hdifn          LDIF     = 1.2E-07        
+RSH     = 4.5            RS       = 0              RD       = 0              
+ACM     = 12             DLC      = 3.49e-9         DWC     = 5.76e-10       
+CLC     = 3.82E-08       CLE      = 0.6972          ACDE    = 0.4            
+MOIN    = 10             NOFF     = 1.4959          VOFFCV  = -0.074         
+CKAPPA  = 2.8769          CGDL    = cgln            CGSL    = cgln           
+CGBO    = 1E-13           TOXM    = 5.4E-9
+TCJSWG  = 0.0009081566    TPBSWG  = 0.001178533     ALPHA1  = 18.2625            )


.MODEL nch.5            NMOS   (                    LMIN     = '5E-07-dxl'    
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+LMAX    = '1.2E-06-dxl'  WMIN     = '6E-07-dxw'    WMAX     = '1.2E-06-dxw'  
+LEVEL   = 49             TNOM     = 25             XL       = '3E-08+dxl'    
+NLEV    = 3              AF       = 0.8824         KF       = 3.454E-24      
+XW      = '0+dxw'        VERSION  = 3.2            TOX      = toxn           
+XJ      = 1E-07          NCH      = 1.63E+17       LLN      = 1              
+LWN     = 1              WLN      = 1              WWN      = 1              
+LINT    = 2E-08          WINT     = 2E-08          MOBMOD   = 1              
+BINUNIT = 2              DWG      = 0              DWB      = 0              
+VTH0    = '0.481934+dvthn'  LVTH0 = 2.637191E-08   WVTH0    = -1.362026E-08  
+PVTH0   = -4.735691E-15  K1       = 0.3374388      LK1      = 5.519612E-08   
+WK1     = 7.995742E-08   PK1      = -6.112635E-14  K2       = 0.03707206     
+LK2     = -1.988742E-08  WK2      = -2.177551E-08  PK2      = 1.992759E-14   
+K3      = 0              DVT0     = 0              DVT1     = 0              
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0              
+DVT2W   = 0              NLX      = 0              W0       = 0              
+K3B     = 0              VSAT     = 117000         LVSAT    = -0.008329999   
+UA      = -8.541041E-10  LUA      = -1.203873E-16  WUA      = -2.192285E-18  
+PUA     = 3.104573E-23   UB       = 1.76289E-18    LUB      = 6.751837E-26   
+WUB     = -5.842446E-26  PUB      = -2.546161E-32  UC       = 3.6076E-11     
+LUC     = 8.290533E-18   WUC      = -4.014048E-18  PUC      = -8.495769E-26  
+RDSW    = 187            PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.03247865     LU0      = -2.14233E-09   
+WU0     = 1.337359E-09   PU0      = -3.94443E-16   A0       = 0.598654       
+LA0     = -1.120114E-08  WA0      = -5.340778E-08  PA0      = -3.838139E-14  
+KETA    = -0.00986148    LKETA    = 1.089793E-08   WKETA    = -4.01305E-09   
+PKETA   = 1.398085E-15   A1       = 0              A2       = 0.6459855      
+LA2     = 4.777159E-09   WA2      = 1.981828E-08   PA2      = -2.358376E-14  
+AGS     = 0.01           B0       = 0              B1       = 0              
+VOFF    = -0.1254767     LVOFF    = -4.630622E-09  WVOFF    = -1.39225E-08   
+PVOFF   = 9.805112E-15   NFACTOR  = 1              CIT      = 0.001035476    
+LCIT    = -1.738315E-11  WCIT     = -4.115196E-11  PCIT     = 2.016446E-17   
+CDSC    = 0              CDSCB    = 0              CDSCD    = 0              
+ETA0    = -0.0006976344  LETA0    = 9.278814E-10   WETA0    = 2.033054E-10   
+PETA0   = -1.840392E-16  ETAB     = 0.0001799999   LETAB    = -3.331999E-10  
+DSUB    = 0              PCLM     = 0.1260547      LPCLM    = 7.333693E-07   
+WPCLM   = 4.269131E-08   PPCLM    = 2.643727E-13   PDIBLC1  = 1E-05          
+PDIBLC2 = 0.007986665    LPDIBLC2 = -2.443465E-09  WPDIBLC2 = -1.840532E-09  
+PPDIBLC2= 9.018606E-16   PDIBLCB  = 0.01           DROUT    = 0              
+PSCBE1  = 2.436513E+08   LPSCBE1  = 76.60198       WPSCBE1  = 66.11369       
+PPSCBE1 = -4.530643E-05  PSCBE2   = 1E-06          PVAG     = 0              
+DELTA   = 0.01           ALPHA0   = 0              BETA0    = 20.54463       
+KT1     = -0.2456728     LKT1     = -1.094075E-08  WKT1     = -2.591242E-09  
+PKT1    = 5.660332E-15   KT2      = -0.03822067    LKT2     = 4.126123E-09   
+WKT2    = 1.937973E-09   PKT2     = -3.336885E-15  AT       = 35000          
+UTE     = -1.71088       LUTE     = 5.798823E-08   WUTE     = 1.84915E-08    
+PUTE    = 9.552284E-15   UA1      = 9.999999E-11   UB1      = 0              
+UC1     = 1.964733E-11   LUC1     = 2.038075E-18   WUC1     = -2.05704E-19   
+PUC1    = 3.336885E-24   KT1L     = 0              PRT      = 0              
+CJ      = cjn            MJ       = 0.4708251      PB       = 0.9597901      
+CJSW    = cjswn          MJSW     = 0.379613       PBSW     = 0.9597901      
+CJSWG   = cjgaten        MJSWG    = 0.379613       PBSWG    = 0.9597901      
+TCJ     = 0.0007391288   TCJSW    = 0.0009081566   TPB      = 0.001293296    
+TPBSW   = 0.001178533    JS       = 2E-06          JSW      = 5E-10          
+CGDO    = cgon           CGSO     = cgon           CAPMOD   = 3              
+NQSMOD  = 0              XPART    = 1              CF       = 0              
+TLEV    = 1              TLEVC    = 1              XTI      = 3              
+N       = 1              HDIF     = hdifn          LDIF     = 1.2E-07        
+RSH     = 4.5            RS       = 0              RD       = 0              
+ACM     = 12             DLC      = 3.49e-9         DWC     = 5.76e-10       
+CLC     = 3.82E-08       CLE      = 0.6972          ACDE    = 0.4            
+MOIN    = 10             NOFF     = 1.4959          VOFFCV  = -0.074         
+CKAPPA  = 2.8769          CGDL    = cgln           CGSL     = cgln          
+CGBO    = 1E-13          TOXM    = 5.4E-9
+TCJSWG  = 0.0009081566   TPBSWG  = 0.001178533      ALPHA1  = 18.2625            )


.MODEL nch.6            NMOS   (                    LMIN     = 2.4E-07        
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+LMAX    = '5E-07-dxl'    WMIN     = '6E-07-dxw'    WMAX     = '1.2E-06-dxw'  
+LEVEL   = 49             TNOM     = 25             XL       = '3E-08+dxl'    
+NLEV    = 3              AF       = 0.8824         KF       = 3.454E-24      
+XW      = '0+dxw'        VERSION  = 3.2            TOX      = toxn           
+XJ      = 1E-07          NCH      = 1.63E+17       LLN      = 1              
+LWN     = 1              WLN      = 1              WWN      = 1              
+LINT    = 2E-08          WINT     = 2E-08          MOBMOD   = 1              
+BINUNIT = 2              DWG      = 0              DWB      = 0              
+VTH0    = '0.5303662+dvthn' LVTH0 = 2.640164E-09   WVTH0    = -5.816504E-08  
+PVTH0   = 1.709125E-14   K1       = 0.4233184      LK1      = 1.31151E-08    
+WK1     = -5.379541E-08  PK1      = 4.412533E-15   K2       = 0.01368501     
+LK2     = -8.42777E-09   WK2      = 2.235518E-08   PK2      = -1.696441E-15  
+K3      = 0              DVT0     = 0              DVT1     = 0              
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0              
+DVT2W   = 0              NLX      = 0              W0       = 0              
+K3B     = 0              VSAT     = 100000         UA       = -9.441692E-10  
+LUA     = -7.625538E-17  WUA      = 7.814029E-17   PUA      = -8.317222E-24  
+UB      = 1.700655E-18   LUB      = 9.801343E-26   WUB      = -1.080236E-25  
+PUB     = -1.158023E-33  UC       = 2.895671E-11   LUC      = 1.177898E-17   
+WUC     = 2.231078E-18   PUC      = -3.14507E-24   RDSW     = 187            
+PRWB    = 0              PRWG     = 0              WR       = 1              
+U0      = 0.03061502     LU0      = -1.229151E-09  WU0      = -7.907178E-12  
+PU0     = 2.647372E-16   A0       = 0.8197666      LA0      = -1.195463E-07  
+WA0     = -2.482739E-07  PA0      = 5.7103E-14     KETA     = 0.01395927     
+LKETA   = -7.742342E-10  WKETA    = -1.947806E-09  PKETA    = 3.861159E-16   
+A1      = 0              A2       = 0.7194594      LA2      = -3.122499E-08  
+WA2     = -9.804585E-08  PA2      = 3.416966E-14   AGS      = 0.04420383     
+LAGS    = -1.675987E-08  WAGS     = -1.915335E-08  PAGS     = 9.385144E-15   
+B0      = 0              B1       = 0              VOFF     = -0.1320821     
+LVOFF   = -1.393964E-09  WVOFF    = 9.394735E-09   PVOFF    = -1.620331E-15  
+NFACTOR = 1              CIT      = 0.001          CDSC     = 0              
+CDSCB   = 0              CDSCD    = 0              ETA0     = -0.001729269   
+LETA0   = 1.433383E-09   WETA0    = 5.9391E-10     PETA0    = -3.754355E-16  
+ETAB    = 0.0002658953   LETAB    = -3.752887E-10  WETAB    = -1.467984E-10  
+PETAB   = 7.19312E-17    DSUB     = 0              PCLM     = 0.9113339      
+LPCLM   = 3.485825E-07   WPCLM    = 1.044283E-06   PPCLM    = -2.264072E-13  
+PDIBLC1 = 1E-05          PDIBLC2  = 0.001230769    LPDIBLC2 = 8.669232E-10   
+PDIBLCB = 0.01           DROUT    = 0              PSCBE1   = 3.963876E+08   
+LPSCBE1 = 1.761165       WPSCBE1  = -48.28861      PPSCBE1  = 1.075069E-05   
+PSCBE2  = 1E-06          PVAG     = 0              DELTA    = 0.01           
+ALPHA0  = 0              BETA0    = 20.54463       KT1      = -0.2976346     
+LKT1    = 1.452053E-08   WKT1     = 3.54844E-08    PKT1     = -1.299673E-14  
+KT2     = -0.03843019    LKT2     = 4.228789E-09   WKT2     = -2.619415E-09  
+PKT2    = -1.103765E-15  AT       = 35000          UTE      = -1.693497      
+LUTE    = 4.94704E-08    WUTE     = 9.08211E-08    PUTE     = -2.588921E-14  
+UA1     = 9.999999E-11   UB1      = 0              UC1      = 8.935621E-11   
+LUC1    = -3.211927E-17  WUC1     = -5.697779E-18  PUC1     = 6.028002E-24   
+KT1L    = 0              PRT      = 0              CJ       = cjn            
+MJ      = 0.4708251      PB       = 0.9597901      CJSW     = cjswn          
+MJSW    = 0.379613       PBSW     = 0.9597901      CJSWG    = cjgaten        
+MJSWG   = 0.379613       PBSWG    = 0.9597901      TCJ      = 0.0007391288   
+TCJSW   = 0.0009081566   TPB      = 0.001293296    TPBSW    = 0.001178533    
+JS      = 2E-06          JSW      = 5E-10          CGDO     = cgon           
+CGSO    = cgon           CAPMOD   = 3              NQSMOD   = 0              
+XPART   = 1              CF       = 0              TLEV     = 1              
+TLEVC   = 1              XTI      = 3              N        = 1              
+HDIF    = hdifn          LDIF     = 1.2E-07        RSH      = 4.5            
+RS      = 0              RD       = 0              ACM      = 12             
+DLC      = 3.49e-9        DWC     = 5.76e-10        CLC     = 3.82E-08       
+CLE      = 0.6972         ACDE    = 0.4            MOIN     = 10            
+NOFF     = 1.4959         VOFFCV  = -0.074         CKAPPA   = 2.8769         
+CGDL     = cgln          CGSL     = cgln           CGBO     = 1E-13          
+TOXM    = 5.4E-9
+TCJSWG  = 0.0009081566    TPBSWG  = 0.001178533     ALPHA1  = 18.2625              )


.MODEL nch.7            NMOS   (                    LMIN     = '1.2E-06-dxl'  
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+LMAX    = 2.1E-05        WMIN     = 3E-07          WMAX     = '6E-07-dxw'    
+LEVEL   = 49             TNOM     = 25             XL       = '3E-08+dxl'    
+NLEV    = 3              AF       = 0.8824         KF       = 3.454E-24      
+XW      = '0+dxw'        VERSION  = 3.2            TOX      = toxn           
+XJ      = 1E-07          NCH      = 1.63E+17       LLN      = 1              
+LWN     = 1              WLN      = 1              WWN      = 1              
+LINT    = 2E-08          WINT     = 2E-08          MOBMOD   = 1              
+BINUNIT = 2              DWG      = 0              DWB      = 0              
+VTH0    = '0.469492+dvthn'  LVTH0 = 1.360897E-08   WVTH0    = -9.817708E-09  
+PVTH0   = 6.177896E-15   K1       = 0.3375296      LK1      = 1.359622E-07   
+WK1     = 1.82024E-08    PK1      = -3.292741E-14  K2       = 0.04089266     
+LK2     = -4.264537E-08  WK2      = -3.280478E-09  PK2      = 8.116908E-15   
+K3      = 0              DVT0     = 0              DVT1     = 0              
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0              
+DVT2W   = 0              NLX      = 0              W0       = 0              
+K3B     = 0              VSAT     = 120633         LVSAT    = -0.01265326    
+UA      = -8.450057E-10  LUA      = -2.108624E-16  WUA      = 7.549376E-17   
+PUA     = -1.679773E-23  UB       = 1.63455E-18    LUB      = 1.676599E-25   
+WUB     = -8.326477E-26  PUB      = 3.354502E-32   UC       = 3.858849E-11   
+LUC     = 3.428895E-18   WUC      = -4.767065E-18  PUC      = 1.859323E-24   
+RDSW    = 187            PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.03020876     LU0      = 1.714186E-10   
+WU0     = 7.461978E-10   PU0      = 5.259954E-16   A0       = 0.7903264      
+LA0     = -4.283805E-07  WA0      = -2.238654E-08  PA0      = 3.059329E-14   
+KETA    = 0.003558664    LKETA    = -1.116768E-08  WKETA    = -1.921008E-12  
+PKETA   = 3.839989E-17   A1       = 0              A2       = 0.65           
+AGS     = 0.02843049     LAGS     = -2.193229E-08  WAGS     = -1.032108E-08  
+PAGS    = 1.228208E-14   B0       = 0              B1       = 0              
+VOFF    = -0.1688157     LVOFF    = 2.524642E-08   WVOFF    = 7.715525E-09   
+PVOFF   = -3.794123E-15  NFACTOR  = 1              CIT      = -0.0002614005  
+LCIT    = 1.451401E-09   WCIT     = 5.218538E-11   PCIT     = -4.918741E-17  
+CDSC    = 0              CDSCB    = 0              CDSCD    = 0              
+ETA0    = 3.86854E-05    LETA0    = 2.261786E-10   WETA0    = 2.118922E-12   
+PETA0   = -4.235722E-17  ETAB     = -4.68351E-05   LETAB    = -6.326623E-11  
+DSUB    = 0              PCLM     = 0.4489585      LPCLM    = 1.02032E-06    
+WPCLM   = 3.228726E-09   PPCLM    = -6.454244E-14  PDIBLC1  = 1E-05          
+PDIBLC2 = 0.0003333156   LPDIBLC2 = 3.332022E-09   WPDIBLC2 = -3.072054E-11  
+PPDIBLC2= 6.14104E-16    PDIBLCB  = 0.01           DROUT    = 0              
+PSCBE1  = 1.210322E+08   LPSCBE1  = 286.5705       WPSCBE1  = 0.007136342    
+PPSCBE1 = -2.508679E-06  PSCBE2   = 1E-06          PVAG     = 0              
+DELTA   = 0.01           ALPHA0   = 0              BETA0    = 20.54463       
+KT1     = -0.2330176     LKT1     = -1.830499E-08  WKT1     = -3.520215E-09  
+PKT1    = 2.456403E-15   KT2      = -0.04057778    LKT2     = 1.035036E-08   
+WKT2    = 2.633734E-09   PKT2     = -6.079633E-15  AT       = 35000          
+UTE     = -1.659862      LUTE     = 3.421758E-08   WUTE     = 6.249554E-08   
+PUTE    = -6.349991E-14  UA1      = 9.999999E-11   UB1      = 0              
+UC1     = 3.192869E-11   LUC1     = -1.509954E-17  WUC1     = -1.890993E-18  
+PUC1    = 6.755146E-24   KT1L     = 0              PRT      = 0              
+CJ      = cjn            MJ       = 0.4708251      PB       = 0.9597901      
+CJSW    = cjswn          MJSW     = 0.379613       PBSW     = 0.9597901      
+CJSWG   = cjgaten        MJSWG    = 0.379613       PBSWG    = 0.9597901      
+TCJ     = 0.0007391288   TCJSW    = 0.0009081566   TPB      = 0.001293296    
+TPBSW   = 0.001178533    JS       = 2E-06          JSW      = 5E-10          
+CGDO    = cgon           CGSO     = cgon           CAPMOD   = 3              
+NQSMOD  = 0              XPART    = 1              CF       = 0              
+TLEV    = 1              TLEVC    = 1              XTI      = 3              
+N       = 1              HDIF     = hdifn          LDIF     = 1.2E-07        
+RSH     = 4.5            RS       = 0              RD       = 0              
+ACM     = 12             DLC      = 3.49e-9         DWC     = 5.76e-10       
+CLC     = 3.82E-08       CLE      = 0.6972          ACDE    = 0.4            
+MOIN     = 10            NOFF     = 1.4959          VOFFCV  = -0.074         
+CKAPPA   = 2.8769         CGDL    = cgln           CGSL     = cgln          
+CGBO     = 1E-13          TOXM    = 5.4E-9
+TCJSWG  = 0.0009081566    TPBSWG   = 0.001178533    ALPHA1  = 18.2625             )


.MODEL nch.8            NMOS   (                    LMIN     = '5E-07-dxl'    
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+LMAX    = '1.2E-06-dxl'  WMIN     = 3E-07          WMAX     = '6E-07-dxw'    
+LEVEL   = 49             TNOM     = 25             XL       = '3E-08+dxl'    
+NLEV    = 3              AF       = 0.8824         KF       = 3.454E-24      
+XW      = '0+dxw'        VERSION  = 3.2            TOX      = toxn           
+XJ      = 1E-07          NCH      = 1.63E+17       LLN      = 1              
+LWN     = 1              WLN      = 1              WWN      = 1              
+LINT    = 2E-08          WINT     = 2E-08          MOBMOD   = 1              
+BINUNIT = 2              DWG      = 0              DWB      = 0              
+VTH0    = '0.4695187+dvthn' LVTH0 = 1.357722E-08   WVTH0    = -6.667661E-09  
+PVTH0   = 2.429339E-15   K1       = 0.5224338      LK1      = -8.407375E-08  
+WK1     = -2.363977E-08  PK1      = 1.686478E-14   K2       = -0.02031804    
+LK2     = 3.019537E-08   WK2      = 1.036295E-08   PK2      = -8.118774E-15  
+K3      = 0              DVT0     = 0              DVT1     = 0              
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0              
+DVT2W   = 0              NLX      = 0              W0       = 0              
+K3B     = 0              VSAT     = 117000         LVSAT    = -0.008329999   
+UA      = -1.030288E-09  LUA      = 9.623759E-18   WUA      = 9.647082E-17   
+PUA     = -4.176045E-23  UB       = 1.757319E-18   LUB      = 2.156438E-26   
+WUB     = -5.530477E-26  PUB      = 2.726316E-34   UC       = 2.756279E-11   
+LUC     = 1.654948E-17   WUC      = 7.533484E-19   PUC      = -4.709972E-24  
+RDSW    = 187            PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.0338842      LU0      = -4.202359E-09  
+WU0     = 5.5025E-10     PU0      = 7.591736E-16   A0       = 0.4609843      
+LA0     = -3.646335E-08  WA0      = 2.368727E-08   PA0      = -2.423456E-14  
+KETA    = -0.02020751    LKETA    = 1.711407E-08   WKETA    = 1.780727E-09   
+PKETA   = -2.082952E-15  A1       = 0              A2       = 0.7760432      
+LA2     = -1.499914E-07  WA2      = -5.301399E-08  PA2      = 6.308667E-14   
+AGS     = 0.01           B0       = 0              B1       = 0              
+VOFF    = -0.1655848     LVOFF    = 2.140156E-08   WVOFF    = 8.538038E-09   
+PVOFF   = -4.772914E-15  NFACTOR  = 1              CIT      = 0.0009290483   
+LCIT    = 3.476632E-11   WCIT     = 1.844744E-11   PCIT     = -9.039244E-18  
+CDSC    = 0              CDSCB    = 0              CDSCD    = 0              
+ETA0    = 0.0002438662   LETA0    = -1.798666E-11  WETA0    = -3.239351E-10  
+PETA0   = 3.456471E-16   ETAB     = 0.00018        LETAB    = -3.332E-10     
+DSUB    = 0              PCLM     = -0.168158      LPCLM    = 1.754689E-06   
+WPCLM   = 2.074505E-07   PPCLM    = -3.075665E-13  PDIBLC1  = 1E-05          
+PDIBLC2 = 0.00444        LPDIBLC2 = -1.554933E-09  WPDIBLC2 = 1.456001E-10   
+PPDIBLC2= 4.042827E-16   PDIBLCB  = 0.01           DROUT    = 0              
+PSCBE1  = 3.838063E+08   LPSCBE1  = -26.13065      WPSCBE1  = -12.37314      
+PPSCBE1 = 1.222385E-05   PSCBE2   = 1E-06          PVAG     = 0              
+DELTA   = 0.01           ALPHA0   = 0              BETA0    = 20.54463       
+KT1     = -0.2440112     LKT1     = -5.222604E-09  WKT1     = -3.5217E-09    
+PKT1    = 2.458171E-15   KT2      = -0.024516      LKT2     = -8.763156E-09  
+WKT2    = -5.736639E-09  PKT2     = 3.881112E-15   AT       = 35000          
+UTE     = -1.690601      LUTE     = 7.079782E-08   WUTE     = 7.135197E-09   
+PUTE    = 2.378916E-15   UA1      = 9.999999E-11   UB1      = 0              
+UC1     = -2.806519E-13  LUC1     = 2.322958E-17   WUC1     = 1.095397E-17   
+PUC1    = -8.530362E-24  KT1L     = 0              PRT      = 0              
+CJ      = cjn            MJ       = 0.4708251      PB       = 0.9597901      
+CJSW    = cjswn          MJSW     = 0.379613       PBSW     = 0.9597901      
+CJSWG   = cjgaten        MJSWG    = 0.379613       PBSWG    = 0.9597901      
+TCJ     = 0.0007391288   TCJSW    = 0.0009081566   TPB      = 0.001293296    
+TPBSW   = 0.001178533    JS       = 2E-06          JSW      = 5E-10          
+CGDO    = cgon           CGSO     = cgon           CAPMOD   = 3              
+NQSMOD  = 0              XPART    = 1              CF       = 0              
+TLEV    = 1              TLEVC    = 1              XTI      = 3              
+N       = 1              HDIF     = hdifn          LDIF     = 1.2E-07        
+RSH     = 4.5            RS       = 0              RD       = 0              
+ACM     = 12             DLC      = 3.49e-9         DWC     = 5.76e-10       
+CLC     = 3.82E-08       CLE      = 0.6972          ACDE    = 0.4            
+MOIN     = 10            NOFF     = 1.4959          VOFFCV  = -0.074         
+CKAPPA   = 2.8769         CGDL    = cgln           CGSL     = cgln          
+CGBO     = 1E-13          TOXM    = 5.4E-9
+TCJSWG  = 0.0009081566    TPBSWG   = 0.001178533     ALPHA1  = 18.2625              )


.MODEL nch.9            NMOS   (                    LMIN     = 2.4E-07        
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+LMAX    = '5E-07-dxl'    WMIN     = 3E-07          WMAX     = '6E-07-dxw'    
+LEVEL   = 49             TNOM     = 25             XL       = '3E-08+dxl'    
+NLEV    = 3              AF       = 0.8824         KF       = 3.454E-24      
+XW      = '0+dxw'        VERSION  = 3.2            TOX      = toxn           
+XJ      = 1E-07          NCH      = 1.63E+17       LLN      = 1              
+LWN     = 1              WLN      = 1              WWN      = 1              
+LINT    = 2E-08          WINT     = 2E-08          MOBMOD   = 1              
+BINUNIT = 2              DWG      = 0              DWB      = 0              
+VTH0    = '0.4108627+dvthn' LVTH0 = 4.231861E-08   WVTH0    = 8.756873E-09   
+PVTH0   = -5.128681E-15  K1       = 0.3599899      LK1      = -4.476222E-09  
+WK1     = -1.83314E-08   PK1      = 1.426367E-14   K2       = 0.05063694     
+LK2     = -4.572567E-09  WK2      = 1.662095E-09   PK2      = -3.855355E-15  
+K3      = 0              DVT0     = 0              DVT1     = 0              
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0              
+DVT2W   = 0              NLX      = 0              W0       = 0              
+K3B     = 0              VSAT     = 100000         UA       = -8.486279E-10  
+LUA     = -7.938976E-17  WUA      = 2.463717E-17   PUA      = -6.561966E-24  
+UB      = 1.605935E-18   LUB      = 9.574272E-26   WUB      = -5.498016E-26  
+PUB     = 1.135697E-34   UC       = 5.436336E-11   LUC      = 3.417209E-18   
+WUC     = -1.199664E-17  PUC      = 1.537523E-24   RDSW     = 187            
+PRWB    = 0              PRWG     = 0              WR       = 1              
+U0      = 0.02757004     LU0      = -1.108419E-09  WU0      = 1.697283E-09   
+PU0     = 1.971273E-16   A0       = 0.4631498      LA0      = -3.752444E-08  
+WA0     = -4.856845E-08  PA0      = 1.117074E-14   KETA     = 0.03138113     
+LKETA   = -8.16436E-09   WKETA    = -1.170405E-08  PKETA    = 4.524587E-15   
+A1      = 0              A2       = 0.3458887      LA2      = 6.078422E-08   
+WA2     = 1.111537E-07   PA2      = -1.73555E-14   AGS      = 0.01000276     
+LAGS    = -1.351648E-12  WAGS     = -7.58578E-13   PAGS     = 3.717031E-19   
+B0      = 0              B1       = 0              VOFF     = -0.1187136     
+LVOFF   = -1.5653E-09    WVOFF    = 1.908383E-09   PVOFF    = -1.524383E-15  
+NFACTOR = 1              CIT      = 0.001          CDSC     = 0              
+CDSCB   = 0              CDSCD    = 0              ETA0     = -0.002365929   
+LETA0   = 1.260813E-09   WETA0    = 9.504397E-10   PETA0    = -2.787965E-16  
+ETAB    = -0.0005482135  LETAB    = 2.36245E-11    WETAB    = 3.091024E-10   
+PETAB   = -1.514601E-16  DSUB     = 0              PCLM     = 4.576341       
+LPCLM   = -5.701148E-07  WPCLM    = -1.00812E-06   PPCLM    = 2.880632E-13   
+PDIBLC1 = 1E-05          PDIBLC2  = -0.002035899   LPDIBLC2 = 1.618257E-09   
+WPDIBLC2= 1.829334E-09   PPDIBLC2 = -4.207468E-16  PDIBLCB  = 0.01           
+DROUT   = 0              PSCBE1   = 2.555498E+08   LPSCBE1  = 36.71503       
+WPSCBE1 = 30.58058       PPSCBE1  = -8.823475E-06  PSCBE2   = 1E-06          
+PVAG    = 0              DELTA    = 0.01           ALPHA0   = 0   
+BETA0   = 20.54463       KT1      = -0.2142308     LKT1     = -1.981503E-08  
+WKT1    = -1.122173E-08  PKT1     = 6.231184E-15   KT2      = -0.04077411    
+LKT2    = -7.966823E-10  WKT2     = -1.306815E-09  PKT2     = 1.710499E-15   
+AT      = 35000          UTE      = -1.471602      LUTE     = -3.651167E-08  
+WUTE    = -3.343997E-08  PUTE     = 2.226075E-14   UA1      = 9.999999E-11   
+UB1     = 0              UC1      = 9.165399E-11   LUC1     = -2.181839E-17  
+WUC1    = -6.984539E-18  PUC1     = 2.595069E-25   KT1L     = 0              
+PRT     = 0              CJ       = cjn            MJ       = 0.4708251      
+PB      = 0.9597901      CJSW     = cjswn          MJSW     = 0.379613       
+PBSW    = 0.9597901      CJSWG    = cjgaten        MJSWG    = 0.379613       
+PBSWG   = 0.9597901      TCJ      = 0.0007391288   TCJSW    = 0.0009081566   
+TPB     = 0.001293296    TPBSW    = 0.001178533    JS       = 2E-06          
+JSW     = 5E-10          CGDO     = cgon           CGSO     = cgon           
+CAPMOD  = 3              NQSMOD   = 0              XPART    = 1              
+CF      = 0              TLEV     = 1              TLEVC    = 1              
+XTI     = 3              N        = 1              HDIF     = hdifn          
+LDIF    = 1.2E-07        RSH      = 4.5            RS       = 0              
+RD      = 0              ACM      = 12             DLC      = 3.49e-9        
+DWC     = 5.76e-10       CLC     = 3.82E-08        CLE      = 0.6972          
+ACDE    = 0.4            MOIN     = 10            NOFF     = 1.4959          
+VOFFCV  = -0.074         CKAPPA   = 2.8769         CGDL    = cgln           
+CGSL     = cgln          CGBO     = 1E-13          TOXM    = 5.4E-9
+TCJSWG  = 0.0009081566    TPBSWG  = 0.001178533    ALPHA1  = 18.2625             )
*
***************************************************************
*                 PMOS DEVICES MODEL                          *
***************************************************************
.MODEL pch.1            PMOS   (                    LMIN     = '1.2E-06-dxl'  
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+LMAX    = 2.1E-01        WMIN     = '1.2E-06-dxw'  WMAX     = 1.01E-1        
+LEVEL   = 49             TNOM     = 25             VERSION  = 3.2            
+NLEV    = 3              AF       = 1.2828         KF       = 1.184E-23      
+TOX     = toxp           XJ       = 1E-07          NCH      = 4.15E+17       
+LLN     = 1              LWN      = 1              WLN      = 1              
+WWN     = 1              LINT     = 5.2E-08        LL       = 0              
+LW      = 0              LWL      = 0              WINT     = 2.5E-08        
+WL      = 0              WW       = 0              WWL      = 0              
+MOBMOD  = 1              BINUNIT  = 2              XL       = '3E-08+dxl'    
+XW      = '0+dxw'        DWG      = 0              DWB      = 0              
+VTH0    = '-0.5964869+dvthp' LVTH0 = -1.227094E-08  WVTH0    = 5.331006E-09   
+PVTH0   = 4.951822E-15   K1       = 0.6000811      LK1      = -4.272914E-08  
+WK1     = -1.275793E-08  PK1      = 6.864224E-14   K2       = 0.005330595    
+LK2     = 1.236721E-08   WK2      = 4.946015E-09   PK2      = -2.049107E-14  
+K3      = 0              DVT0     = 0              DVT1     = 0              
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0              
+DVT2W   = 0              NLX      = 0              W0       = 0              
+K3B     = 0              VSAT     = 180000         UA       = 6.278216E-10   
+LUA     = -7.532845E-17  WUA      = 1.063208E-16   PUA      = 3.038439E-23   
+UB      = 5.036719E-19   LUB      = 2.151329E-25   WUB      = -2.467893E-25  
+PUB     = -3.285619E-32  UC       = -5.793595E-11  LUC      = 2.487329E-17   
+WUC     = -3.885884E-17  PUC      = 4.396424E-24   RDSW     = 1000           
+PRWB    = 0              PRWG     = 0              WR       = 1              
+U0      = 0.009563554    LU0      = -4.400553E-10  WU0      = 3.135935E-10   
+PU0     = -2.203534E-16  A0       = 0.7584345      LA0      = -1.058737E-07  
+WA0     = 4.878771E-08   PA0      = -2.4806E-14    KETA     = 0.02091301     
+LKETA   = -2.785713E-08  WKETA    = -2.911637E-09  PKETA    = 1.548454E-14   
+A1      = 0              A2       = 0.9            AGS      = 0.01           
+B0      = 0              B1       = 0              VOFF     = -0.1337011     
+LVOFF   = 2.374397E-09   WVOFF    = -3.594663E-09  PVOFF    = 1.62976E-14    
+NFACTOR = 1              CIT      = -0.0001159413  LCIT     = 3.176463E-10   
+WCIT    = 8.992995E-12   PCIT     = -1.791944E-16  CDSC     = 0              
+CDSCB   = 0              CDSCD    = 0              ETA0     = 5E-05          
+ETAB    = -5E-05         DSUB     = 0              PCLM     = 0.5726337      
+LPCLM   = 6.965759E-07   WPCLM    = -1.384238E-07  PPCLM    = 2.927752E-13   
+PDIBLC1 = 1E-05          PDIBLC2  = 0.005          PDIBLCB  = 0.01           
+DROUT   = 0              PSCBE1   = 5E+08          PSCBE2   = 1E-06          
+PVAG    = 0              DELTA    = 0.01           ALPHA0   = 0     
+BETA0   = 19.43759       KT1      = -0.2497616     LKT1     = -5.655294E-09  
+WKT1    = 1.055803E-08   PKT1     = -3.103606E-15  KT2      = -0.02983099    
+LKT2    = -5.4268E-10    WKT2     = 1.542839E-09   PKT2     = -2.182701E-15  
+AT      = 10000          UTE      = -1.037682      LUTE     = 9.182398E-08   
+WUTE    = 6.781937E-09   PUTE     = -6.661502E-15  UA1      = 9.999999E-11   
+UB1     = 0              UC1      = 3.832679E-11   LUC1     = 1.703325E-17   
+WUC1    = 6.655088E-17   PUC1     = -3.097963E-23  KT1L     = 0              
+PRT     = 0              ACM      = 12             HDIF     = hdifp          
+LDIF    = 1.2E-07        RSH      = 3.5            RS       = 0              
+RD      = 0              CJ       = cjp            MJ       = 0.4746122      
+PB      = 0.9522272      CJSW     = cjswp          MJSW     = 0.3296904      
+PBSW    = 0.9522272      CJSWG    = cjgatep        MJSWG    = 0.3296904      
+PBSWG   = 0.9522272      TCJ      = 0.0008154354   TCJSW    = 0.0006079875   
+TPB     = 0.00140666     TPBSW    = 0.001610754    CGDO     = cgop           
+CGSO    = cgop           CAPMOD   = 3              NQSMOD   = 0              
+XTI     = 3              N        = 1              XPART    = 1              
+CF      = 0              TLEV     = 1              TLEVC    = 1              
+JS      = 7E-07          JSW      = 1.4E-10        DLC      = 4.53e-8      
+DWC     = 2.51e-9        CLC      = 6.60E-08       CLE      = 4.25
+ACDE    = 1.54           MOIN     = 23             NOFF     = 1.855
+VOFFCV  = -0.09          CKAPPA   = 1.1056         CGBO     = 1E-13
+CGDL    = cglp           CGSL     = cglp            TOXM    = 5.4E-9
+TCJSWG  = 0.0006079875    TPBSWG  = 0.001610754     ALPHA1  = 0.46878      )


.MODEL pch.2            PMOS   (                    LMIN     = '5E-07-dxl'    
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+LMAX    = '1.2E-06-dxl'  WMIN     = '1.2E-06-dxw'  WMAX     = 1.01E-4        
+LEVEL   = 49             TNOM     = 25             VERSION  = 3.2            
+NLEV    = 3              AF       = 1.2828         KF       = 1.184E-23      
+TOX     = toxp           XJ       = 1E-07          NCH      = 4.15E+17       
+LLN     = 1              LWN      = 1              WLN      = 1              
+WWN     = 1              LINT     = 5.2E-08        LL       = 0              
+LW      = 0              LWL      = 0              WINT     = 2.5E-08        
+WL      = 0              WW       = 0              WWL      = 0              
+MOBMOD  = 1              BINUNIT  = 2              XL       = '3E-08+dxl'    
+XW      = '0+dxw'        DWG      = 0              DWB      = 0              
+VTH0    = '-0.6205021+dvthp' LVTH0 = 1.47701E-08    WVTH0    = 1.223022E-08   
+PVTH0   = -2.81669E-15   K1       = 0.5002295      LK1      = 6.970379E-08   
+WK1     = 1.320323E-07   PK1      = -9.439152E-14  K2       = 0.03748884     
+LK2     = -2.384297E-08  WK2      = -3.573721E-08  PK2      = 2.531823E-14   
+K3      = 0              DVT0     = 0              DVT1     = 0              
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0              
+DVT2W   = 0              NLX      = 0              W0       = 0              
+K3B     = 0              VSAT     = 186085.7       LVSAT    = -0.006852513   
+UA      = 7.112482E-10   LUA      = -1.692668E-16  WUA      = 1.073025E-16   
+PUA     = 2.927899E-23   UB       = 4.521125E-19   LUB      = 2.731887E-25   
+WUB     = -2.809403E-25  PUB      = 5.597786E-33   UC       = -6.685161E-11  
+LUC     = 3.491232E-17   WUC      = -3.399285E-17  PUC      = -1.082677E-24  
+RDSW    = 1000           PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.009724715    LU0      = -6.215216E-10  
+WU0     = -4.916591E-11  PU0      = 1.881137E-16   A0       = 0.7080865      
+LA0     = -4.918191E-08  WA0      = -2.869854E-08  PA0      = 6.244352E-14   
+KETA    = 0.005343372    LKETA    = -1.032572E-08  WKETA    = 1.510625E-08   
+PKETA   = -4.803599E-15  A1       = 0              A2       = 0.9            
+AGS     = 0.01           B0       = 0              B1       = 0              
+VOFF    = -0.144029      LVOFF    = 1.400361E-08   WVOFF    = 1.88887E-08    
+PVOFF   = -9.018662E-15  NFACTOR  = 1              CIT      = -0.0001956218  
+LCIT    = 4.073665E-10   WCIT     = 1.379719E-10   PCIT     = -3.244246E-16  
+CDSC    = 0              CDSCB    = 0              CDSCD    = 0              
+ETA0    = -4.638704E-05  LETA0    = 1.085318E-10   WETA0    = -1.772073E-11  
+PETA0   = 1.995354E-17   ETAB     = 4.128569E-05   LETAB    = -1.027877E-10  
+DSUB    = 0              PCLM     = 1.221788       LPCLM    = -3.437184E-08  
+WPCLM   = 9.644997E-08   PPCLM    = 2.830743E-14   PDIBLC1  = 1E-05          
+PDIBLC2 = 0.005          PDIBLCB  = 0.01           DROUT    = 0              
+PSCBE1  = 5.264135E+08   LPSCBE1  = -29.7416       WPSCBE1  = 2.528262       
+PPSCBE1 = -2.846821E-06  PSCBE2   = 1E-06          PVAG     = 0              
+DELTA   = 0.01           ALPHA0   = 0              BETA0    = 19.43759       
+KT1     = -0.2660047     LKT1     = 1.263433E-08   WKT1     = 1.65062E-08    
+PKT1    = -9.801244E-15  KT2      = -0.03263429    LKT2     = 2.613835E-09   
+WKT2    = -1.232991E-09  PKT2     = 9.428843E-16   AT       = 10000          
+UTE     = -1.010899      LUTE     = 6.166629E-08   WUTE     = -3.579903E-08  
+PUTE    = 4.128467E-14   UA1      = 9.999999E-11   UB1      = 0              
+UC1     = 8.722802E-11   LUC1     = -3.802953E-17  WUC1     = 5.523177E-17   
+PUC1    = -1.823431E-23  KT1L     = 0              PRT      = 0              
+ACM     = 12             HDIF     = hdifp          LDIF     = 1.2E-07        
+RSH     = 3.5            RS       = 0              RD       = 0              
+CJ      = cjp            MJ       = 0.4746122      PB       = 0.9522272      
+CJSW    = cjswp          MJSW     = 0.3296904      PBSW     = 0.9522272      
+CJSWG   = cjgatep        MJSWG    = 0.3296904      PBSWG    = 0.9522272      
+TCJ     = 0.0008154354   TCJSW    = 0.0006079875   TPB      = 0.00140666     
+TPBSW   = 0.001610754    CGDO     = cgop           CGSO     = cgop           
+CAPMOD  = 3              NQSMOD   = 0              XTI      = 3              
+N       = 1              XPART    = 1              CF       = 0              
+TLEV    = 1              TLEVC    = 1              JS       = 7E-07          
+JSW     = 1.4E-10        DLC      = 4.53e-8         DWC     = 2.51e-9        
+CLC     = 6.60E-08       CLE      = 4.25            ACDE    = 1.54           
+MOIN    = 23             NOFF     = 1.855           VOFFCV  = -0.09          
+CKAPPA  = 1.1056         CGBO     = 1E-13           CGDL    = cglp           
+CGSL    = cglp            TOXM    = 5.4E-9
+TCJSWG  = 0.0006079875    TPBSWG  = 0.001610754     ALPHA1  = 0.46878   )


.MODEL pch.3            PMOS   (                    LMIN     = 2.4E-07        
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+LMAX    = '5E-07-dxl'    WMIN     = '1.2E-06-dxw'  WMAX     = 1.01E-4        
+LEVEL   = 49             TNOM     = 25             VERSION  = 3.2            
+NLEV    = 3              AF       = 1.2828         KF       = 1.184E-23      
+TOX     = toxp           XJ       = 1E-07          NCH      = 4.15E+17       
+LLN     = 1              LWN      = 1              WLN      = 1              
+WWN     = 1              LINT     = 5.2E-08        LL       = 0              
+LW      = 0              LWL      = 0              WINT     = 2.5E-08        
+WL      = 0              WW       = 0              WWL      = 0              
+MOBMOD  = 1              BINUNIT  = 2              XL       = '3E-08+dxl'    
+XW      = '0+dxw'        DWG      = 0              DWB      = 0              
+VTH0    = '-0.6146093+dvthp' LVTH0 = 1.225977E-08   WVTH0    = 1.985369E-08   
+PVTH0   = -6.06429E-15   K1       = 0.7276184      LK1      = -2.716388E-08  
+WK1     = -1.395578E-07  PK1      = 2.130584E-14   K2       = -0.01029779    
+LK2     = -3.485872E-09  WK2      = 3.685143E-08   PK2      = -5.604526E-15  
+K3      = 0              DVT0     = 0              DVT1     = 0              
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0              
+DVT2W   = 0              NLX      = 0              W0       = 0              
+K3B     = 0              VSAT     = 173192.3       LVSAT    = -0.001359923   
+UA      = 8.541846E-11   LUA      = 9.733665E-17   WUA      = 1.519905E-16   
+PUA     = 1.02419E-23    UB       = 8.476358E-19   LUB      = 1.046959E-25   
+WUB     = -2.65695E-25   PUB      = -8.967035E-34  UC       = -1.847504E-11  
+LUC     = 1.43039E-17    WUC      = -5.906381E-18  PUC      = -1.304751E-23  
+RDSW    = 1000           PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.007833129    LU0      = 1.842939E-10   
+WU0     = 5.259558E-10   PU0      = -5.688812E-17  A0       = 0.5132501      
+LA0     = 3.381841E-08   WA0      = 9.134673E-08   PA0      = 1.130424E-14   
+KETA    = -0.03102319    LKETA    = 5.166434E-09   WKETA    = 7.930221E-09   
+PKETA   = -1.746611E-15  A1       = 0              A2       = 0.8911977      
+LA2     = 3.749746E-09   WA2      = 1.277979E-08   PA2      = -5.44419E-15   
+AGS     = 0.008331296    LAGS     = 7.108682E-10   WAGS     = 1.660363E-08   
+PAGS    = -7.073146E-15  B0       = 0              B1       = 0              
+VOFF    = -0.1054648     LVOFF    = -2.424728E-09  WVOFF    = -1.799239E-08  
+PVOFF   = 6.692681E-15   NFACTOR  = 1              CIT      = 0.0008942893   
+LCIT    = -5.69356E-11   WCIT     = -1.154705E-09  PCIT     = 2.26256E-16    
+CDSC    = 0              CDSCB    = 0              CDSCD    = 0              
+ETA0    = -0.002334355   LETA0    = 1.083206E-09   WETA0    = 1.200188E-10   
+PETA0   = -3.872342E-17  ETAB     = 0.001142361    LETAB    = -5.718457E-10  
+WETAB   = 1.887219E-10   PETAB    = -8.039552E-17  DSUB     = 0              
+PCLM    = 1.04323        LPCLM    = 4.169387E-08   WPCLM    = 2.347217E-07   
+PPCLM   = -3.059635E-14  PDIBLC1  = 1E-05          PDIBLC2  = 0.005          
+PDIBLCB = 0.01           DROUT    = 0              PSCBE1   = 4.512553E+08   
+LPSCBE1 = 2.275782       WPSCBE1  = 8.813572       PPSCBE1  = -5.524364E-06  
+PSCBE2  = 1E-06          PVAG     = 0              DELTA    = 0.01           
+ALPHA0  = 0              BETA0    = 19.43759       KT1      = -0.2149899     
+LKT1    = -9.097961E-09  WKT1     = -1.270587E-08  PKT1     = 2.643099E-15   
+KT2     = -0.03321986    LKT2     = 2.863286E-09   WKT2     = 8.506876E-09   
+PKT2    = -3.206299E-15  AT       = 10000          UTE      = -0.8437479     
+LUTE    = -9.539935E-09  WUTE     = 2.728344E-08   PUTE     = 1.441154E-14   
+UA1     = 4.15469E-10    LUA1     = -1.343898E-16  WUA1     = -3.627893E-16  
+PUA1    = 1.545482E-22   UB1      = 0              UC1      = 2.159457E-11   
+LUC1    = -1.006969E-17  WUC1     = -4.128744E-17  PUC1     = 2.288286E-23   
+KT1L    = 0              PRT      = 0              ACM      = 12             
+HDIF    = hdifp          LDIF     = 1.2E-07        RSH      = 3.5            
+RS      = 0              RD       = 0              CJ       = cjp            
+MJ      = 0.4746122      PB       = 0.9522272      CJSW     = cjswp          
+MJSW    = 0.3296904      PBSW     = 0.9522272      CJSWG    = cjgatep        
+MJSWG   = 0.3296904      PBSWG    = 0.9522272      TCJ      = 0.0008154354   
+TCJSW   = 0.0006079875   TPB      = 0.00140666     TPBSW    = 0.001610754    
+CGDO    = cgop           CGSO     = cgop           CAPMOD   = 3              
+NQSMOD  = 0              XTI      = 3              N        = 1              
+XPART   = 1              CF       = 0              TLEV     = 1              
+TLEVC   = 1              JS       = 7E-07          JSW      = 1.4E-10        
+DLC     = 4.53e-8         DWC     = 2.51e-9        CLC      = 6.60E-08       
+CLE     = 4.25            ACDE    = 1.54           MOIN     = 23             
+NOFF    = 1.855           VOFFCV  = -0.09          CKAPPA   = 1.1056         
+CGBO    = 1E-13           CGDL    = cglp           CGSL     = cglp        
+TOXM    = 5.4E-9
+TCJSWG  = 0.0006079875    TPBSWG  = 0.001610754    ALPHA1  = 0.46878     )


.MODEL pch.4            PMOS   (                    LMIN     = '1.2E-06-dxl'  
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+LMAX    = 2.1E-05        WMIN     = '6E-07-dxw'    WMAX     = '1.2E-06-dxw'  
+LEVEL   = 49             TNOM     = 25             VERSION  = 3.2            
+NLEV    = 3              AF       = 1.2828         KF       = 1.184E-23      
+TOX     = toxp           XJ       = 1E-07          NCH      = 4.15E+17       
+LLN     = 1              LWN      = 1              WLN      = 1              
+WWN     = 1              LINT     = 5.2E-08        LL       = 0              
+LW      = 0              LWL      = 0              WINT     = 2.5E-08        
+WL      = 0              WW       = 0              WWL      = 0              
+MOBMOD  = 1              BINUNIT  = 2              XL       = '3E-08+dxl'    
+XW      = '0+dxw'        DWG      = 0              DWB      = 0              
+VTH0    = '-0.5958707+dvthp' LVTH0 = -6.76162E-09   WVTH0    = 4.62241E-09    
+PVTH0   = -1.383898E-15  K1       = 0.5946096      LK1      = 2.357844E-08   
+WK1     = -6.465641E-09  PK1      = -7.611478E-15  K2       = 0.007844382    
+LK2     = -4.83827E-09   WK2      = 2.055159E-09   PK2      = -7.047743E-16  
+K3      = 0              DVT0     = 0              DVT1     = 0              
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0              
+DVT2W   = 0              NLX      = 0              W0       = 0              
+K3B     = 0              VSAT     = 180000         UA       = 6.15269E-10    
+LUA     = 6.747105E-17   WUA      = 1.207563E-16   PUA      = -1.33835E-22   
+UB      = 5.000108E-19   LUB      = 1.92358E-25    WUB      = -2.425791E-25  
+PUB     = -6.665125E-33  UC       = -7.359404E-11  LUC      = 3.611787E-17   
+WUC     = -2.085203E-17  PUC      = -8.534845E-24  RDSW     = 1000           
+PRWB    = 0              PRWG     = 0              WR       = 1              
+U0      = 0.009091901    LU0      = -4.861006E-11  WU0      = 8.559956E-10   
+PU0     = -6.705154E-16  A0       = 0.7691334      LA0      = -1.362008E-07  
+WA0     = 3.648385E-08   PA0      = 1.00701E-14    KETA     = 0.01605329     
+LKETA   = -1.431987E-08  WKETA    = 2.677046E-09   PKETA    = -8.33219E-17   
+A1      = 0              A2       = 0.9            AGS      = 0.01           
+B0      = 0              B1       = 0              VOFF     = -0.1427946     
+LVOFF   = 7.564363E-08   WVOFF    = 6.862818E-09   PVOFF    = -6.796202E-14  
+NFACTOR = 1              CIT      = -0.0001155658  LCIT     = 3.101648E-10   
+WCIT    = 8.561211E-12   PCIT     = -1.705907E-16  CDSC     = 0              
+CDSCB   = 0              CDSCD    = 0              ETA0     = 5E-05          
+ETAB    = -5E-05         DSUB     = 0              PCLM     = 0.4605874      
+LPCLM   = 7.853366E-07   WPCLM    = -9.570443E-09  PPCLM    = 1.907004E-13   
+PDIBLC1 = 1E-05          PDIBLC2  = 0.005          PDIBLCB  = 0.06435359     
+LPDIBLCB= -1.083047E-06  WPDIBLCB = -6.250661E-08  PPDIBLCB = 1.245504E-12   
+DROUT   = 0              PSCBE1   = 5E+08          PSCBE2   = 1E-06          
+PVAG    = 0              DELTA    = 0.01           ALPHA0   = 0     
+BETA0   = 19.43759       KT1      = -0.2518553     LKT1     = -2.884151E-09  
+WKT1    = 1.296568E-08   PKT1     = -6.290419E-15  KT2      = -0.02916964    
+LKT2    = -5.164045E-09  WKT2     = 7.822857E-10   PKT2     = 3.131869E-15   
+AT      = 10000          UTE      = -1.025369      LUTE     = 6.613909E-08   
+WUTE    = -7.377092E-09  PUTE     = 2.287613E-14   UA1      = 9.999999E-11   
+UB1     = 0              UC1      = 1.199823E-10   LUC1     = -7.652936E-17  
+WUC1    = -2.735301E-17  PUC1     = 7.661738E-23   KT1L     = 0              
+PRT     = 0              ACM      = 12             HDIF     = hdifp          
+LDIF    = 1.2E-07        RSH      = 3.5            RS       = 0              
+RD      = 0              CJ       = cjp            MJ       = 0.4746122      
+PB      = 0.9522272      CJSW     = cjswp          MJSW     = 0.3296904      
+PBSW    = 0.9522272      CJSWG    = cjgatep        MJSWG    = 0.3296904      
+PBSWG   = 0.9522272      TCJ      = 0.0008154354   TCJSW    = 0.0006079875   
+TPB     = 0.00140666     TPBSW    = 0.001610754    CGDO     = cgop           
+CGSO    = cgop           CAPMOD   = 3              NQSMOD   = 0              
+XTI     = 3              N        = 1              XPART    = 1              
+CF      = 0              TLEV     = 1              TLEVC    = 1              
+JS      = 7E-07          JSW      = 1.4E-10        DLC      = 4.53e-8      
+DWC     = 2.51e-9        CLC      = 6.60E-08       CLE      = 4.25
+ACDE    = 1.54           MOIN     = 23             NOFF     = 1.855
+VOFFCV  = -0.09          CKAPPA   = 1.1056         CGBO     = 1E-13
+CGDL    = cglp           CGSL     = cglp            TOXM    = 5.4E-9
+TCJSWG  = 0.0006079875    TPBSWG  = 0.001610754     ALPHA1  = 0.46878       )


.MODEL pch.5            PMOS   (                    LMIN     = '5E-07-dxl'    
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+LMAX    = '1.2E-06-dxl'  WMIN     = '6E-07-dxw'    WMAX     = '1.2E-06-dxw'  
+LEVEL   = 49             TNOM     = 25             VERSION  = 3.2            
+NLEV    = 3              AF       = 1.2828         KF       = 1.184E-23      
+TOX     = toxp           XJ       = 1E-07          NCH      = 4.15E+17       
+LLN     = 1              LWN      = 1              WLN      = 1              
+WWN     = 1              LINT     = 5.2E-08        LL       = 0              
+LW      = 0              LWL      = 0              WINT     = 2.5E-08        
+WL      = 0              WW       = 0              WWL      = 0              
+MOBMOD  = 1              BINUNIT  = 2              XL       = '3E-08+dxl'    
+XW      = '0+dxw'        DWG      = 0              DWB      = 0              
+VTH0    = '-0.6114377+dvthp' LVTH0 = 1.076676E-08   WVTH0    = 1.806206E-09   
+PVTH0   = 1.787149E-15   K1       = 0.6340367      LK1      = -2.081659E-08  
+WK1     = -2.18461E-08   PK1      = 9.706926E-15   K2       = 0.005543762    
+LK2     = -2.247771E-09  WK2      = 9.996362E-10   PK2      = 4.83744E-16    
+K3      = 0              DVT0     = 0              DVT1     = 0              
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0              
+DVT2W   = 0              NLX      = 0              W0       = 0              
+K3B     = 0              VSAT     = 186085.7       LVSAT    = -0.006852513   
+UA      = 9.008309E-10   LUA      = -2.540717E-16  WUA      = -1.107176E-16  
+PUA     = 1.268046E-22   UB       = 4.670627E-19   LUB      = 2.294576E-25   
+WUB     = -2.98133E-25   PUB      = 5.588859E-32   UC       = -7.604286E-11  
+LUC     = 3.887525E-17   WUC      = -2.342289E-17  PUC      = -5.640051E-24  
+RDSW    = 1000           PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.009806256    LU0      = -8.529738E-10  
+WU0     = -1.429379E-10  PU0      = 4.542837E-16   A0       = 0.5789162      
+LA0     = 7.798396E-08   WA0      = 1.198474E-07   PA0      = -8.379726E-14  
+KETA    = 0.01189936     LKETA    = -9.642545E-09  WKETA    = 7.56686E-09    
+PKETA   = -5.589252E-15  A1       = 0              A2       = 0.9            
+AGS     = 0.01           B0       = 0              B1       = 0              
+VOFF    = -0.04149639    LVOFF    = -3.841811E-08  WVOFF    = -9.90238E-08   
+PVOFF   = 5.126632E-14   NFACTOR  = 1              CIT      = 0.0001864417   
+LCIT    = -2.98957E-11   WCIT     = -3.014012E-10  PCIT     = 1.784271E-16   
+CDSC    = 0              CDSCB    = 0              CDSCD    = 0              
+ETA0    = -0.0001363835  LETA0    = 2.098678E-10   WETA0    = 8.577521E-11   
+PETA0   = -9.658291E-17  ETAB     = 9.707135E-05   LETAB    = -1.656024E-10  
+WETAB   = -6.415355E-11  PETAB    = 7.223691E-17   DSUB     = 0              
+PCLM    = 1.01779        LPCLM    = 1.579263E-07   WPCLM    = 3.310475E-07   
+PPCLM   = -1.928355E-13  PDIBLC1  = 1E-05          PDIBLC2  = 0.005          
+PDIBLCB = -1.449778      LPDIBLCB = 6.218654E-07   WPDIBLCB = 1.678745E-06   
+PPDIBLCB= -7.151453E-13  DROUT    = 0              PSCBE1   = 5.548396E+08   
+LPSCBE1 = -61.74943      WPSCBE1  = -30.1618       PPSCBE1  = 3.396219E-05   
+PSCBE2  = 1E-06          PVAG     = 0              DELTA    = 0.01           
+ALPHA0  = 7.7818E-08     BETA0    = 19.43759       KT1      = -0.2714567     
+LKT1    = 1.918703E-08   WKT1     = 2.277602E-08   PKT1     = -1.733686E-14  
+KT2     = -0.04050659    LKT2     = 7.601368E-09   WKT2     = 7.820161E-09   
+PKT2    = -4.792779E-15  AT       = 10000          UTE      = -1.110541      
+LUTE    = 1.620419E-07   WUTE     = 7.878941E-08   PUTE     = -7.414735E-14  
+UA1     = 1E-10          UB1      = 0              UC1      = 1.181789E-10   
+LUC1    = -7.44987E-17   WUC1     = 1.963823E-17   PUC1     = 2.370524E-23   
+KT1L    = 0              PRT      = 0              ACM      = 12             
+HDIF    = hdifp          LDIF     = 1.2E-07        RSH      = 3.5            
+RS      = 0              RD       = 0              CJ       = cjp            
+MJ      = 0.4746122      PB       = 0.9522272      CJSW     = cjswp          
+MJSW    = 0.3296904      PBSW     = 0.9522272      CJSWG    = cjgatep        
+MJSWG   = 0.3296904      PBSWG    = 0.9522272      TCJ      = 0.0008154354   
+TCJSW   = 0.0006079875   TPB      = 0.00140666     TPBSW    = 0.001610754    
+CGDO    = cgop           CGSO     = cgop           CAPMOD   = 3              
+NQSMOD  = 0              XTI      = 3              N        = 1              
+XPART   = 1              CF       = 0              TLEV     = 1              
+TLEVC   = 1              JS       = 7E-07          JSW      = 1.4E-10       
+DLC     = 4.53e-8         DWC     = 2.51e-9        CLC      = 6.60E-08       
+CLE     = 4.25            ACDE    = 1.54           MOIN     = 23             
+NOFF    = 1.855           VOFFCV  = -0.09          CKAPPA   = 1.1056         
+CGBO    = 1E-13           CGDL    = cglp           CGSL     = cglp        
+TOXM    = 5.4E-9 
+TCJSWG  = 0.0006079875    TPBSWG  = 0.001610754     ALPHA1  = 0.46878    )


.MODEL pch.6            PMOS   (                    LMIN     = 2.4E-07        
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+LMAX    = '5E-07-dxl'    WMIN     = '6E-07-dxw'    WMAX     = '1.2E-06-dxw'  
+LEVEL   = 49             TNOM     = 25             VERSION  = 3.2            
+NLEV    = 3              AF       = 1.2828         KF       = 1.184E-23      
+TOX     = toxp           XJ       = 1E-07          NCH      = 4.15E+17       
+LLN     = 1              LWN      = 1              WLN      = 1              
+WWN     = 1              LINT     = 5.2E-08        LL       = 0              
+LW      = 0              LWL      = 0              WINT     = 2.5E-08        
+WL      = 0              WW       = 0              WWL      = 0              
+MOBMOD  = 1              BINUNIT  = 2              XL       = '3E-08+dxl'    
+XW      = '0+dxw'        DWG      = 0              DWB      = 0              
+VTH0    = '-0.5826022+dvthp' LVTH0 = -1.517161E-09  WVTH0    = -1.695445E-08  
+PVTH0   = 9.779188E-15   K1       = 0.5912579      LK1      = -2.592785E-09  
+WK1     = 1.725682E-08   PK1      = -6.950916E-15  K2       = 0.02634375     
+LK2     = -1.110857E-08  WK2      = -5.286355E-09  PK2      = 3.161577E-15   
+K3      = 0              DVT0     = 0              DVT1     = 0              
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0              
+DVT2W   = 0              NLX      = 0              W0       = 0              
+K3B     = 0              VSAT     = 173192.3       LVSAT    = -0.001359923   
+UA      = -1.286249E-10  LUA      = 1.844765E-16   WUA      = 3.981406E-16   
+PUA     = -8.996896E-23  UB       = 7.273092E-19   LUB      = 1.185926E-25   
+WUB     = -1.273195E-25  PUB      = -1.687796E-32  UC       = 6.303791E-12   
+LUC     = 3.795573E-18   WUC      = -3.440205E-17  PUC      = -9.629313E-25  
+RDSW    = 1000           PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.006821277    LU0      = 4.186273E-10   
+WU0     = 1.689587E-09   PU0      = -3.263717E-16  A0       = 0.7925925      
+LA0     = -1.304218E-08  WA0      = -2.298971E-07  PA0      = 6.519392E-14   
+KETA    = -0.01465939    LKETA    = 1.671481E-09   WKETA    = -1.088816E-08  
+PKETA   = 2.272585E-15   A1       = 0              A2       = 0.9044287      
+LA2     = -1.886638E-09  WA2      = -2.4358E-09    PA2      = 1.037651E-15   
+AGS     = 0.02276923     LAGS     = -5.439693E-09  B0       = 0              
+B1      = 0              VOFF     = -0.1528024     LVOFF    = 8.998269E-09   
+WVOFF   = 3.644589E-08   PVOFF    = -6.443767E-15  NFACTOR  = 1              
+CIT     = -0.0001245626  LCIT     = 1.025921E-10   WCIT     = 1.697424E-11   
+PCIT    = 4.279915E-17   CDSC     = 0              CDSCB    = 0              
+CDSCD   = 0              ETA0     = -0.001725724   LETA0    = 8.869268E-10   
+WETA0   = -5.79907E-10   PETA0    = 1.869977E-16   ETAB     = 0.001075898    
+LETAB   = -5.825824E-10  WETAB    = 2.651543E-10   PETAB    = -6.804834E-17  
+DSUB    = 0              PCLM     = 1.353218       LPCLM    = 1.503402E-08   
+WPCLM   = -1.217646E-07  PPCLM    = 6.247787E-17   PDIBLC1  = 1E-05          
+PDIBLC2 = 0.005          PDIBLCB  = 0.01           DROUT    = 0              
+PSCBE1  = 3.913276E+08   LPSCBE1  = 7.906669       WPSCBE1  = 77.73039       
+PPSCBE1 = -1.199989E-05  PSCBE2   = 1E-06          PVAG     = 0              
+DELTA   = 0.01           ALPHA0   = 0              BETA0    = 19.43759       
+KT1     = -0.1905564     LKT1     = -1.527646E-08  WKT1     = -4.080435E-08  
+PKT1    = 9.748379E-15   KT2      = -0.01907398    LKT2     = -1.528927E-09  
+WKT2    = -7.760885E-09  PKT2     = 1.844746E-15   AT       = 10000          
+UTE     = -0.6544458     LUTE     = -3.22545E-08   WUTE     = -1.90414E-07   
+PUTE    = 4.05333E-14    UA1      = 9.999999E-11   UB1      = 0              
+UC1     = -1.211204E-10  LUC1     = 2.744279E-17   WUC1     = 1.228348E-16   
+PUC1    = -2.02565E-23   KT1L     = 0              PRT      = 0              
+ACM     = 12             HDIF     = hdifp          LDIF     = 1.2E-07        
+RSH     = 3.5            RS       = 0              RD       = 0              
+CJ      = cjp            MJ       = 0.4746122      PB       = 0.9522272      
+CJSW    = cjswp          MJSW     = 0.3296904      PBSW     = 0.9522272      
+CJSWG   = cjgatep        MJSWG    = 0.3296904      PBSWG    = 0.9522272      
+TCJ     = 0.0008154354   TCJSW    = 0.0006079875   TPB      = 0.00140666     
+TPBSW   = 0.001610754    CGDO     = cgop           CGSO     = cgop           
+CAPMOD  = 3              NQSMOD   = 0              XTI      = 3              
+N       = 1              XPART    = 1              CF       = 0              
+TLEV    = 1              TLEVC    = 1              JS       = 7E-07          
+JSW     = 1.4E-10        DLC      = 4.53e-8         DWC     = 2.51e-9        
+CLC     = 6.60E-08       CLE      = 4.25            ACDE    = 1.54           
+MOIN    = 23             NOFF     = 1.855           VOFFCV  = -0.09          
+CKAPPA  = 1.1056         CGBO     = 1E-13           CGDL    = cglp           
+CGSL    = cglp            TOXM    = 5.4E-9
+TCJSWG  = 0.0006079875    TPBSWG  = 0.001610754     ALPHA1  = 0.46878    )           


.MODEL pch.7            PMOS   (                    LMIN     = '1.2E-06-dxl'  
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+LMAX    = 2.1E-05        WMIN     = 3E-07          WMAX     = '6E-07-dxw'    
+LEVEL   = 49             TNOM     = 25             VERSION  = 3.2            
+NLEV    = 3              AF       = 1.2828         KF       = 1.184E-23      
+TOX     = toxp           XJ       = 1E-07          NCH      = 4.15E+17       
+LLN     = 1              LWN      = 1              WLN      = 1              
+WWN     = 1              LINT     = 5.2E-08        LL       = 0              
+LW      = 0              LWL      = 0              WINT     = 2.5E-08        
+WL      = 0              WW       = 0              WWL      = 0              
+MOBMOD  = 1              BINUNIT  = 2              XL       = '3E-08+dxl'    
+XW      = '0+dxw'        DWG      = 0              DWB      = 0              
+VTH0    = '-0.5940737+dvthp' LVTH0 = -8.252453E-09  WVTH0    = 3.634E-09      
+PVTH0   = -5.639401E-16  K1       = 0.5771518      LK1      = 3.624153E-08   
+WK1     = 3.136116E-09   PK1      = -1.457618E-14  K2       = 0.01319295     
+LK2     = -1.206762E-08  WK2      = -8.865521E-10  PK2      = 3.271368E-15   
+K3      = 0              DVT0     = 0              DVT1     = 0              
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0              
+DVT2W   = 0              NLX      = 0              W0       = 0              
+K3B     = 0              VSAT     = 180000         UA       = 1.200829E-09   
+LUA     = -4.687788E-16  WUA      = -2.013016E-16  PUA      = 1.611024E-22   
+UB      = 3.042403E-20   LUB      = 3.70974E-25    WUB      = 1.569366E-26   
+PUB     = -1.049039E-31  UC       = -1.038957E-10  LUC      = 3.689938E-17   
+WUC     = -4.186143E-18  PUC      = -8.964676E-24  RDSW     = 1000           
+PRWB    = 0              PRWG     = 0              WR       = 1              
+U0      = 0.01077765     LU0      = -1.825951E-09  WU0      = -7.116887E-11  
+PU0     = 3.070219E-16   A0       = 0.7443596      LA0      = -1.732508E-07  
+WA0     = 5.010951E-08   PA0      = 3.044762E-14   KETA     = 0.01880023     
+LKETA   = -9.475532E-09  WKETA    = 1.166228E-09   PKETA    = -2.747705E-15  
+A1      = 0              A2       = 0.9            AGS      = 0.01           
+B0      = 0              B1       = 0              VOFF     = -0.1365031     
+LVOFF   = -9.295147E-08  WVOFF    = 3.402525E-09   PVOFF    = 2.476529E-14   
+NFACTOR = 1              CIT      = -9.499228E-05  LCIT     = -9.978354E-11  
+WCIT    = -2.754239E-12  PCIT     = 5.488095E-17   CDSC     = 0              
+CDSCB   = 0              CDSCD    = 0              ETA0     = 5E-05          
+ETAB    = -5E-05         DSUB     = 0              PCLM     = 0.4207978      
+LPCLM   = 1.578185E-06   WPCLM    = 1.231384E-08   PPCLM    = -2.453662E-13  
+PDIBLC1 = 1E-05          PDIBLC2  = 0.005          PDIBLCB  = -0.09870695    
+LPDIBLCB= 2.166094E-06   WPDIBLCB = 2.717674E-08   PPDIBLCB = -5.415235E-13  
+DROUT   = 0              PSCBE1   = 5E+08          PSCBE2   = 1E-06          
+PVAG    = 0              DELTA    = 0.01           ALPHA0   = 0     
+BETA0   = 19.43759       KT1      = -0.2536715     LKT1     = 1.614478E-08   
+WKT1    = 1.396462E-08   PKT1     = -1.675633E-14  KT2      = -0.05023759    
+LKT2    = 2.78035E-08    WKT2     = 1.236966E-08   PKT2     = -1.500028E-14  
+AT      = 10000          UTE      = -1.091206      LUTE     = 1.995834E-07   
+WUTE    = 2.883275E-08   PUTE     = -5.051824E-14  UA1      = 9.999999E-11   
+UB1     = 0              UC1      = 1.131177E-10   LUC1     = 7.868749E-17   
+WUC1    = -2.357745E-17  PUC1     = -8.751895E-24  KT1L     = 0              
+PRT     = 0              ACM      = 12             HDIF     = hdifp          
+LDIF    = 1.2E-07        RSH      = 3.5            RS       = 0              
+RD      = 0              CJ       = cjp            MJ       = 0.4746122      
+PB      = 0.9522272      CJSW     = cjswp          MJSW     = 0.3296904      
+PBSW    = 0.9522272      CJSWG    = cjgatep        MJSWG    = 0.3296904      
+PBSWG   = 0.9522272      TCJ      = 0.0008154354   TCJSW    = 0.0006079875   
+TPB     = 0.00140666     TPBSW    = 0.001610754    CGDO     = cgop           
+CGSO    = cgop           CAPMOD   = 3              NQSMOD   = 0              
+XTI     = 3              N        = 1              XPART    = 1              
+CF      = 0              TLEV     = 1              TLEVC    = 1              
+JS      = 7E-07          JSW      = 1.4E-10        DLC      = 4.53e-8      
+DWC     = 2.51e-9        CLC      = 6.60E-08       CLE      = 4.25
+ACDE    = 1.54           MOIN     = 23             NOFF     = 1.855
+VOFFCV  = -0.09          CKAPPA   = 1.1056         CGBO     = 1E-13
+CGDL    = cglp           CGSL     = cglp            TOXM    = 5.4E-9
+TCJSWG  = 0.0006079875    TPBSWG  = 0.001610754     ALPHA1  = 0.46878    )           


.MODEL pch.8            PMOS   (                    LMIN     = '5E-07-dxl'    
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+LMAX    = '1.2E-06-dxl'  WMIN     = 3E-07          WMAX     = '6E-07-dxw'    
+LEVEL   = 49             TNOM     = 25             VERSION  = 3.2            
+NLEV    = 3              AF       = 1.2828         KF       = 1.184E-23      
+TOX     = toxp           XJ       = 1E-07          NCH      = 4.15E+17       
+LLN     = 1              LWN      = 1              WLN      = 1              
+WWN     = 1              LINT     = 5.2E-08        LL       = 0              
+LW      = 0              LWL      = 0              WINT     = 2.5E-08        
+WL      = 0              WW       = 0              WWL      = 0              
+MOBMOD  = 1              BINUNIT  = 2              XL       = '3E-08+dxl'    
+XW      = '0+dxw'        DWG      = 0              DWB      = 0              
+VTH0    = '-0.6270721+dvthp' LVTH0 = 2.890378E-08   WVTH0    = 1.040511E-08   
+PVTH0   = -8.188214E-15  K1       = 0.6285072      LK1      = -2.158467E-08  
+WK1     = -1.880486E-08  PK1      = 1.012937E-14   K2       = 0.0005149786   
+LK2     = 2.207774E-09   WK2      = 3.765467E-09   PK2      = -1.966806E-15  
+K3      = 0              DVT0     = 0              DVT1     = 0              
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0              
+DVT2W   = 0              NLX      = 0              W0       = 0              
+K3B     = 0              VSAT     = 186085.7       LVSAT    = -0.006852513   
+UA      = 7.556776E-10   LUA      = 3.24615E-17    WUA      = -3.08833E-17   
+PUA     = -3.078863E-23  UB       = -1.918074E-20  LUB      = 4.26829E-25    
+WUB     = -3.06991E-26   PUB      = -5.266568E-32  UC       = -1.178974E-10  
+LUC     = 5.266533E-17   WUC      = -4.029124E-19  PUC      = -1.32246E-23   
+RDSW    = 1000           PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.008981938    LU0      = 1.960248E-10   
+WU0     = 3.104363E-10   PU0      = -1.226655E-16  A0       = 0.710349       
+LA0     = -1.349549E-07  WA0      = 4.755934E-08   PA0      = 3.331912E-14   
+KETA    = 0.03237266     LKETA    = -2.475809E-08  WKETA    = -3.693456E-09  
+PKETA   = 2.724301E-15   A1       = 0              A2       = 0.9            
+AGS     = -0.0001428509  LAGS     = 1.142085E-08   WAGS     = 5.578569E-09   
+PAGS    = -6.28147E-15   B0       = 0              B1       = 0              
+VOFF    = -0.2959811     LVOFF    = 8.662073E-08   WVOFF    = 4.094279E-08   
+PVOFF   = -1.750504E-14  NFACTOR  = 1              CIT      = -0.0004801657  
+LCIT    = 3.339218E-10   WCIT     = 6.52329E-11    PCIT     = -2.167258E-17  
+CDSC    = 0              CDSCB    = 0              CDSCD    = 0              
+ETA0    = 1.957144E-05   LETA0    = 3.426257E-11   ETAB     = -1.957144E-05  
+LETAB   = -3.426257E-11  DSUB     = 0              PCLM     = 2.39371        
+LPCLM   = -6.433149E-07  WPCLM    = -4.257086E-07  PPCLM    = 2.478472E-13   
+PDIBLC1 = 1E-05          PDIBLC2  = 0.005          PDIBLCB  = 2.929556       
+LPDIBLCB= -1.243731E-06  WPDIBLCB = -7.298891E-07  PPDIBLCB = 3.109328E-13   
+DROUT   = 0              PSCBE1   = 4.660722E+08   LPSCBE1  = 38.20276       
+WPSCBE1 = 18.66032       PPSCBE1  = -2.101152E-05  PSCBE2   = 1E-06          
+PVAG    = 0              DELTA    = 0.01           ALPHA0   = 0     
+BETA0   = 19.43759       KT1      = -0.2200222     LKT1     = -2.174434E-08  
+WKT1    = -5.512935E-09  PKT1     = 5.175397E-15   KT2      = -0.01992055    
+LKT2    = -6.333487E-09  WKT2     = -3.502163E-09  PKT2     = 2.871391E-15   
+AT      = 10000          UTE      = -0.940698      LUTE     = 3.011186E-08   
+WUTE    = -1.462413E-08  PUTE     = -1.585792E-15  UA1      = 9.999999E-11   
+UB1     = 0              UC1      = 2.544602E-10   LUC1     = -8.046421E-17  
+WUC1    = -5.531648E-17  PUC1     = 2.698626E-23   KT1L     = 0              
+PRT     = 0              ACM      = 12             HDIF     = hdifp          
+LDIF    = 1.2E-07        RSH      = 3.5            RS       = 0              
+RD      = 0              CJ       = cjp            MJ       = 0.4746122      
+PB      = 0.9522272      CJSW     = cjswp          MJSW     = 0.3296904      
+PBSW    = 0.9522272      CJSWG    = cjgatep        MJSWG    = 0.3296904      
+PBSWG   = 0.9522272      TCJ      = 0.0008154354   TCJSW    = 0.0006079875   
+TPB     = 0.00140666     TPBSW    = 0.001610754    CGDO     = cgop           
+CGSO    = cgop           CAPMOD   = 3              NQSMOD   = 0              
+XTI     = 3              N        = 1              XPART    = 1              
+CF      = 0              TLEV     = 1              TLEVC    = 1              
+JS      = 7E-07          JSW      = 1.4E-10        DLC      = 4.53e-8      
+DWC     = 2.51e-9        CLC      = 6.60E-08       CLE      = 4.25
+ACDE    = 1.54           MOIN     = 23             NOFF     = 1.855
+VOFFCV  = -0.09          CKAPPA   = 1.1056         CGBO     = 1E-13
+CGDL    = cglp           CGSL     = cglp            TOXM    = 5.4E-9
+TCJSWG  = 0.0006079875    TPBSWG  = 0.001610754     ALPHA1  = 0.46878    )


.MODEL pch.9            PMOS   (                    LMIN     = 2.4E-07        
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+LMAX    = '5E-07-dxl'    WMIN     = 3E-07          WMAX     = '6E-07-dxw'    
+LEVEL   = 49             TNOM     = 25             VERSION  = 3.2            
+NLEV    = 3              AF       = 1.2828         KF       = 1.184E-23      
+TOX     = toxp           XJ       = 1E-07          NCH      = 4.15E+17       
+LLN     = 1              LWN      = 1              WLN      = 1              
+WWN     = 1              LINT     = 5.2E-08        LL       = 0              
+LW      = 0              LWL      = 0              WINT     = 2.5E-08        
+WL      = 0              WW       = 0              WWL      = 0              
+MOBMOD  = 1              BINUNIT  = 2              XL       = '3E-08+dxl'    
+XW      = '0+dxw'        DWG      = 0              DWB      = 0              
+VTH0    = '-0.5562016+dvthp' LVTH0 = -1.287045E-09  WVTH0    = -3.147479E-08  
+PVTH0   = 9.652624E-15   K1       = 0.6033181      LK1      = -1.08541E-08   
+WK1     = 1.062369E-08   PK1      = -2.407192E-15  K2       = 0.01532588     
+LK2     = -4.101668E-09  WK2      = 7.734788E-10   PK2      = -6.922188E-16  
+K3      = 0              DVT0     = 0              DVT1     = 0              
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0              
+DVT2W   = 0              NLX      = 0              W0       = 0              
+K3B     = 0              VSAT     = 173192.3       LVSAT    = -0.001359923   
+UA      = 1.075863E-09   LUA      = -1.039374E-16  WUA      = -2.643277E-16  
+PUA     = 6.865867E-23   UB       = 4.020718E-19   LUB      = 2.473754E-25   
+WUB     = 5.156102E-26   PUB      = -8.770849E-32  UC       = -1.341845E-11  
+LUC     = 8.157311E-18   WUC      = -2.355482E-17  PUC      = -3.361887E-24  
+RDSW    = 1000           PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.01086406     LU0      = -6.057607E-10  
+WU0     = -5.339471E-10  PU0      = 2.370417E-16   A0       = 0.2543587      
+LA0     = 5.929694E-08   WA0      = 6.613143E-08   PA0      = 2.540741E-14   
+KETA    = -0.03769821    LKETA    = 5.092094E-09   WKETA    = 1.783194E-09   
+PKETA   = 3.91248E-16    A1       = 0              A2       = 0.9            
+AGS     = 0.05007694     LAGS     = -9.972773E-09  WAGS     = -1.501923E-08  
+PAGS    = 2.493193E-15   B0       = 0              B1       = 0              
+VOFF    = -0.07672792    LVOFF    = -6.781112E-09  WVOFF    = -5.395092E-09  
+PVOFF   = 2.234891E-15   NFACTOR  = 1              CIT      = -0.0001323772  
+LCIT    = 1.857639E-10   WCIT     = 2.127227E-11   PCIT     = -2.945352E-18  
+CDSC    = 0              CDSCB    = 0              CDSCD    = 0              
+ETA0    = -0.003249269   LETA0    = 1.426788E-09   WETA0    = 2.580423E-10   
+PETA0   = -1.099259E-16  ETAB     = 0.001712135    LETAB    = -7.719693E-10  
+WETAB   = -8.477567E-11  PETAB    = 3.611443E-17   DSUB     = 0              
+PCLM    = 0.8145576      LPCLM    = 2.940401E-08   WPCLM    = 1.744986E-07   
+PPCLM   = -7.841008E-15  PDIBLC1  = 1E-05          PDIBLC2  = 0.005          
+PDIBLCB = 0.1181169      LPDIBLCB = -4.605777E-08  WPDIBLCB = -5.946426E-08  
+PPDIBLCB= 2.533177E-14   DROUT    = 0              PSCBE1   = 6.54364E+08    
+LPSCBE1 = -42.00954      WPSCBE1  = -66.93957      PPSCBE1  = 1.545402E-05   
+PSCBE2  = 1E-06          PVAG     = 0              DELTA    = 0.01           
+ALPHA0  = 0              BETA0    = 19.43759       KT1      = -0.2845146     
+LKT1    = 5.729426E-09   WKT1     = 1.087265E-08   PKT1     = -1.804859E-15  
+KT2     = -0.05180164    LKT2     = 7.247853E-09   WKT2     = 1.023933E-08   
+PKT2    = -2.982482E-15  AT       = 10000          UTE      = -0.9719581     
+LUTE    = 4.342868E-08   WUTE     = -1.578222E-08  PUTE     = -1.092448E-15  
+UA1     = 9.436022E-11   LUA1     = 2.402534E-18   WUA1     = 3.101871E-18   
+PUA1    = -1.321394E-24  UB1      = 0              UC1      = 1.215723E-10   
+LUC1    = -2.385395E-17  WUC1     = -1.064616E-17  PUC1     = 7.956708E-24   
+KT1L    = 0              PRT      = 0              ACM      = 12             
+HDIF    = hdifp          LDIF     = 1.2E-07        RSH      = 3.5            
+RS      = 0              RD       = 0              CJ       = cjp            
+MJ      = 0.4746122      PB       = 0.9522272      CJSW     = cjswp          
+MJSW    = 0.3296904      PBSW     = 0.9522272      CJSWG    = cjgatep        
+MJSWG   = 0.3296904      PBSWG    = 0.9522272      TCJ      = 0.0008154354   
+TCJSW   = 0.0006079875   TPB      = 0.00140666     TPBSW    = 0.001610754    
+CGDO    = cgop           CGSO     = cgop           CAPMOD   = 3              
+NQSMOD  = 0              XTI      = 3              N        = 1              
+XPART   = 1              CF       = 0              TLEV     = 1              
+TLEVC   = 1              JS       = 7E-07          JSW      = 1.4E-10       
+DLC     = 4.53e-8         DWC     = 2.51e-9        CLC      = 6.60E-08       
+CLE      = 4.25           ACDE    = 1.54           MOIN     = 23             
+NOFF     = 1.855          VOFFCV  = -0.09          CKAPPA   = 1.1056         
+CGBO     = 1E-13          CGDL    = cglp           CGSL     = cglp        
+TOXM    = 5.4E-9 
+TCJSWG  = 0.0006079875    TPBSWG  = 0.001610754     ALPHA1  = 0.46878    )
*
.ENDL MOS
*
*
.LIB BIP
*
***************************************************************
*            MODEL OF P+/NW/PSUB VERTICAL BIPOLAR             *
*                 EMITTER AREA :  10 X 10 UM^2                *
***************************************************************
*
.MODEL pnp10 PNP (                                  LEVEL  = 1                  
+ BF     = '1.79*bfa'            NF     = '0.95513*nfa' ISE    = '3.7315E-18*isa'         
+ NE     = 1.069           IS     = '3.7315E-18*isa'    RB     = '140.9375822*rba'        
+ IRB    = 1.806256E-4     RBM    = '0.1*rbma'          RE     = '3.717704*rea'           
+ IKF    = 2.568E-3        NKF    = 0.5                 VAF    = 210.8833929        
+ BR     = 0.0101          NR     = 0.94                ISC    = '3.7315E-18*isa'        
+ NC     = 1.1616142       RC     = '21.08*rca'         IKR    = 1E-4               
+ VAR    = 17              XTI    = 3                   EG     = 1.18               
+ XTB    = 0               TRB1   = 6.25612E-4          TIRB1  = 1.052303E-7        
+ TRM1   = 9.44068E-6      TRE1   = -1.82691E-4         TIKF1  = -3.845646E-3       
+ TIKR1  = -3.925072E-3    TRC1   = 0                   TBR1   = 1.2E-4             
+ TVAF1  = -6.950157E-5    TBF1   = 4E-3                TNC1   = 3.017315E-4        
+ TNR1   = -1.50125E-4     TNF1   = -2.205635E-4        TNE1   = 1E-3               
+ CJE    = '1.181769E-13*cjea'    VJE    = 0.8661689    MJE    = 0.3873499          
+ FC     = 0               CJC    = '6.170502E-14*cjca' VJC    = 0.6454517          
+ MJC    = 0.3487117       TLEVC  = 1                   CTE    = 9.950871E-4        
+ CTC    = 2.347422E-3     TVJE   = 1.685132E-3         TVJC   = 2.929049E-3        
+ TREF   = 25              SUBS   = 1               )                           
***************************************************************
*            MODEL OF P+/NW/PSUB VERTICAL BIPOLAR             *
*                 EMITTER AREA :  5 X 5 UM^2                  *
***************************************************************
*                                                                               
.MODEL pnp5 PNP (                                   LEVEL  = 1                  
+ BF     = '1.75*bfa'           NF     = '0.95513*nfa'    ISE    = '1E-18*isa'              
+ NE     = 1.069           IS     = '1E-18*isa'           RB     = '210.9375822*rba'        
+ IRB    = 1.806256E-4     RBM    = '0.1*rbma'            RE     = '3.717704*rea'           
+ IKF    = 1.268E-3        NKF    = 0.5                   VAF    = 210.8833929        
+ BR     = 4.3E-3          NR     = 0.935                 ISC    = '1E-18*isa'              
+ NC     = 1               RC     = '21.08*rca'           IKR    = 1E-4               
+ VAR    = 17              XTI    = 3                     EG     = 1.18               
+ XTB    = 0               TRB1   = 6.25612E-4            TIRB1  = 1.052303E-7        
+ TRM1   = 9.44068E-6      TRE1   = -1.82691E-4           TIKF1  = -3.845646E-3       
+ TIKR1  = -3.925072E-3    TRC1   = 0                     TBR1   = 1.2E-4             
+ TVAF1  = -6.950157E-5    TBF1   = 4E-3                  TNC1   = 3.017315E-4        
+ TNR1   = -1.50125E-4     TNF1   = -2.205635E-4          TNE1   = 1E-3               
+ CJE    = '1.181769E-13*cjea'    VJE    = 0.8661689      MJE    = 0.3873499          
+ FC     = 0               CJC    = '6.170502E-14*cjca'   VJC    = 0.6454517          
+ MJC    = 0.3487117       TLEVC  = 1                     CTE    = 9.950871E-4        
+ CTC    = 2.347422E-3     TVJE   = 1.685132E-3           TVJC   = 2.929049E-3        
+ TREF   = 25              SUBS   = 1               )                           
***************************************************************
*            MODEL OF P+/NW/PSUB VERTICAL BIPOLAR             *
*                 EMITTER AREA :  2 X 2 UM^2                  *
***************************************************************
*                                                                               
.MODEL pnp2 PNP (                                   LEVEL  = 1                  
+ BF     = '1.64*bfa'            NF     = '0.95513*nfa'     ISE    = '2.3E-19*isa'            
+ NE     = 1.069           IS     = '2.3E-19*isa'           RB     = '420.9375822*rba'        
+ IRB    = 1.806256E-4     RBM    = '0.1*rbma'              RE     = '3.717704*rea'           
+ IKF    = 5E-4            NKF    = 0.5                     VAF    = 210.8833929        
+ BR     = 1.36E-3         NR     = 0.923                   ISC    = '2.3E-19*isa'            
+ NC     = 1               RC     = '21.08*rca'             IKR    = 1E-4               
+ VAR    = 15              XTI    = 3                       EG     = 1.18               
+ XTB    = 0               TRB1   = 2.25612E-4              TIRB1  = 1.052303E-7        
+ TRM1   = 9.44068E-6      TRE1   = -1.82691E-4             TIKF1  = 4E-4               
+ TIKR1  = -3.925072E-3    TRC1   = 0                       TBR1   = 1.2E-4             
+ TVAF1  = -6.950157E-5    TBF1   = 4.4E-3                  TNC1   = 3.017315E-4        
+ TNR1   = -1.50125E-4     TNF1   = -1.205635E-4            TNE1   = 1E-3               
+ CJE    = '1.181769E-13*cjea'    VJE    = 0.8661689        MJE    = 0.3873499          
+ FC     = 0               CJC    = '6.170502E-14*cjca'     VJC    = 0.6454517          
+ MJC    = 0.3487117       TLEVC  = 1                       CTE    = 9.950871E-4        
+ CTC    = 2.347422E-3     TVJE   = 1.685132E-3             TVJC   = 2.929049E-3        
+ TREF   = 25              SUBS   = 1               )   
.ENDL BIP
*                                        
*
*
*
**************************************************************************
*
*   resistor models
*
**************************************************************************
*
.LIB RES
******************************************************
.subckt rppo1rpo n1 n2 l=length w=width
.param rc=6.1 nc=2
.param rsh=160 dl=0.5u dw=0.02u pt='temper' ptcp1=7.64e-4 ptcp2=0 pvcp1=5.52e-4 pvcp2=0
.param rint=137.7u ptcx1=-8.57e-4 ptcx2=0 pvcx1=0.916 pvcx2=0
.param tfacx='1.0+ptcx1*(pt-25.0)+ptcx2*(pt-25)*(pt-25)'
.param tfacp='1.0+ptcp1*(pt-25.0)+ptcp2*(pt-25)*(pt-25)'
rcon1 n1 1 'rc/nc'
rend1 1 3  'rint/(w-dw)*tfacx*(1.0+pvcx1*abs(v(1,3))+pvcx2*v(1,3)*v(1,3))'
rp 3 4  'rsh*(l-dl)/(w-dw)*tfacp*(1.0+pvcp1*abs(v(3,4))+pvcp2*v(3,4)*v(3,4))'
rend2 4 2  'rint/(w-dw)*tfacx*(1.0+pvcx1*abs(v(4,2))+pvcx2*v(4,2)*v(4,2))'
rcon2 2 n2 'rc/nc'
.ends rppo1rpo

.subckt rppo1w n1 n2 l=length w=width
.param rsh=5.0 dw=-0.03u ptc1=3.04E-03 ptc2=-2.61E-07 pvc1=5.66E-03 pvc2=1.08E-02 pt='temper'
.param tfac='1.0+ptc1*(pt-25.0)+ptc2*(pt-25.0)*(pt-25.0)'
r1 n1 n2 'rsh*l/(w-dw)*(1+pvc1*abs(v(n2,n1))+pvc2*v(n2,n1)*v(n2,n1))*tfac'
.ends rppo1w

***************************************************
.subckt rnpo1rpo n1 n2 l=length w=width
.param rc=7 nc=2
.param rsh=180 dl=0.2u dw=0.04u pt='temper' ptcp1=-6.2e-4 ptcp2=0 pvcp1=7.02e-3 pvcp2=-2e-3
.param rint=37.1u ptcx1=-4.2e-4 ptcx2=0 pvcx1=-5.24 pvcx2=0
.param tfacx='1.0+ptcx1*(pt-25.0)+ptcx2*(pt-25)*(pt-25)'
.param tfacp='1.0+ptcp1*(pt-25.0)+ptcp2*(pt-25)*(pt-25)'
rcon1 n1 1 'rc/nc'
rend1 1 3  'rint/(w-dw)*tfacx*(1.0+pvcx1*abs(v(1,3))+pvcx2*v(1,3)*v(1,3))'
rp 3 4  'rsh*(l-dl)/(w-dw)*tfacp*(1.0+pvcp1*abs(v(3,4))+pvcp2*v(3,4)*v(3,4))'
rend2 4 2  'rint/(w-dw)*tfacx*(1.0+pvcx1*abs(v(4,2))+pvcx2*v(4,2)*v(4,2))'
rcon2 2 n2 'rc/nc'
.ends rnpo1rpo

***************************************************

.subckt rnpo1w n1 n2 l=length w=width
.param rsh=5.0 dw=-0.03u ptc1=3.15E-03 ptc2=8.52E-07 pvc1=5.37E-03 pvc2=1.06E-02 pt='temper'
.param tfac='1.0+ptc1*(pt-25.0)+ptc2*(pt-25.0)*(pt-25.0)'
r1 n1 n2 'rsh*l/(w-dw)*(1+pvc1*abs(v(n2,n1))+pvc2*v(n2,n1)*v(n2,n1))*tfac'
.ends rnpo1w

.subckt rnwsti n1 n2 l=length w=width
.param rsh=1100 dw=0.24u ptc1=3.60E-03 ptc2=1.12E-05 pvc1=9.00E-03 pvc2=-7.16E-04 pt='temper'
.param tfac='1.0+ptc1*(pt-25.0)+ptc2*(pt-25.0)*(pt-25.0)'
r1 n1 n2 'rsh*l/(w-dw)*(1+pvc1*abs(v(n2,n1))+pvc2*v(n2,n1)*v(n2,n1))*tfac'
.ends rnwsti

.ENDL RES

