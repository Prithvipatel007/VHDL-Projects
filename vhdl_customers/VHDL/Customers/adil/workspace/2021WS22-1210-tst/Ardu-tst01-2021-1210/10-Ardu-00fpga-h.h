/*
\documentclass[twoside,12pt,a4paper]{article}
\usepackage{a4}
\addtolength{\voffset}{-10mm}
\addtolength{\hoffset}{-20mm}
\addtolength{\textheight}{50mm}
\pagestyle{myheadings}\markboth{\sc \bf 10-Ardu-00fpga-h.h}
                               {\sc \bf 10-Ardu-00fpga-h.h}
%----------------------------------------------------------------------
\begin{document}
%----------------------------------------------------------------------
\begin{verbatim}
*/
//=====================================================================
// Arduino Uno talks to Quartus                  last edited: 2021-1210
//=====================================================================
//            +----xx----+
//     txd/D1-! 1     30 !-VIN,via ext.5V  .Arduino talks to Quartus
//     rxd/D0-! 2     29 !-GND             .CPU: m328P(Uno), m168(Nano)
//   RESET/C6-! 3     28 !-C6/RESET        .XTAL: 16MHz     (chk that)
//        GnD-! 4     27 !-+5V local
//         D2-! 5     26 !-A7
//         D3-! 6     25 !-A6     >>>>>>>>>>to Quartus FPGA >>>>>>>>>>>
//         D4-! 7     24 !-C5 ======> nn    ======> something useful
//         D5-! 8     23 !-C4 ======> stx_o ======> active transmission
//         D6-! 9     22 !-C3 ======> sdv_o ======> data-bit is valid  
//  myBEEP D7-!10     21 !-C2 ======> sdi_o ======> data-bit  
//         B0 !11     20 !-C1 ======>  cp_o ======> cp, clock-pulse
//         B1 !12     19 !-C0 ======>  rb_o ======> reset, active low
//         B2 !13     18 !-AREF       Quartus FPGA
//    MOSI/B3 !14     17 !-3V3 local
//    MISO/B4 !15     16 !-B5/SCK/LED            .Ardu_LED, Heartbeat
//------------+----xx----+---------------------------------------------
#define stx_out       DDRC  |=  _BV(DDC4);
#define stx_log0      PORTC &= ~_BV(PORTC4); // (0/1) T  : stx_i
#define stx_log1      PORTC |=  _BV(PORTC4); // (0/1) T  : stx_i
#define sdv_out       DDRC  |=  _BV(DDC3);
#define sdv_log0      PORTC &= ~_BV(PORTC3); // (0/1) V  : sdv_i
#define sdv_log1      PORTC |=  _BV(PORTC3); // (0/1) V  : sdv_i
#define sdi_out       DDRC  |=  _BV(DDC2);
#define sdi_log0      PORTC &= ~_BV(PORTC2); // (0/1) D  : sdi_i
#define sdi_log1      PORTC |=  _BV(PORTC2); // (0/1) D  : sdi_i
#define  cp_out       DDRC  |=  _BV(DDC1);
#define  cp_log0      PORTC &= ~_BV(PORTC1); // (0/1) C  :  cp_i
#define  cp_log1      PORTC |=  _BV(PORTC1); // (0/1) C  :  cp_i
#define  rb_out       DDRC  |=  _BV(DDC0);
#define  rb_log0      PORTC &= ~_BV(PORTC0); // (0/1) R  :  rb_i
#define  rb_log1      PORTC |=  _BV(PORTC0); // (0/1) R  :  rb_i
//---------------------------------------------------------------------
//
#include "./10-Ardu-00pins-h.h"
//
//---------------------------------------------------------------------
  const char msgFPGA00[] PROGMEM = "===> FPGA-specific, Q to quit ";
  const char msgFPGA01[] PROGMEM = "===> WR to PORTC0,C1,C2,C3,C4 ";
  const char msgFPGA02[] PROGMEM = "===> xy: x=0/1...y=rb.cp.DVT.BM. ";
  const char msgFPGA03[] PROGMEM = "===> 0R<CR>:  rb_o=0 ";
  const char msgFPGA04[] PROGMEM = "===> 1C<CR>:  cp_o=1 ";
  const char msgFPGA05[] PROGMEM = "===> 0D<CR>: sdi_o=0 ";
  const char msgFPGA06[] PROGMEM = "===> 1V<CR>: sdv_o=1 ";
  const char msgFPGA07[] PROGMEM = "===> 1T<CR>: stx_o=1 ";
  const char msgFPGA08[] PROGMEM = "===> xB<CR>: sdi_o=x, sdv_o=010 ";
  const char msgFPGA09[] PROGMEM = "===> xM<CR>: x=0:0x55, x=1:0x4E)  ";
  const char msgFPGA10[] PROGMEM = "===> FPGA done, returning to main.";
//---------------------------------------------------------------------
  void  FPGA_COMMAND(unsigned int mode)
  {
//---------------------------------------------------------------------
       CRLF(); FPGA_MAP();          // Footprint of m328 and m168
       CRLF(); FLmsg(msgFPGA00);    // info message        
       CRLF(); FLmsg(msgFPGA01);    // info message 
       CRLF(); FLmsg(msgFPGA02);    // info message        
       CRLF(); FLmsg(msgFPGA03);    // info message 
       CRLF(); FLmsg(msgFPGA04);    // info message 
       CRLF(); FLmsg(msgFPGA05);    // info message 
       CRLF(); FLmsg(msgFPGA06);    // info message 
       CRLF(); FLmsg(msgFPGA07);    // info message 
       CRLF(); FLmsg(msgFPGA08);    // info message 
       CRLF(); FLmsg(msgFPGA09);    // info message 
       CRLF(); FLmsg(msgFPGA10);    // info message 
       CRLF();
       rb_out;                      // PORTC0: ===>  rb_i of FPGA
       cp_out;                      // PORTC1: ===>  cp_i of FPGA
      sdi_out;                      // PORTC2: ===> sdi_i of FPGA
      sdv_out;                      // PORTC3: ===> sdv_i of FPGA
      stx_out;                      // PORTC4: ===> stx_i of FPGA       
      rb_log1;                      // FPGA reset now NOT active
      cp_log0;                      // e.g. to external FPGA-clock
     sdi_log0;                      // sdi, data-bit to FPGA, now log0
     sdv_log0;                      // sdi valid,  to FPGA, now log0
     stx_log0;                      // stx=0, we do not transmit now
//---------------------------------------------------------------------
   mode='0';                                     // loop control
   CRLF(); TTYo('?');
   while (mode!='Q')                             // quit, if Q
   {CRLF(); rxd0=TTYw(); TTYo(rxd);              // must be 0,1 or Q
    if (rxd0=='Q'){mode='Q';}                    // quit, if Q
    else                                         // get next char
     { 
      rxd1=TTYw(); TTYo(rxd);                    // get command
      if (rxd1=='Q'){mode='Q';}                  // or quit, if Q
     }
    if (!((rxd0=='0')|(rxd0=='1')))
      {rxd1='X';TTYo('-');}                      // must be 0 or 1
    TTYo(' ');                                   // space to TTY

//NEWPAGE--------------NEWPAGE \end{verbatim} \newpage \begin{verbatim}
//---------------------------------------------------------------------
    if (rxd1=='R')                               // WR FPGA-BIT rb_i
      {TTYo(' ');TTYo('r');TTYo('b');TTYo('=');
       TTYo(rxd0);
       if (rxd0=='0'){ rb_log0;}                 // rb_i: log0 
       if (rxd0=='1'){ rb_log1;}                 // rb_i: log1
       rxd1=0x00;
      }
//---------------------------------------------------------------------
    if (rxd1=='C')                               // WR FPGA-BIT cp_i
      {TTYo(' ');TTYo('c');TTYo('p');TTYo('=');
       TTYo(rxd0);
       if (rxd0=='0'){ cp_log0;}                 // cp_i: log0 
       if (rxd0=='1'){ cp_log1;}                 // cp_i: log1
       rxd1=0x00;
      }
//---------------------------------------------------------------------
    if (rxd1=='D')                               // WR FPGA-BIT sdi_i
      {TTYo('s');TTYo('d');TTYo('i');TTYo('=');
       TTYo(rxd0);
       if (rxd0=='0'){sdi_log0;}                 // sdi_i: log0
       if (rxd0=='1'){sdi_log1;}                 // sdi_i: log1
       rxd1=0x00;
      }
//---------------------------------------------------------------------
    if (rxd1=='V')                               // WR FPGA-BIT sdv_i
      {TTYo('s');TTYo('d');TTYo('v');TTYo('=');
       TTYo(rxd0);
       if (rxd0=='0'){sdv_log0;}                 // sdv_i: log0 
       if (rxd0=='1'){sdv_log1;}                 // sdv_i: log1
       rxd1=0x00;
      }
//---------------------------------------------------------------------
    if (rxd1=='T')                               // WR FPGA-BIT stx_i
      {TTYo('s');TTYo('t');TTYo('x');TTYo('=');
       TTYo(rxd0);
       if (rxd0=='0'){stx_log0;}                 // stx_i: log0 
       if (rxd0=='1'){stx_log1;}                 // stx_i: log1 
       rxd1=0x00;
      }
//---------------------------------------------------------------------
// Write one bit, sdi/sdv-pattern to a FPGA
// The FPGA has its own XTAL, e.g. on Quartus: cp=12MHz
// First, we generate sdi, e.g.: sdi=XXXXXXXXXX_000_XXX
//            next activate sdv: sdv=0000000000_010_000
//
    if (rxd1=='B') 
      {TTYo('s');TTYo('d');TTYo('i');TTYo('=');
       TTYo(rxd0);TTYo(' ');
       TTYo('s');TTYo('d');TTYo('v');TTYo('=');
       TTYo('0');TTYo('1');TTYo('0');
       if (rxd0=='0') { sdi_log0; sdv_log1; sdv_log0; sdi_log0; }
       if (rxd0=='1') { sdi_log1; sdv_log1; sdv_log0; sdi_log1; }
       rxd1=0x00;
      }
//---------------------------------------------------------------------
// Write a byte to the FPGA, use the sdi/sdv-pattern
// The FPGA has its own XTAL, e.g. on Quartus: cp=12MHz
// First: generate sdi-data, e.g.: sdi=XXXXXXXXXX_000_...
//             next: activate sdv: sdv=0000000000_010_...
//                                                            
    if (rxd1=='M') 
      {TTYo('m');TTYo('s');TTYo('g');TTYo('='); TTYo(rxd0);TTYo(' ');
       if (rxd0=='0')
         {
          sdi_log0; sdv_log1; sdv_log0;      // check sdi-signal-length
          sdi_log1; sdv_log1; sdv_log0;
          sdi_log0; sdv_log1; sdv_log0;
          sdi_log1; sdv_log1; sdv_log0;
          sdi_log0; sdv_log1; sdv_log0;
          sdi_log1; sdv_log1; sdv_log0;
          sdi_log0; sdv_log1; sdv_log0;
          sdi_log1; sdv_log1; sdv_log0;
         }
       if (rxd0=='1')
         {
          sdi_log1; sdv_log1; sdv_log0;
          sdi_log0; sdv_log1; sdv_log0;
          sdi_log1; sdv_log1; sdv_log0;
          sdi_log0; sdv_log1; sdv_log0;
          sdi_log0; sdv_log1; sdv_log0;
          sdi_log0; sdv_log1; sdv_log0;
          sdi_log1; sdv_log1; sdv_log0;
          sdi_log0; sdv_log1; sdv_log0;
         }
       rxd1=0x00;
      }
//---------------------------------------------------------------------
//---------------------------------------------------------------------
    if (rxd1!=0x00){ TTYo('?'); TTYo('!'); CRLF(); }
   }
   CRLF(); FLmsg(msgFPGA10); CRLF();                       // FPGA done         

//---------------------------------------------------------------------
  }                            // end of Arduino-nano-external hardware
//---------------------------------------------------------------------
//\end{verbatim} \end{document}
