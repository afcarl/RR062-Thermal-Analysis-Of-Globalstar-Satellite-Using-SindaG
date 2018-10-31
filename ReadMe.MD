
# ========================================
# Thermal Analysis of Globalstar Satellite using SindaG:
# ========================================

## Thermal Analysis of Globalstar Satellite using SindaG.

##
## I. Operation: "./run_sinda180a.bat"


##
## II. SindaG Input File: "./globalstar_model_nonophp.sin"

    ==================================
    START: Input File: "globalstar_model_nonophp.sin"
    ==================================
           BCD 3THERMAL LPCS
           BCD 9 GLOBALSTAR
           BCD 9 SIMPLIFIED S/C MODEL 
           BCD 9 50 NODES
           BCD 9 STOWED SOLAR ARRAY
    C MODEL ASSUMPTION: HEAT PIPES IN EQUIPMENT PANEL AND S-BAND ANTENNA 
    C RADIATOR ARE OPERATING.  FOR LAUNCH PHASE, CONDUCTION BLOCK SHOULD BE 
    C MODIFIED PER NOTES IN CONDUCTION BLOCK TO REFLECT NON-OP HEAT PIPES. 
    C
           END
           BCD 3NODE DATA
    C         NODE, T(C), CAP(W HR/K)
                100, 21.0, 0.20          $ ANTI-EARTH PANEL +X
                101, 21.0, 0.30          $ ANTI-EARTH PANEL MID
                102, 21.0, 0.20          $ ANTI-EARTH PANEL -X
                103, 21.0, 2.69          $ EARTH PANEL +X+Y
                104, 21.0, 3.99          $ EARTH PANEL +X-Y
                105, 21.0, 2.94          $ EARTH PANEL MID+Y
                106, 21.0, 4.08          $ EARTH PANEL MID-Y
                107, 21.0, 2.30          $ EARTH PANEL -X+Y
                108, 21.0, 1.96          $ EARTH PANEL -X-Y
                109, 21.0, 0.69          $ SOUTH PANEL +X
                110, 21.0, 0.96          $ SOUTH PANEL MID
                111, 21.0, 0.26          $ SOUTH PANEL -X
                112, 21.0, 0.26          $ NORTH PANEL +X
                113, 21.0, 0.96          $ NORTH PANEL MID
                114, 21.0, 3.26          $ NORTH PANEL -X
                115, 21.0, 0.61          $ -X PANEL
                116, 21.0, 1.45          $ -X WEB
                117, 21.0, 1.54          $ +X WEB

    ... content removed ...

    C BATTERY PANEL HTR
               TRMSTD(T1101,  -5.00,  0.000,    K 9,  0,   100.,   Q1101)
    C COMPONENT DISSIPATIONS 
    M       Q1430= 41.1          $ OSPE 
    M       Q1102= 9.00          $ PCU 
    M       Q106 = Q106+ 6.7     $ TT&C TX 
    M       Q107 = Q107+ 12.4    $ TT&C RX
           END  
           BCD 3VARIABLES 2  
           END  
           BCD 3OUTPUT CALLS  
               TPRINT  
    C           PPRINT  
    C           QNPRNT  
    C           MINMAX  
           END  
           BCD 3END OF DATA
    ==================================
    END: Input File: "globalstar_model_nonophp.sin"
    ==================================

##
## III. PreProcessor Output FORTRAN: "./globalstar_model_nonophp.for"
##
## IV. PreProcessor Output Listing: "./globalstar_model_nonophp.lis"
##
## V. SindaG Output File: "./globalstar_model_nonophp.out"

## 
## *Note: 
## 1. Thermal Analysis performed using SINDA-G, ( http://www.mscsoftware.com/product/sinda )
