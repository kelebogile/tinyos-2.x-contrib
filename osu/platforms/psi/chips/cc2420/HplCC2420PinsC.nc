/*
 * Copyright (c) 2005-2006 Arch Rock Corporation
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * - Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the
 *   distribution.
 * - Neither the name of the Arch Rock Corporation nor the names of
 *   its contributors may be used to endorse or promote products derived
 *   from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE
 * ARCHED ROCK OR ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE
 */

/**
 * HPL implementation of general-purpose I/O for the ChipCon CC2420
 * radio connected to a TI MSP430 processor.
 *
 * @author Jonathan Hui <jhui@archrock.com>
 * @version $Revision$ $Date$
 */
 
/**
 * Copyright (c) 2007 - The Ohio State University.
 * All rights reserved.
 *
 * Permission to use, copy, modify, and distribute this software and its
 * documentation for any purpose, without fee, and without written agreement is
 * hereby granted, provided that the above copyright notice, the following
 * two paragraphs, and the author attribution appear in all copies of this
 * software.
 *
 * IN NO EVENT SHALL THE OHIO STATE UNIVERSITY BE LIABLE TO ANY PARTY FOR
 * DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING OUT
 * OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF THE OHIO STATE
 * UNIVERSITY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * THE OHIO STATE UNIVERSITY SPECIFICALLY DISCLAIMS ANY WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.  THE SOFTWARE PROVIDED HEREUNDER IS
 * ON AN "AS IS" BASIS, AND THE OHIO STATE UNIVERSITY HAS NO OBLIGATION TO
 * PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.

	@author 
	Lifeng Sang  <sangl@cse.ohio-state.edu>
	Anish Arora  <anish@cse.ohio-state.edu>	
	$Date$
	
	Porting TinyOS to Intel PSI motes
 */
  

configuration HplCC2420PinsC {
  provides interface GeneralIO as CCA;
  provides interface GeneralIO as CSN;
  provides interface GeneralIO as FIFO;
  provides interface GeneralIO as FIFOP;
  provides interface GeneralIO as RSTN;
  provides interface GeneralIO as SFD;
  provides interface GeneralIO as VREN;
}

implementation {

  components HplMsp430GeneralIOC as GeneralIOC;
  components new Msp430GpioC() as CCAM;
  components new Msp430GpioC() as CSNM;
  components new Msp430GpioC() as FIFOM;
  components new Msp430GpioC() as FIFOPM;
  components new Msp430GpioC() as RSTNM;
  components new Msp430GpioC() as SFDM;
  components new Msp430GpioC() as VRENM;


  CCAM -> GeneralIOC.Port27;
  CSNM -> GeneralIOC.Port30;
  FIFOM -> GeneralIOC.Port10;
  FIFOPM -> GeneralIOC.Port26;
  RSTNM -> GeneralIOC.Port57;
  SFDM -> GeneralIOC.Port12;
  VRENM -> GeneralIOC.Port56;
  

  CCA = CCAM;
  CSN = CSNM;
  FIFO = FIFOM;
  FIFOP = FIFOPM;
  RSTN = RSTNM;
  SFD = SFDM;
  VREN = VRENM;
  
}

