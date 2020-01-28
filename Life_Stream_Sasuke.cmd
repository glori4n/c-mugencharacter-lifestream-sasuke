; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional -- defaults to 15 if omitted)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas.
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   You can combine them:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;   It's recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This matches the way most
;   popular fighting games implement their command detection.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. Defaults to 15
;   if omitted
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
; 
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10
; 

;-| Super Motions |--------------------------------------------------------

[Command]
name = "Chidori"
command =~D, DF, c
time = 17

[command]
name = "sha"
command = D,F,x
time = 15

[Command]
name = "TripleKFPalm"
command = ~D, D, z
time = 20

[Command] 
name = "TripleKFPalm"   ;Same name as above
command = ~D, y
time = 20

[Command]
name = "bun"
command = ~D, D,DF, D, DF,y

[Command]
name = "bun2"
command = ~z
time = 30

[Command]
name = "bun3"
command = ~D,D,D,D,DF,DF,DF,D,c

;-| Special Motions |------------------------------------------------------

[Command]
name = "Fire Dragon"
command = ~D,z
time = 30

[Command]
name = "Katon"
command = ~D,c
time = 30

[Command]
name = "sha chidori"
command= ~D,x

[Command]
name = "QCF_x"
command = ~D,c

[Command]
name = "QCF_y"
command = ~D, DF, F, y

[Command]
name = "QCF_xy"
command = ~D, DF, F, x+y

[Command]
name = "QCB_a"
command = ~D, DF, F, a

[Command]
name = "QCB_b"
command = ~D, D, c

[Command]
name = "FF_ab"
command = F, F, a+b

[Command]
name = "FF_a"
command = F, F, a

[Command]
name = "FF_b"
command = F, F, b

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = y+x
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "yy"
command = y, y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

[Command]
name = "holdc"
command = /$c
time = 1

[Command]
name = "holdz"
command = ~D, DB, B, /$s

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_s"
command = /s
time = 1

[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_y"
command = /y
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.  
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

;------------------------sharingan
[State -1,Sharingan]
type = ChangeState
value = 19999
triggerall = command = "sha"
triggerall = power >= 1000
triggerall = var(1) = 0
trigger1 = statetype = S
trigger1 = ctrl

;Sharingan Weapon Throw
[state -1, Sharingan Weapon Throw]
type = changestate
value = 10200
triggerall = var(1) = 1
triggerall= command ="b"
triggerall= command!="holddown"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;Sharingan attack 1
[state -1, Sharingan attack 1]
type = changestate
value = 10202
triggerall = var(1) = 1
triggerall= command ="a"
triggerall= command!="holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = movecontact
trigger2 = stateno = 10205
trigger3 = movecontact
trigger3 = stateno = 10206
;----------------------------------------------------------------------------
;Sharingan attack 2
[state -1, Sharingan attack 2]
type = changestate
value = 10203
triggerall = var(1) = 1
triggerall= command ="a"
triggerall = command!="holddown"
trigger1= ctrl
trigger1= statetype = S
trigger2= stateno = 10202 && animelemtime(2)>0
;---------------------------------------------------------------------------
;Sharingan attack 3
[state -1, Sharingan attack 3]
type = changestate
value = 10204
triggerall = var(1) = 1
triggerall = command ="a"
triggerall = command!="holddown"
trigger1= ctrl
trigger1= statetype = S
trigger2= stateno = 10203 && animelemtime(2)>0
;---------------------------------------------------------------------------
;Sharingan attack 4
[state -1, attack 4]
type = changestate
value = 10205
triggerall = var(1) = 1
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2= stateno = 10204 && animelemtime(2)>0
;---------------------------------------------------------------------------
;Sharingan Sharingan Chidori
[State -1, Sharingan Chidori]
type = ChangeState
value = 10206
triggerall = command = "sha chidori"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl

;===========================================================================

;---------------------------------------------------------------------------
;Sasuke Run Foward
[State -1, Run Foward]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, Dash Punch]
type = ChangeState
value = 230
triggerall = stateno = 210
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S

[State -1, Dash UpperCut]
type = ChangeState
value = 285
triggerall = stateno = 100
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
;---------------------------------------------------------------------------
;Sasuke Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl


;sasuke Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype = S
trigger1 = ctrl


;Light Punch
[State -1, Light Punch]
type = ChangeState
value = 200
Triggerall = command = "a"
Triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 250
trigger2 = time >= 6

;-------------------------------------------------------------------
;Light Punch2
[State -1, Light Punch2]
type = ChangeState
value = 210
triggerall = stateno = 200
Triggerall = command = "a"
Triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = time >= 6

;-------------------------------------------------------------------
;medium punch
[state -1, Medium Punch]
type = ChangeState
value = 220
triggerall = stateno = 210
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = time >= 9


;--------------------------------------------------------------------------
;Sasuke Kick Combo
[State -1, Kick Combo]
type = ChangeState
value = 350
triggerall = command = "x"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 210
trigger2 = time >= 24

[State -1, Kick Combo 2]
type = ChangeState
value = 280
triggerall = stateno = 350
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = time >= 10

;---------------------------------------------------------------------------
;Sasuke Kunai Throw
[State -1, Kunai Throw]
type = ChangeState
value = 240
triggerall = command = "b"
trigger1 = statetype = S
triggerall = ctrl
trigger2 = stateno = 250

;Sasuke Double Kunai Throw
[State -1, Double Kunai Throw]
type = ChangeState
value = 250
trigger1 = statetype = S
triggerall = command = "b"
trigger1 = ctrl
triggerall = time >= 18
trigger2 = stateno = 240

;-------------------------------------------------------------
;Kawarmi
[State -1, Kawarmi]
type = ChangeState
value = 700
triggerall = power >= 50
triggerall = stateno != 120
triggerall = stateno != 130
triggerall = stateno != 131
triggerall = stateno != 132
triggerall = stateno != 140
triggerall = stateno != 150
triggerall = stateno != 151
triggerall = stateno != 152
triggerall = stateno != 153
triggerall = stateno != 154
triggerall = stateno != 155
triggerall = stateno != 5150
triggerall = stateno != 5110
Triggerall = command = "a"
trigger1 = movetype = H

;---------------------------------------------------------------------------
;Sasuke Duck Kick
[State -1, Duck Kick]
type = ChangeState
value = 280
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact
trigger2 = time = 8
;--------------------------------------------------------------------------
;Katon
[State -1, Katon]
type = changestate
value = 4000
trigger1 = power >= 1000
trigger1 = command = "Katon"
trigger1 = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
;-----------------------------------------------------------------------
;Chakra Charge
; Stand Light Punch
[State -1, Chakra Charge]
type = ChangeState
value = 930
triggerall = command = "hold_a" && command = "hold_x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
;--------------------------------------------------------------------------
;Lion Combo
[State -1, Lion Combo]
type = ChangeState
value = 300
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = power >= 500
trigger1 = statetype != A
trigger1 = ctrl

;-------------------------------------------------------------
[State -1, Chidori]
type = ChangeState
value = 1500
Triggerall = Command != "Chidori"
triggerall = power >= 1000
Triggerall = command = "c"
Triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl

;--------------------------------------------------------------------------
;Lightning Dash
[State -1, Lightning Dash]
type = ChangeState
value = 345
triggerall = command = "y"
triggerall = power >= 0
trigger1 = statetype = S
trigger1 = ctrl
;--------------------------------------------------------------------------
;Hosenka Katon
[State -1, Hosenka Katon]
type = ChangeState
value = 355
triggerall = command = "c"
triggerall = power >= 100
triggerall = statetype = A
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = movecontact
;----------------------------------------------------------------------------
;Shuriken
[State -1, Air Shuriken]
type = ChangeState
value = 1100
triggerall = power >= 0 
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl
;-----------------------------------------------------------------------------
;Jump Punch
[State -1, Jump Punch]
type = ChangeState
value = 600
triggerall = var(9) = 0
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

;-----------------------------------------------------------------
;Jump Punch
[State -1, Jump Kick]
type = ChangeState
value = 610
triggerall = var(9) = 0
triggerall = stateno = 600
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = time >= 6

;-----------------------------------------------------------------
;Jump Punch
[State -1, Down Kick]
type = ChangeState
value = 620
triggerall = var(9) = 0
triggerall = stateno = 610
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = time >= 14
;--------------------------------------------------
;clone
[State -1, Bunshin]
type = changestate
value = 654
triggerall = numhelper(15001) < 5
triggerall = power >= 1000
triggerall = var(39) = 0
triggerall = command = "bun"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, Bunshin Atk2]
type = changestate
value = 6552
triggerall = power >= 500
triggerall = var(39) = 0
triggerall = numhelper(656) < 5
triggerall = numhelper(15008) < 2
triggerall = command = "bun3"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, Bunshin Atk]
type = changestate
value = 655
triggerall = power >= 500
triggerall = var(39) = 0
triggerall = numhelper(656) < 5
triggerall = numhelper(15008) < 2
triggerall = command ="bun2"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl


[State -1, Bunshin]
type = changestate
value = 654
triggerall = power >= 400
triggerall = numhelper(654) < 5
triggerall = var(39) = 1
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

[State -1, Bunshin Atk]
type = changestate
value = 655
triggerall = power >= 400
triggerall = var(39) = 1
triggerall = numhelper(15008) = 0
triggerall = numhelper(656) < 5
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl


[State -1, Bunshin Atk2]
type = changestate
value = 6552
triggerall = power >= 400
triggerall = var(39) = 1
triggerall = numhelper(656) < 5
triggerall = numhelper(15008) < 2
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;Fire Dragon
[State -1, Fire Dragon]
type = ChangeState
value = 4545
triggerall = command = "Fire Dragon"
trigger1 = ctrl
trigger1= power>= 800
