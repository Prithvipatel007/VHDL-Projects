/*
\documentclass[twoside,12pt,a4paper]{article}
\usepackage{a4}
\addtolength{\voffset}{-10mm}
\addtolength{\hoffset}{-20mm}
\addtolength{\textheight}{50mm}
\pagestyle{myheadings}\markboth{\sc \bf 05-Ardu-00init-h.h}
                               {\sc \bf 05-Ardu-00init-h.h}
%----------------------------------------------------------------------
\begin{document}
%----------------------------------------------------------------------
\begin{verbatim}
*/
//=====================================================================
// TO BE DONE: check 9k6-pattern and ext.XTAL    last edited: 2021-1210
//=====================================================================
// FOOTPRINT, ArduinoUno:m328 ArduinoNano: m168/m328   ====> check that
//
//            +----xx----+
//     TXD/D1-! 1     30 !-VIN,via External 5V-Supply
//     RXD/D0-! 2     29 !-GND          .FUSES:
//   RESET/C6-! 3     28 !-C6/RESET     .lfuse=0xE0:=ext.Xtal, 16MHz
//        GnD-! 4     27 !-+5V local    .lfuse=0xE4:=int.8MHz
//         D2-! 5     26 !-A7           .hfuse=0xD9:=disable JTAG
//         D3-! 6     25 !-A6           .
//         D4-! 7     24 !-C5           .avrdude: check m168-Fuses
//         D5-! 8     23 !-C4           .wr lfuse  0x00 0xE4 (int.8MHz)
//         D6-! 9     22 !-C3           .wr hfuse  0x00 0xD9 (dis.JTAG)
//  myBEEP D7-!10     21 !-C2           .wr memtype addr byte
//         B0 !11     20 !-C1           .
//         B1 !12     19 !-C0           .CPU:ATmega168P, ATmega328P
//         B2 !13     18 !-AREF         .XTAL@16MHz
//    MOSI/B3 !14     17 !-3V3 local    .
//    MISO/B4 !15     16 !-B5/SCK/LED   .Arduino_Nano_LED, Heartbeat
//            +----------+
//=====================================================================
// ATmega328-specific settings,                       =====> check that
//=====================================================================
#define myTIME       200                       // time-loop, dlyxx20MHz
#define myPULSE      0x20                      // is 0x08 @ 4MHz
#define myBEEP_log1  PORTD |=  _BV(PORTD7);    // beep speaker log1
#define myBEEP_log0  PORTD &= ~_BV(PORTD7);    // beep speaker log0

#define LED_REG        PORTB
#define LED_BIT        5
#define LED_Ardu_log0  PORTB &= ~_BV(PORTB5);
#define LED_Ardu_log1  PORTB |=  _BV(PORTB5);

#define myTIFR       TIFR0                         // TIFR0: 0x15,0x35
#define myTOV0       TOV0                          // TOV0/TIFR0, Bit0

#define myQTR_start  TIFR0 |= _BV(TOV0);TIFR0 &= ~_BV(TOV0);
//=====================================================================
// BAUD:9k6: UBRR= 0x19/04MHz, 0x32/08MHz, 0x40/10MHz
//                 0x4E/12MHz, 0x80/20MHz
//
#define TTY0baud  UBRR0H=0x00; UBRR0L=0x80;        // 9k6,20MHz,Ardu
#define TTY0mode  asm volatile ("nop");            // ATmega168p ???
#define TTY0ena   UCSR0B = (1<<TXEN0) | (1<<RXEN0);// **tx,rx enable
#define UDR0reg   UDR0                             // * UART RD/WR REG.
#define STA0reg   UCSR0A                           // **UART STATUS
#define DAV0bit   RXC0                             // * NEW DATA
#define TMB0bit   UDRE0                            // TX BUFFER EMPTY 
//=====================================================================
//NEWPAGE--------------NEWPAGE \end{verbatim} \newpage \begin{verbatim}
//---------------------------------------------------------------------
// Depends all on hardware. PORTA, PINA and DDRA  do not exist on m169
//
  void init_port(void)
  {
// DDRB  &= ~_BV(DDB7); PORTB |=  _BV(PORTB7);  // XTAL2
// DDRB  |=  _BV(DDB6); PORTB |=  _BV(PORTB6);  // XTAL1
// DDRB  &= ~_BV(DDB5); PORTB |=  _BV(PORTB5);  // SCK, is input
   DDRB  |=  _BV(DDB5); PORTB |=  _BV(PORTB5);  // SCK, ARDUINO LED
   DDRB  &= ~_BV(DDB4); PORTB |=  _BV(PORTB4);  // MISO
   DDRB  &= ~_BV(DDB3); PORTB |=  _BV(PORTB3);  // MOSI
   DDRB  &= ~_BV(DDB2); PORTB |=  _BV(PORTB2);  // inp, PIN
   DDRB  &= ~_BV(DDB1); PORTB |=  _BV(PORTB1);  // inp, PIN
   DDRB  &= ~_BV(DDB0); PORTB |=  _BV(PORTB0);  // inp, PIN 
//---------------------------------------------------------------------
// DDRC  &= ~_BV(DDC7); PORTC |=  _BV(PORTC7);  // not available
// DDRC  |=  _BV(DDC6); PORTC |=  _BV(PORTC6);  // RESET, m168
   DDRC  &= ~_BV(DDC5); PORTC |=  _BV(PORTC5);  // inp, ADC5
   DDRC  &= ~_BV(DDC4); PORTC |=  _BV(PORTC4);  // inp, ADC4
   DDRC  &= ~_BV(DDC3); PORTC |=  _BV(PORTC3);  // inp, ADC3
   DDRC  &= ~_BV(DDC2); PORTC |=  _BV(PORTC2);  // inp, ADC2
   DDRC  &= ~_BV(DDC1); PORTC |=  _BV(PORTC1);  // inp, ADC1
   DDRC  &= ~_BV(DDC0); PORTC |=  _BV(PORTC0);  // inp, ADC0
//---------------------------------------------------------------------
   DDRD  |=  _BV(DDD7); PORTD |=  _BV(PORTD7);  // out, log1, myBEEP
   DDRD  |=  _BV(DDD6); PORTD &= ~_BV(PORTD6);  // out, log0
   DDRD  |= ~_BV(DDD5); PORTD |=  _BV(PORTD5);  // out, log1
   DDRD  |=  _BV(DDD4); PORTD |=  _BV(PORTD4);  // out, log1
   DDRD  |=  _BV(DDD3); PORTD |=  _BV(PORTD3);  // out, log1
   DDRD  |=  _BV(DDD2); PORTD |=  _BV(PORTD2);  // out, log1
   DDRD  |=  _BV(DDD1); PORTD |=  _BV(PORTD1);  // out, log1, TxD
   DDRD  &= ~_BV(DDD0); PORTD |=  _BV(PORTD0);  // inp,  pup, RxD
//---------------------------------------------------------------------
   TCCR0B = 0x05;                               // ** CK/1024
   TCNT0  = 0x03;                               // load2start TCNT0
  }
//---------------------------------------------------------------------
  unsigned short int doqtr(unsigned short int icp)        // LED (HB)
  {                                                       // HeartBeat
   if (bit_is_set(myTIFR,myTOV0))                         // Timer=0?
    {if (icp==myPULSE)                                    // a second?
      {icp=0;
       if (bit_is_set(PORTB,5)) {PORTB &= ~_BV(PORTB5);}  // HB LED off
       else                     {PORTB |=  _BV(PORTB5);}  // HB LED on
      }
     myQTR_start;
     icp++;
    }
   return(icp);
  }
//---------------------------------------------------------------------
//NEWPAGE--------------NEWPAGE \end{verbatim} \newpage \begin{verbatim}
//---------------------------------------------------------------------
  void dly00()                                       // WASTE SOME TIME
  {unsigned int xtime;
   xtime=myTIME; while (xtime) {asm volatile ("nop"); xtime--;}
  }
//---------------------------------------------------------------------
  void dly10()                                       // WASTE MORE TIME
  {unsigned int xtime;
   xtime= 10; while (xtime) {asm volatile ("nop"); dly00(); xtime--;}
  }
//---------------------------------------------------------------------
  void dly99()                                       // WASTE MUCH TIME
  {unsigned int xtime;
   xtime=100; while (xtime) {asm volatile ("nop"); dly10(); xtime--;}
  }
//---------------------------------------------------------------------
  void beep00()                                      // GENERATE A BEEP
  {I=Idot; while (I>0){myBEEP_log1; dly00();
                       myBEEP_log0; dly00(); I--;}
   I=Idot; while (I>0){myBEEP_log0; dly00(); I--;}    
  }
//---------------------------------------------------------------------
  void beepxT(unsigned int xTper)                    // GENERATE PERIOD
  {unsigned int xtime;                               // SIDETONE CW
   I=Idot;
   while (I>0)
    {myBEEP_log1; xtime=xTper;
     while (xtime){asm volatile ("nop"); xtime--;}
     myBEEP_log0; xtime=xTper;
     while (xtime){asm volatile ("nop"); xtime--;}
     I--; 
    }
   I=Idot;
   while (I>0)
    {myBEEP_log0; xtime=xTper;
     while (xtime){asm volatile ("nop"); xtime--;}
     I--;
    }
  }
//---------------------------------------------------------------------
//NEWPAGE--------------NEWPAGE \end{verbatim} \newpage \begin{verbatim}
//---------------------------------------------------------------------
  unsigned char TTYs(void)                           // Get UART status
  { unsigned char statflag = 0x00;
    if (bit_is_set(STA0reg,DAV0bit)) {statflag=0xFF;}
    else                             {statflag=0x00;}
    return(statflag);
  }
//---------------------------------------------------------------------
  unsigned char TTYi(void)                             // Get UART data
  { unsigned char rxd=0x00;
    rxd=UDR0reg; return(rxd);
  }
//---------------------------------------------------------------------
  void TTYo(unsigned short int txd)
   { UDR0reg=txd;
     loop_until_bit_is_set(STA0reg,TMB0bit);                // dly99();
   }
//---------------------------------------------------------------------
  void CRLF(void)                                    // CR and LINEFEED
   { TTYo(0x0D); TTYo(0x0A);
   }
//---------------------------------------------------------------------
 unsigned char TTYw(void)                            // TTY, wait
   { while(rxd!=0xFF)                                // wait for input
     { rxd=TTYs();                                   // read status
       if (bit_is_set(myTIFR,myTOV0))                // second elapsed?
        {if (icp==myPULSE)                           // update for LED
           {icp=0;
            if (bit_is_set(LED_REG,LED_BIT)){LED_Ardu_log0} // LED dark
            else                            {LED_Ardu_log1} // LED 
           }
         myQTR_start; icp=icp+1;
        }
    }
     rxd=TTYi();
     if ((rxd>=0x61)&(rxd<=0x7A)){rxd=rxd & 0xDF;}   // byte to upper
     return(rxd);                                    // return data
   }
//---------------------------------------------------------------------
  void FLmsg(const char text[])                      // text stored in  
  {char c;                                           // prog-mem
   const char* addr;                                 // saves ram
   addr = text;
   while((c = pgm_read_byte(addr++))!= '\0') {TTYo(c);}
  }
//---------------------------------------------------------------------
//NEWPAGE--------------NEWPAGE \end{verbatim} \newpage \begin{verbatim}
//---------------------------------------------------------------------
#ifdef HAV_EEPROM           // use EEPROM to store config-data or msgs
//---------------
//#define EEPE  EEWE        // check that, depends on chip
//#define EEMPE EEMWE       // check that, depends on chip

   unsigned char EE_rd(unsigned int uiAddress)  
  {
   while(EECR & (1<<EEPE))  // ** EEPROM still writing? Allow time.
// ;                        // nop will not be removed by compiler
   {asm volatile ("nop");}  // at least one SEMICOLON is needed!
   EEAR = uiAddress;        // Set up address register
   EEARH = 0x00;            // Set up address register, use 256 Bytes
   EECR |= (1<<EERE);       // Start EEPROM READ by writing EERE
   return EEDR;             // Return data from Data Register
  }

//---------------------------------------------------------------------
   void EE_wr(unsigned int uiAddress, unsigned char ucData)
  {
   while(EECR & (1<<EEPE))  // ** EEPROM busy writing?
// ;                        // while condx is true
   {asm volatile ("nop");}  // at least one SEMICOLON is needed!
   EEAR = uiAddress;        // setup address register
   EEARH= 0x00;             // setup address register, use 256 Bytes
   EEDR = ucData;           // setup data register
   EECR |= (1<<EEMPE);      // ** write logical one to EEMWE
   EECR |= (1<<EEPE);       // ** start eeprom write by setting EEWE=1
  }

//---------------------------------------------------------------------
  void EEmsg(void)          // EEProm-Text-String to TTYo. see FLmsg()
  {unsigned int adr=0x00;
   adr=0x00;
   rxd=EE_rd(adr);
   while (rxd!=0xFF){TTYo(rxd); adr++; rxd=EE_rd(adr);}
  }
#endif
//---------------------------------------------------------------------
//\end{verbatim} \end{document}
