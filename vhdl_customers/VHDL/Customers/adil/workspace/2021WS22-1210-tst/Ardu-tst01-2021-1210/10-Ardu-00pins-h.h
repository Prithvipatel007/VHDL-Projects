/*
\documentclass[twoside,12pt,a4paper]{article}
\usepackage{a4}
\addtolength{\voffset}{-10mm}
\addtolength{\hoffset}{-20mm}
\addtolength{\textheight}{50mm}
\pagestyle{myheadings}\markboth{\sc \bf 10-Ardu-00pins-h.h}
                               {\sc \bf 10-Ardu-00pins-h.h}
%----------------------------------------------------------------------
\begin{document}
%----------------------------------------------------------------------
\begin{verbatim}
*/
//=====================================================================
// Arduino Uno talks to Quartus                  last edited: 2021-1210
//=====================================================================
#define txt01 "          +----xx----+                                 "
#define txt02 "   txd/D1-! 1     30 !-VIN,via ext.5V  .Ardu to Quartus"
#define txt03 "   rxd/D0-! 2     29 !-GND             .m328P(Uno)     "
#define txt04 " RESET/C6-! 3     28 !-C6/RESET        .m168(Nano)     "
#define txt05 "      GND-! 4     27 !-+5V local       .XTAL: 16MHz    "
#define txt06 "       D2-! 5     26 !-A7                              "
#define txt07 "       D3-! 6     25 !-A6  >>>>>>>>>>to FPGA >>        "
#define txt08 "       D4-! 7     24 !-C5 ======> nn    ======>        "
#define txt09 "       D5-! 8     23 !-C4 ======> stx_o ======>        "
#define txt10 "       D6-! 9     22 !-C3 ======> sdv_o ======>        "  
#define txt11 "myBEEP D7-!10     21 !-C2 ======> sdi_o ======>        " 
#define txt12 "       B0 !11     20 !-C1 ======>  cp_o ======>        "
#define txt13 "       B1 !12     19 !-C0 ======>  rb_o ======>        "
#define txt14 "       B2 !13     18 !-AREF       Quartus FPGA         "
#define txt15 "  MOSI/B3 !14     17 !-3V3 local                       "
#define txt16 "  MISO/B4 !15     16 !-B5/SCK/LED   .Ardu_Heartbeat    "
#define txt17 "          +----xx----+                                 "
//---------------------------------------------------------------------
  const char msgF01[] PROGMEM =  txt01 ;
  const char msgF02[] PROGMEM =  txt02 ;
  const char msgF03[] PROGMEM =  txt03 ;
  const char msgF04[] PROGMEM =  txt04 ;
  const char msgF05[] PROGMEM =  txt05 ;
  const char msgF06[] PROGMEM =  txt06 ;
  const char msgF07[] PROGMEM =  txt07 ;
  const char msgF08[] PROGMEM =  txt08 ;
  const char msgF09[] PROGMEM =  txt09 ;
  const char msgF10[] PROGMEM =  txt10 ;
  const char msgF11[] PROGMEM =  txt11 ;
  const char msgF12[] PROGMEM =  txt12 ;
  const char msgF13[] PROGMEM =  txt13 ;
  const char msgF14[] PROGMEM =  txt14 ;
  const char msgF15[] PROGMEM =  txt15 ;
  const char msgF16[] PROGMEM =  txt16 ;
  const char msgF17[] PROGMEM =  txt17 ;

//---------------------------------------------------------------------
  void  FPGA_MAP()
  {
       CRLF(); FLmsg(msgF01);     // info message 
       CRLF(); FLmsg(msgF02);     // info message        
       CRLF(); FLmsg(msgF03);     // info message        
       CRLF(); FLmsg(msgF04);     // info message        
       CRLF(); FLmsg(msgF05);     // info message        
       CRLF(); FLmsg(msgF06);     // info message        
       CRLF(); FLmsg(msgF07);     // info message        
       CRLF(); FLmsg(msgF08);     // info message        
       CRLF(); FLmsg(msgF09);     // info message        
       CRLF(); FLmsg(msgF10);     // info message        
       CRLF(); FLmsg(msgF11);     // info message        
       CRLF(); FLmsg(msgF12);     // info message        
       CRLF(); FLmsg(msgF13);     // info message        
       CRLF(); FLmsg(msgF14);     // info message        
       CRLF(); FLmsg(msgF15);     // info message        
       CRLF(); FLmsg(msgF16);     // info message        
       CRLF(); FLmsg(msgF17);     // info message            
       CRLF();
  }                           // end of Arduino-nano-external hardware
//--------------------------------------------------------------------
//\end{verbatim} \end{document}
