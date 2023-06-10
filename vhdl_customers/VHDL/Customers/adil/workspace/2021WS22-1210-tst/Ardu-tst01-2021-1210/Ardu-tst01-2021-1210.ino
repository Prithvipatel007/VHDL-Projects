/*  The % is a comment in tex
\documentclass[twoside,10pt,a4paper]{article} 
\usepackage{a4} \usepackage{german} 
\usepackage{graphics} \usepackage{epsfig} %\usepackage{curves}
\addtolength{\voffset}{-10mm}\addtolength{\hoffset}{-20mm}
\addtolength{\textheight}{50mm}
\pagestyle{myheadings}
  \markboth{\sc \small Ardu-328-tst01-2021-1210.ino}
           {\sc \small Ardu-328-tst01-2021-1210.ino}
%----------------------------------------------------------------------
%\def\myto { $ \rightarrow $ }
 \begin{document}
%----------------------------------------------------------------------
 \noindent
 {\bf Ardu-tst01-2021-1210.ino}\\[5mm]

 \begin{tabular}{lll}
 \hline
   Targets:    & Ardu-Uno(328),Nano(168), @16MHz & ok?: \\
               & no JPG available                &      \\[2mm]\hline
   Include:    & 05-Ardu-00init-h.h              &      \\
   Include:    & 06-Ardu-00misc-h.h              &      \\
   Include:    & 10-Ardu-00fpga-h.h              &      \\
   Include:    & 10-Ardu-00pins-h.h              &      \\
   THIS FILE:  & Ardu-tst01-2021-1209            &      \\\hline
   History:    & 2020-0618,2021-1028             &      \\\hline
   Last Edited:& 2021-1210                       &      \\\hline
 \end{tabular}

 {\small
 \begin{verbatim}
//=====================================================================
// FOOTPRINTS, Arduino UNO(m328), Nano(m168)           -- check that --
//=====================================================================
//            +----xx----+
//     txd/D1-! 1     30 !-VIN,ext.5V   .External 5V VCC
//     rxd/D0-! 2     29 !-GND          .FUSES:
//   RESET/C6-! 3     28 !-C6/RESET     .lfuse=0xE0 :=ext.Xtal, 20MHz
//        GnD-! 4     27 !-+5V local    .lfuse=0xE4 :=int.8MHz
//         D2-! 5     26 !-A7           .hfuse=0xD9 :=disable JTAG
//         D3-! 6     25 !-A6           .
//         D4-! 7     24 !-C5 ==> nn    .something useful
//         D5-! 8     23 !-C4 ==> stx_o .wr lfuse  0x00 0xE4 (int.8MHz)
//         D6-! 9     22 !-C3 ==> sdv_o .wr hfuse  0x00 0xD9 (dis.JTAG)
//  myBEEP D7-!10     21 !-C2 ==> sdi_o .wr memtype addr byte
//         B0 !11     20 !-C1 ==>  cp_o
//         B1 !12     19 !-C0 ==>  rb_o .CPU:ATmega168P,ATmega328P
//         B2 !13     18 !-AREF         .XTAL(at)20MHz,16MHz,
//    MOSI/B3 !14     17 !-3V3 local
//    MISO/B4 !15     16 !-B5/SCK/LED   .Ardu_LED, Heartbeat
//            +----------+
//=====================================================================
// Board: Arduino Uno (328)      Arduino Nano (168)  Arduino Nano (328)
// Port:       /dev/ttyACM0            /dev/ttyUSB0        ...
// Programmer:          nil                     nil        ...        
//=====================================================================
*/
#define HAV_Arduino
#define HAV_16MHz              // check that: XTAL on ARDUINO-UNO-BOARD

#define HAV_EEPROM             // some routines to use EEPROM
#define HAV_EXT_FPGA           // a FPGA is attached

#include <avr/io.h>            // ATMEL memory map
#include <avr/pgmspace.h>      // Access to Atmel-Flash-Storage

#ifdef HAV_Arduino             // compile for Arduino?
#include "Arduino.h"
#endif

  const char msgH0[]  PROGMEM = "===> Ardu-xx8-tst01-2021-1210";
//const char msgH0[]  PROGMEM = "===> AUno-328-tst01-2021-1028";
//const char msgH0[]  PROGMEM = "===> Nano-168-tst01-2021-1028";
  const char msgH1[]  PROGMEM = "===> comp:2021-1210-11:00";
  unsigned char            rxd= 0x30;    // Byte received
  unsigned char           rxd0= 0x30;    // Byte received, temp.storage
  unsigned char           rxd1= 0x30;    // Byte received, temp.storage
  unsigned char            txd= 0x30;    // Byte to be TXed
  unsigned char            dav= 0x00;    // New data available
  unsigned char           mode= 0x30;    // Normal Mode
  unsigned short int       icp= 0x00;    // Heartbeat
  unsigned int               I=    0;
  unsigned int            Idot=  100;
//unsigned int            icur=    0;

#include "./05-Ardu-00init-h.h"
#include "./06-Ardu-00misc-h.h"
//#include </path_to_this_file/05-Ardu-00init-h.h>
//#include </path_to_this_file/06-Ardu-00misc-h.h>

#ifndef HAV_EXT_FPGA
  const char m_noFPGA[]  PROGMEM = "=====> no external FPGA <=====";
#endif

#ifdef HAV_EXT_FPGA
#include "./10-Ardu-00fpga-h.h"
//#include </path_to_this_file/10-Ardu-00fpga-h.h>
#endif
//NEWPAGE--------------NEWPAGE \end{verbatim} \newpage \begin{verbatim}
//---------------------------------------------------------------------
  const char m_ax[]      PROGMEM = "#--------------------------";
  const char m_a0[]      PROGMEM = "#x  :x=.012?...";
  const char m_a1[]      PROGMEM = "#Sx :x=.BCDZ...00=IN,FF=OUT";
  const char m_a2[]      PROGMEM = "#Rx :x=.BCD....RPx : x=.BCD";
  const char m_a3[]      PROGMEM = "#Wx :x=.BCDT...T=TTYo";
  const char m_a4[]      PROGMEM = "#X  :talk to FPGA, Q: return";
  const char m_WHAT[]    PROGMEM = "#WHAT?";

  void HELPmsg(void)
   {
    CRLF(); FLmsg(msgH0); CRLF(); FLmsg(msgH1);
    CRLF(); FLmsg(m_ax);
    CRLF(); FLmsg(m_a0);  CRLF(); FLmsg(m_a1); CRLF(); FLmsg(m_a2);
    CRLF(); FLmsg(m_a3);  CRLF(); FLmsg(m_a4); CRLF(); FLmsg(m_ax);
    CRLF(); 
   }
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//---------------------------------------------------------------------
  int main(void)
  {
//---------------------------------------------------------------------
   init_port();                         // init ports ---HARDWARE!!!---

#ifdef HAV_Arduino                      // compile for Arduino?
#include "Arduino.h"
   Serial.begin(9600); 
#else                                   // ARDU: Serial in/out via USB
   TTY0baud; TTY0mode; TTY0ena;         // NON-ARDU: use a TTY
#endif
   rxd=UDR0reg;                         // avoids garbage after boot
   beep00();CRLF();TTYo('!');           // UART ok?
#ifdef HAV_EEPROM                       // EEPROM? --------------------
   TTYo(':');                           // ok so far?
   EE_wr(0x00,0x40);                    // test, wr EEPROM, adr=0x00
   EE_wr(0x01,0x41);                    // test, wr EEPROM, adr=0x01
   EE_wr(0x02,0x42);                    // test, wr EEPROM, adr=0x02
   EE_wr(0x03,0x43);                    // test, wr EEPROM, adr=0x03
   TTYo(EE_rd(0x00));                   // read EEPROM, adr=0x00
   TTYo(EE_rd(0x01));                   // read EEPROM, adr=0x01
   TTYo(EE_rd(0x02));                   // read EEPROM, adr=0x02
   TTYo(EE_rd(0x03));                   // read EEPROM, adr=0x03
   TTYo('!');  
   EEmsg();                             // message after reset
#endif                                  // ----------------------------
   CRLF();
   FLmsg(msgH0); CRLF();                // message after reset            
   FLmsg(msgH1); CRLF();                // message after reset            
//---------------------------------------------------------------------
//NEWPAGE--------------NEWPAGE \end{verbatim} \newpage \begin{verbatim}
//---------------------------------------------------------------------
   for(;;)                                           // loop forever ..
   {
//---------------------------------------------------------------------
   icp=doqtr(icp);
//---------------------------------------------------------------------
   dav=TTYs();                                       // any UART-Input?
   if (dav==0xFF) 
    {rxd=TTYi();
     if ((rxd>=0x61)&(rxd<=0x7A)) {rxd=rxd & 0xDF;}  // do upper case
     TTYo(rxd);     // and echo to tty
     if (rxd==0x0D) {TTYo(0x0A);}                    // add CRLF
    }
//---------------------------------------------------------------------
   if (dav==0xFF)                                    // new UART data,
     {                                               // if dav is 0xFF
//---------------------------------------------------------------------
      switch(rxd)
      {
//---------------------------------------------------------------------
       case 'S':                                     //Set IO, Port BCD
        {rxd=TTYw(); TTYo(rxd);
         if (rxd=='A') {FLmsg(m_WHAT);  CRLF(); rxd=0x00;}
//       if (rxd=='A') {rxd=hexcom(); DDRA=rxd; rxd=0x00;} // NO PORTA
         if (rxd=='B') {rxd=hexcom(); DDRB=rxd; rxd=0x00;} // Set PORTB
         if (rxd=='C') {rxd=hexcom(); DDRC=rxd; rxd=0x00;} // Set PORTC
         if (rxd=='D') {rxd=hexcom(); DDRD=rxd; rxd=0x00;} // Set PORTD
         if (rxd=='Z') {DDRB=0x00;                         // ALL INPUT
                        DDRC=0x00;           // DDRA=0x00 IS NOT present
                        DDRD=0x00;}          // on m169
         CRLF(); rxd=0x00; break;
        }
//--------------------------------------------------------------------- 
       case 'W':                       //Wx: write to PORTs BCD and TTY
        {rxd=TTYw(); TTYo(rxd);                        
         if (rxd=='A') {FLmsg(m_WHAT);  CRLF(); rxd=0x00;}   //NO PORTA
//       if (rxd=='A') {TTYo('?');rxd=hexcom();PORTA=rxd; rxd=0x00;}
         if (rxd=='B') {TTYo('?');rxd=hexcom();PORTB=rxd; rxd=0x00;}
         if (rxd=='C') {TTYo('?');rxd=hexcom();PORTC=rxd; rxd=0x00;}
         if (rxd=='D') {TTYo('?');rxd=hexcom();PORTD=rxd; rxd=0x00;}
         if (rxd=='T') {TTYo('?');rxd=hexcom();TTYo(rxd); rxd=0x00;}
         if (rxd!=0x00){FLmsg(m_WHAT);}
         TTYo('.'); TTYo('.'); rxd=0x00; break;
        }
//NEWPAGE--------------NEWPAGE \end{verbatim} \newpage \begin{verbatim}
//--------------------------------------------------------------------- 
       case 'R':                                       //Rx reads PORTX
        {rxd=TTYw(); TTYo(rxd);                        //RPx reads PINx
         if (rxd=='P')                   
           {rxd=TTYw(); TTYo(rxd); TTYo(':');              //which PIN?
         if (rxd=='A') {FLmsg(m_WHAT);  CRLF(); rxd=0x00;}
//          if (rxd=='A') {rxd=PINA; tbcd2(rxd); rxd=0x00;}  //NO PIN A
            if (rxd=='B') {rxd=PINB; tbcd2(rxd); rxd=0x00;}  //PIN B?
            if (rxd=='C') {rxd=PINC; tbcd2(rxd); rxd=0x00;}  //PIN C?
            if (rxd=='D') {rxd=PIND; tbcd2(rxd); rxd=0x00;}  //PIN D?
           }
         if (rxd=='A') {FLmsg(m_WHAT);  CRLF(); rxd=0x00;}   //NO PORTA
//       if (rxd=='A') {TTYo(':'); rxd=PORTA; tbcd2(rxd); rxd=0x00;}
         if (rxd=='B') {TTYo(':'); rxd=PORTB; tbcd2(rxd); rxd=0x00;}
         if (rxd=='C') {TTYo(':'); rxd=PORTC; tbcd2(rxd); rxd=0x00;}
         if (rxd=='D') {TTYo(':'); rxd=PORTD; tbcd2(rxd); rxd=0x00;}
         TTYo('.'); TTYo('.'); CRLF(); rxd=0x00; break;
        }
//---------------------------------------------------------------------
       case 'X':
        {CRLF(); mode='0';           //--------------------------------
#ifdef HAV_EXT_FPGA                  // Any external hardware?.
         FPGA_COMMAND('0');          //--------------------------------
         CRLF(); HELPmsg();
#else
         CRLF(); FLmsg(m_noFPGA);
#endif
         CRLF(); rxd=0x00; break;
        }
//---------------------------------------------------------------------
       case '0': {TTYo(' ');TTYo('.');TTYo('0');CRLF();rxd=0x00;break;}
       case '1': {TTYo(' ');TTYo('.');TTYo('1');CRLF();rxd=0x00;break;}
       case '2': {TTYo(' ');TTYo('.');TTYo('2');CRLF();rxd=0x00;break;}
//---------------------------------------------------------------------
       case '?':
        {CRLF(); HELPmsg(); CRLF();rxd=0x00; break;}
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//..... White space for more commands ......
//---------------------------------------------------------------------
       default : 
        {if (rxd!=0x0D)
            {TTYo('>');TTYo('E');TTYo('R');TTYo('R');TTYo(' ');CRLF();}
         break;}
//---------------------------------------------------------------------
      }                               // end of switch-case, cases done
      dav=0x00;                       // clear dav-flag and all
     }                                // activities caused by dav-flag
//---------------------------------------------------------------------
   }                                  // Ende for-loop
  }                                   // Ende main
//ENDDOKU-------------------------------------------------------ENDDOKU
//\end{verbatim}}\end{document}
