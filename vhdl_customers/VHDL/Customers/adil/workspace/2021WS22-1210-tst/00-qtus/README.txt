#-- --------------------------------------------------------------------
#-- --------------------------------------------------------------------
#-- filename: README.txt, last modified: 2021-1210
#-- --------------------------------------------------------------------
#-- --------------------------------------------------------------------
#
#  TASKs and INFOs:
#
# -1- INFO: The file <top-qtus.vhd> in the src-directory contains
#           a top-level-description of the design.
#     Task: Draw the corresponding BLOCK-DIAGRAM
#
# -2- INFO: The file <snd_e.vhd> in the src-directory contains
#           an entity of a sound-generator.
#           Its pins are available as inputs or outputs.
#           This file must not be changed!
#
# -3- INFO: The file <snd_a1.vhd> in the src-directory contains
#           an architecture of the sound-component.
#           It compiles ok, but its logic is partly nonsense.
#     Task: Design a BLOCK-Diagram for a working sound-generator,
#           using the pins of the entity for input and output.
#
#-- -------------------------------------------------------------------
# WHAT WE WANT TO SEE AND HEAR:
#
#     a) The output-pin <snd_o> of the entity snd must produce
#        a sound-beep of 1kHz after being activated.
#        (squarewave-signal, 50% low, 50% high)
#     b) Activation of sound is done by a transition from log0 to log1
#        at pin dv_i and an ASCII char 'E' at the d_i-pins
#        of the snd-component.
#     c) The activation starts a timer.
#        Timer-values are 2,3,4 and 5 minutes.
#        The pins s0 and s1 select the timer-value.
#     d) After the time-out (depending on s0 and s1), a sound-beep
#        with a duration of one second must be generated.
#     e) After that second elapsed, a new activation is possible.
#        
