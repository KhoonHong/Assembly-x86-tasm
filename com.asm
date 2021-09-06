title mainmenulogin	mainmenu & login
.model small
.stack 64
.data 

	;## main menu data ##
	businessName	db	"Ippudo Ramen Shop", 10, 13, "$"
	underline		db	"=======================================$"	

	mainMenuTitle	db 	"Main Menu", 10, 13, "$"
	mainMenu1		db	"1) Staff login", 10, 13, "$"
	mainMenu2		db	"2) Exit system", 10, 13, "$"

	promptChoice	db	"Please enter choice  : $"

	newline			db	10,13, "$"

	errorMsg		db	"Invalid choice, please retry", 10, 13, "$"
	
	msg1 			db 	"The entered choice is ","$"

	userChoice		label	byte
	userChoice_max	db		2
	userChoice_act	db		?
	userChoice_buf	db  	2 dup (?), "$"

	lg				db	"<Login module>$"
	
	goodbyeMsg		db 	"Goodbye !$"
	
	;## login data ##
	titleLogin 		db 	"Staff Login$"	
	promptStaffID 	db 	"Please enter staffID : ","$"
	promptstaffPW 	db	"Please enter password: ","$"

	staffID			db	7
					db	?
					db	7 dup("$"),"$"

	staffPW			db	7
					db	?
					db	7 dup("$"),"$"
	pwCharCounter	db	0

	validID			db	6 dup (?), "$"
	validPW			db	6 dup (?), "$"
	empName 		db 	100 dup (?), "$"

	successfulMsg 	db	"Login successful !","$"
	welcomeMsg		db	"Welcome, $"
	unsuccessfulMsg db	"Invalid staffID or password!$"
	retry			db	"Please retry","$"
	specialMsg		db	"Too many incorrect credentials! Please seek management help!$"
	warningMsg		db 	"! WARNING !", "$"
	
	noOfAttempts	db	0
	
	anyKey			db	"Press any key to continue...$"
	
	;#### read file ####
	fileName 		db 	"creds.txt", "$"
	filehandler 	dw 	?
	colNum			dw	0
	numOfEmp  		db  0
	
	confirmExitMsg	db	"Sure to exit? (Y / N): ", "$"
	exitConfirm		db	?
	invalidYesNo	db	"Invalid choice, enter Y or N only.", "$"
	
	
		
	;#################
	;### menu data ###
	titleMenu 		db 	"Food Menu$"	
	;promptChoice 	db 	10, 13, 10, 13, "Please enter choice  : ","$"
	zerotoexit		db	"(0 to stop)$"
	promptQty	 	db	"Please enter quantity: ","$"
	invalidChoice	db	"Invalid choice, choice must be a number 1 to 8.", "$"
	invalidQty		db	"Invalid quantity, quantity must be a number 1 to 9.", "$"

	choice			db	10 dup(0)
	qty				db	10 dup(0)
	pricingqty		dw	10 dup(0)

	menuline1		db	"              <  Ramen  > ", "$"
	menuline2		db	"1) Chicken      Ramen           RM 10.00", "$"
	menuline3		db	"2) Beef         Ramen           RM 15.00", "$"
	menuline4		db	"3) Pork         Ramen           RM 18.00", "$"
	menuline5		db	"4) Seafood      Ramen           RM 20.00", "$"
	menuline6		db	"5) Supreme      Ramen           RM 25.00", "$"
	menuline7		db	"              < Dessert >", 10, 13, "                   6) Japanese Melon  (1pcs)       RM 10.00$"
	menuline8		db	"7) Coffee   Jelly               RM 10.00", 10, 13, "                   8) Mochi Ice Cream (assorted)   RM 20.00$"
	;menuline8		db	"6) Japanese Melon  (1pcs)       RM 10.00", "$"
	;menuline9		db	"7) Coffee   Jelly               RM 10.00", "$"
	;menuline10		db	"8) Mochi Ice Cream (assorted)   RM 20.00", "$"
	noteline1		db  "**Note: each order is limited to max 20 total quantity only**", "$" 
	noteline2 		db	"**Note: each item is limited to max 9 quantity only**", "$"
	pricing			db	10, 15, 18, 20, 25, 10, 10, 20
	itemName1		db	"  Chicken   Ramen              10.00         $"
	itemName2		db	"  Beef      Ramen              15.00         $"
	itemName3		db	"  Pork      Ramen              18.00         $"
	itemName4		db	"  Seafood   Ramen              20.00         $"
	itemName5		db	"  Supreme   Ramen              25.00         $"
	itemName6		db	"  Japanese Melon (1pcs)        10.00         $"
	itemName7		db	"  Coffee   Jelly               10.00         $"
	itemName8		db	"  Mochi Ice Cream (assorted)   20.00         $"

	;newline			db	10, 13, "$"

	anymoreMsg 		db	10, 13, "Anymore?","$"
	anymoreAns		db	?

	;unsuccessfulMsg db	"Invalid staffID or password!","$"
	;retry			db	"Please retry","$"
	;specialMsg		db	"Too many incorrect credentials! Please seek management help!","$"
	toomanyMsg		db	"Max limit of 20 item quantity exceeded !", 10, 13, 10, 13,"                         Number of quantity left: $"
	equalnineMsg	db	10, 13, "Max limit of 20 items has reached", 10, 13, "Please confirm to proceed.", 10, 13,"$"
	;invalidYesNo	db	10, 13, "Invalid choice, enter Y or N only.", 10, 13, "Please retry.", "$"
	
	index			dw	0

	subTotal		dw 	0
	totalQty		db  0
	overby			db	0
	oriqty			db  0
	
	thirddigit		db	0
	scdigit			db	0
	
	proceedMsg1L1	db	"Next step", 10, 13, "              1) Add more       2) Delete item       3) Checkout$"
	proceedMsg1L2	db	10, 13, "              4) Cancel order   5) Logout", 10, 13, "              Your choice: ","$"
	proceedMsg2		db	"Next step", 10, 13, "              1) Delete item      2) Checkout       3) Cancel order", 10, 13, "              4) Logout", 10, 13, "              Your choice: ","$"
	proceedMsg3		db	10, 13, 10, 13, "              Next step", 10, 13, "              1) Add more", 10, 13, "              2) Cancel order", 10, 13, "              3) Logout", 10, 13, "              Your choice: ","$"
	proceedMsg4		db	"Next step", 10, 13, "               1) Pay", 10, 13, "               2) View previous page", 10, 13, "               3) Cancel order", 10, 13, "               4) Logout", 10, 13, "               Your choice: ","$"
	proceedAns		db	0
	invalidProceed	db	10, 13, "              Invalid choice, choice must be a number 1 to 5.", 10, 13, "              Press any key to continue...", "$"
	invalidProceed2	db	"Invalid choice, choice must be a number 1 to 4$"
	invalidProceed3	db	"Invalid choice, choice must be a number 1 to 3$"
	cancelOrderConfirmMsg	db	"Sure to cancel this order? (Y / N) : $"
	stopOrderConfirmMsg		db	"Sure to stop taking order? (Y / N) : $"
	confirmGoToDiscountMsg	db	"Sure to checkout? (Y / N) : $"
	
	orderIndex		dw	?, "$"
	dispColName		db	"No. Item Ordered               Price(RM)    Quantity            ", 10, 13, "$"
	dispColName2	db	"No. Item Ordered               Price(RM)    Quantity    Amount(RM)", 10, 13, "$"
	noOrdersMsg		db  "There are no orders to be displayed.", "$"
	elevenSpace		db	"          $"

	getDeleteItemMsg	db	"Enter item number to delete: ", "$"
	confirmDeleteMsg	db	"Sure to delete? (Y/N): ", "$"
	delConfirm		db	?
	invalidDelMsg	db	"Invalid choice, enter only item number in the list.$"
	
	itemToDelete		label	byte
	itemToDelete_max	db		2
	itemToDelete_act	db		?
	itemToDelete_buf	db  	2 dup (?), "$"
	
	orderCartTitle		db	"Order Cart$"
	
	;userChoice		label	byte
	;userChoice_max	db		2
	;userChoice_act	db		?
	;userChoice_buf	db  	2 dup (?), "$"
	
	;#####################
	;### discount data ###
	discountTitle		db		"Discount$"
	temp				db		"?"
	RM 					db		"RM$"
	PROMPTDISCOUNT		db		"Apply discount code? (Y / N): $"
	PROMPTCODE			db		"Enter discount code : $"

	LABELDISCOUNTED 	db 		"Discounted value         : $"
	discountIsApplied	db		"Discount code is applied successfully$"

	INVALIDCODE			db		"Invalid discount code entered..." ,13,10 ,13,10, "$"
	INVALIDY&N 			db		"Invalid selection entered..." ,13,10 ,13,10, "$"
	TERMSNOTMET			db		"Minimum order amount not met..." ,13,10 ,13,10, "$"
		
	appliedcode			label	byte
	appliedcode_max 	db 		7
	appliedcode_actual 	db 		?
	appliedcode_space 	db 		7 dup(' ')
		
	validDiscCode 		db 		6 dup (?), "$"
	minorderamount 		db		2 dup (?),  "$"				
	discountpercent 	db 		0
	quo					db		?
	rem					db		?
	afterdiscQuo		dw		0
	afterdiscRem		dw 		0
	
	actMinAmountValue 	db 		?
	
	discounttotal		db		5 dup(?) 							;RM XXX.XX
	discountvalue		db 		4 dup(?)							;RM XX.XX
	
	;*** File Reading ***
	discountfileName 	db 		"discount.txt", "$"
	discountfileHandler dw 		?
	discountcolNum		dw 		0
	numOfDiscount 		db 		0
	TEN					DB 		10									;XX
	
	
	;####################
	;### summary data ###
	HUNDRED			db	100
	HUNDREDword		dw	100
	FIVEPerc		dw	5
	totalTaxPerc	dw	105
	
	taxFrontQuo		db	0
	taxFrontRem		db 	0
	taxBackQuo		db	0
	taxBackRem		db	0
	
	gtQuo			dw	0
	gtRem			dw 	0
	
	taxValue		db  4 dup (?)
	afterTaxValue	db  5 dup (?)
	subTotalValue	db  3 dup ("0")
	
	subtotalmsg		db	"Subtotal         : RM $"			; massage for subtotal
	taxMsg			db	"Tax 5%           : RM  $"				; massage for SST tax
	grandTotalMsg	db	"Grand Total      : RM $"			; massage for grand total
	
	discCodeMsg		db	"Discount  Code   : $"			; massage for discount code
	discPercentMsg	db	"Discount  Perc   : $"	; massage for discount percentage
	discamountMsg	db	"Discount Amount  : RM  $"		; massage for discount amount
	amtafterdiscMsg	db	"After  Discount  : RM $"	; massage for after discount amount
	
	summaryTitle	db	"Order Summary", 10, 13 , "$"	
	datemsg			db	"Date: $"					; massage for date
	timemsg			db	"                              Time: $"					; massage for time
	staffnamemsg	db	"Staff Name: $"				; massage for staff name
	
	payConfirmMsg	db	"Sure to pay? (Y / N) : $"
	
	;####################
	;### payment data ###
	paymentTitle	db	" Payment$"
	paymentOptMenu1	db 	"     < Payment Option >",13,10,"                             1) Cash",13,10,"                             2) Credit / Debit Card$"
	paymentOptMenu2	db 	13,10,"                             3) Online Payment",13,10,"                             4) Cancel Payment$"
	paymentOpt		db 	"Please enter choice: $"
	invalidMsg		db 	"Invalid choice, choice must be number 1 to 4$"
	
	gttlQuo			dw ?
	gttlRem			dw ?
	paidAmt			dw ?
	paidAmtSen		dw ?
	correctInMsg	db "Confirm amount entered (Y / N): $"
	
	change			dw ?
	quotient		db ?
	valuer			db ?
	valuer2			db ?
	changeMsg	 	db "Change           : RM $"
	notenufMsg		db "Amount not enough !!!",13,10,"               Lack of          : RM  ","$"
	grandTotalMsg2	db	"Grand Total      : RM$"		
	
	errorinputMsg	db "Invalid input.$"
	againinput		db ?
	
	cashPay		 	db "Enter amount of cash paid: RM $"
	cardPay		 	db "Please swipe card.$"
	onlinePay		db "Please scan barcode.$"
	trymsg			db "Payment Failed. Please try again.", 10, 13, "               Press any key to continue...", "$"
	
 	processMsg	 	db "Processing Payment.Please wait....",13,10,"$"
	
 	confirmMsg	 	db "Is the payment successful? (Y / N):  $"
 	paysuccess		 	db ?
 	successMsg	 	db "Payment Successful ! $"
	
 	continue		db ?
 	continueMsg	 	db "Continue for the next order? (Y / N): $"
	
	enufnot			db ?
	sen				db ?
	cnt 			db 0
	
	paymentsummaryTitle		db 	"Payment Summary$"

;_________________________________________________________
.code
	main proc far
	mov ax, @data
	mov ds, ax

starting:
	mov filehandler, 0
	mov ah, 3dh					;open file
	mov al, 0
	lea dx, fileName
	int 21h
	mov filehandler, ax
	
	MOV	AX , 0600H			; screen clearing + set the background to white and font to black
	MOV	BH , 70H							
	MOV	CX , 0000H
	MOV	DX , 184FH
	INT	10H
	
	MOV	AX , 0600H			; screen clearing + set the top 3 rows to cyan
	MOV	BH , 30H							
	MOV	CX , 0000H
	MOV	DX , 024FH
	INT	10H
	
	MOV	AX , 0600H			; screen clearing + set the bottom 3 rows to cyan
	MOV	BH , 30H							
	MOV	CX , 1600H
	MOV	DX , 184FH
	INT	10H
	
	MOV	AH , 02H								; set the cursor position
	MOV	BH , 00
	MOV	DH , 07
	MOV	DL , 30
	INT	10H
		
	MOV AH, 09H			
	LEA DX, businessName	;print ippudo title
	INT 21H			

	MOV	AH , 02H								; set the cursor position
	MOV	BH , 00
	MOV	DH , 08
	MOV	DL , 20
	INT	10H
		
	MOV AH, 09H			
	LEA DX, underline	;print line
	INT 21H			

	MOV AH, 09H				
	LEA DX, newline			;newline
	INT 21H					
	
showMenu:
	MOV	AH , 02H								; set the cursor position
	MOV	BH , 00
	MOV	DH , 10
	MOV	DL , 21
	INT	10H
	
	MOV AH, 09H				
	LEA DX, mainMenuTitle 		;print mainmenu options
	INT 21H			

	MOV	AH , 02H								; set the cursor position
	MOV	BH , 00
	MOV	DH , 11
	MOV	DL , 21
	INT	10H
	
	MOV AH, 09H				
	LEA DX, mainMenu1 		;print mainmenu options
	INT 21H			
	
	MOV	AH , 02H								; set the cursor position
	MOV	BH , 00
	MOV	DH , 12
	MOV	DL , 21
	INT	10H
	
	MOV AH, 09H				
	LEA DX, mainMenu2 		;print mainmenu options
	INT 21H			
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 13
	MOV	DL , 21
	INT	10H

	MOV AH, 09H				
	LEA DX, promptChoice	;prompt choice	
	INT 21H					

	MOV	AH , 0AH			;get choice
	LEA	DX , userChoice
	INT	 21H
	
	.386							;tell computer want to use advanced CPU instructions
	MOVZX   BX , userChoice_act		;move zero extension from actual to bx
	MOV	userChoice_buf[BX] , '$'

check:
	CMP userChoice_buf, "2"
	JE	confirmtoexit
	ja	error

	CMP userChoice_buf, "1"
	JE	jumptologin
	jb	error

error:
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 15
	MOV	DL , 21
	INT	10H
	
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
	MOV	BH , 74H							
	MOV	CX , 0F14H
	MOV	DX , 0F38H
	INT	10H
	
	MOV AH, 09H				
	LEA DX, errorMsg		;display errorMsg	
	INT 21H					

	MOV AH, 09H			
	LEA DX, newline			;newline
	INT 21H					

	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 16
	MOV	DL , 21
	INT	10H

	MOV AH, 09H				
	LEA DX, anyKey		;display anyKey	
	INT 21H	

	MOV AH, 01H				
	INT 21H		
	
	jmp starting
	
jumptologin:
	jmp login

jumptoexit:
	jmp exit
	
jumptostarting:
	jmp starting
	
confirmtoexit:
	MOV	AX , 0600H								; screen clearing + set the background to white and foreground to green
	MOV	BH , 70H							
	MOV	CX , 0F15H
	MOV	DX , 1237H
	INT	10H
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 15
	MOV	DL , 21
	INT	10H
	
	MOV AH, 09H				
	LEA DX, confirmExitMsg		;display errorMsg	
	INT 21H		
	
	MOV	AH , 0AH			;get choice
	LEA	DX , userChoice
	INT	 21H
	
	.386							;tell computer want to use advanced CPU instructions
	MOVZX   BX , userChoice_act		;move zero extension from actual to bx
	MOV	userChoice_buf[BX] , '$'
	
	;check is yes or no
	mov al, userChoice_buf		;if yes, exit
	cmp al, "y"
	je	jumptoexit

	mov al, userChoice_buf	
	cmp al, "Y"
	je	jumptoexit

	mov al, userChoice_buf		;if no, go back to mainmenu
	cmp al, "n"
	je	jumptostarting

	mov al, userChoice_buf	
	cmp al, "N"
	je	jumptostarting

	;if not y or n, print invalidYesNo msg and reprompt
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 17
	MOV	DL , 21
	INT	10H
	
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
	MOV	BH , 74H							
	MOV	CX , 1115H
	MOV	DX , 1138H
	INT	10H
	
	MOV AH, 09H				
	LEA DX, invalidYesNo	;print invalidYesNo msg 		
	INT 21H		
	MOV AH, 09H		
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 18
	MOV	DL , 21
	INT	10H

	MOV AH, 09H				
	LEA DX, anyKey		;display anyKey	
	INT 21H		
	
	MOV AH, 01H				
	INT 21H		
	
	jmp confirmtoexit
	
login:	
	mov noOfAttempts, 0
	mov cx, 6
loopclearidpw:
	mov si, 0
	mov staffPW[si], 0
	inc si
	loop loopclearidpw
	
getIDPW:
	MOV	AX , 0600H				; screen clearing + set the background to white and foreground to green
	MOV	BH , 70H							
	MOV	CX , 0000H
	MOV	DX , 184FH
	INT	10H
		
	MOV	AH , 02H			; set the cursor position
	MOV	BH , 00
	MOV	DH , 01
	MOV	DL , 33
	INT	10H
	
	MOV AH, 09H			
	LEA DX, titleLogin	;print staff login title
	INT 21H		
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 03
	MOV	DL , 21
	INT	10H
	
	MOV AH, 09H			
	LEA DX, promptStaffID 	;set prompt staffID
	INT 21H	

	MOV AH, 0AH	
	LEA DX, staffID	
	INT 21H		
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 04
	MOV	DL , 21
	INT	10H
	
	MOV AH, 09H			
	LEA DX, promptstaffPW 	;prompt password
	INT 21H	

	mov si, 0H
	mov pwCharCounter, 0
	
password:
	mov ah, 07h
	int 21h
	
	cmp al,0dh				;if char entered is 'enter'
	je checklogin
	;je dispEntered
	
	inc pwCharCounter
	cmp pwCharCounter, 6
	ja printAst
	
	mov [staffPW+si],al
	inc si
	
printAst:
	mov dl, '*'
	mov ah,2
	int 21h
	jmp password


;=================================
checklogin:
	mov colNum, 0
	mov numOfEmp, 0

file:
	cmp numOfEmp, 10
	jae jumptounsuccess
	
	mov ah, 42h          ;SERVICE FOR SEEK.
	mov al, 0            ;START FROM THE BEGINNING OF FILE.
	mov bx, filehandler  ;FILE.
	mov cx, 0            ;THE FILE POSITION MUST BE PLACED IN
	mov dx, colNum          ;CX:DX, EXAMPLE, TO JUMP TO POSITION
	int 21h 
	
	mov ah, 3fh          ;SERVICE TO READ FROM FILE.
    mov bx, filehandler
    mov cx, 6            ;HOW MANY BYTES TO READ.
    lea dx, validID       ;WHERE TO STORE THE READ BYTES.  
    int 21h
	add colNum, 6h
	
	mov ah, 42h          ;SERVICE FOR SEEK.
	mov al, 0            ;START FROM THE BEGINNING OF FILE.
	mov bx, filehandler  ;FILE.
	mov cx, 0            ;THE FILE POSITION MUST BE PLACED IN
	mov dx, colNum          ;CX:DX, EXAMPLE, TO JUMP TO POSITION
	int 21h 
	
	mov ah, 3fh          ;SERVICE TO READ FROM FILE.
    mov bx, filehandler
    mov cx, 6            ;HOW MANY BYTES TO READ.
    lea dx, validPW      ;WHERE TO STORE THE READ BYTES.  
    int 21h
	add colNum, 6h
	
	mov ah, 42h          ;SERVICE FOR SEEK.
	mov al, 0            ;START FROM THE BEGINNING OF FILE.
	mov bx, filehandler  ;FILE.
	mov cx, 0            ;THE FILE POSITION MUST BE PLACED IN
	mov dx, colNum          ;CX:DX, EXAMPLE, TO JUMP TO POSITION
	int 21h 
	
	mov ah, 3fh          ;SERVICE TO READ FROM FILE.
    mov bx, filehandler
    mov cx, 10            ;HOW MANY BYTES TO READ.
    lea dx, empName      ;WHERE TO STORE THE READ BYTES.  
    int 21h
	add colNum, 10
	
	inc numOfEmp
	jmp checkid
	
jumptounsuccess:
	jmp unsuccess

;=================================
checkid:
	MOV SI, OFFSET [staffid+2] 		;point to the entered staffid array
  	MOV DI, OFFSET validID			;point to the valid staffid array

ckid: 
  	MOV DH, [DI]				;check whether is the end of the valid staffid
  	CMP DH, '$'
  	JE  checkpw                	;if reached the end and all char matches, go to check password

 	MOV DL, [SI]          		;check whether entered staffid reached the end of string
 	CMP DL, 13
 	JE  unsuccess               

	  
 	CMP DL, DH					;compare current char of valid staffid and current char of entered staffid
 	jne jumptofile              	;if diff, jump to unsuccess
 	INC SI                		;else if same, inc SI and DI register to get next char in the strings
 	INC DI                		
 	JMP CKid                	;repeat ckid to check next char in the staffid strings

checkpw:
	MOV SI, OFFSET [staffpw] 			;point to the entered staffpw array
  	MOV DI, OFFSET validpw				;point to the valid staffpw array
		
	cmp pwCharCounter, 6
	ja unsuccess
	cmp pwCharCounter, 6
	jb unsuccess

ckpw: 
  	MOV DH, [DI]				;check whether is the end of the valid staffpw
  	CMP DH, '$'
  	JE  success                	;if reached the end and all char matches, go to success

 	MOV DL, [SI]          		;check whether entered staffpw reached the end of string
 	CMP DL, 13
 	JE  unsuccess               

 	CMP DL, DH					;compare current char of valid staffid and current char of entered staffid
 	jne unsuccess              	;if diff, jump to unsuccess
 	INC SI                		;else if same, inc SI and DI register to get next char in the strings
 	INC DI               
 	JMP CKpw                	;repeat ckpw to check next char in the password strings
	
jumptofile:
	jmp file
;====================================

;====================================
	success:
	mov ah, 3eh          			;close employee file
	mov bx, filehandler  
	int 21h
	
	MOV	AH , 02H				; set position of cursor 
	MOV	BH , 00
	MOV	DH , 06
	MOV	DL , 21
	INT	10H
	
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
	MOV	BH , 71H							
	MOV	CX , 0600H
	MOV	DX , 064FH
	INT	10H
	
	MOV AH, 09H					;display sucessful message
	LEA DX, successfulmsg	
	INT 21H			

	MOV	AH , 02H				; set position of cursor 
	MOV	BH , 00
	MOV	DH , 08
	MOV	DL , 21
	INT	10H
	
	MOV AH, 09H					;display sucessful message
	LEA DX, welcomeMsg	
	INT 21H			
	
	MOV AH, 09H					;display empName
	LEA DX, empName	
	INT 21H		
	
	MOV	AH , 02H				; set position of cursor 
	MOV	BH , 00
	MOV	DH , 11
	MOV	DL , 21
	INT	10H
	
	MOV AH, 09H				
	LEA DX, anyKey		;display anyKey	
	INT 21H	
	
	mov ah, 01h
	int 21h

	MOV AH, 09H		
	LEA DX, newline				;go to food menu
	INT 21H						
	jmp foodmenu	
;====================================



;====================================
	unsuccess:					;if incorrect staffid or staffpw, increase the number of attempts
	mov al, noOfAttempts
	add al, 1
	mov noOfAttempts, al

	mov al, noOfAttempts		;check whether number of attempts is more than or equal to 3
	cmp al, 3
	jae	special					;if so, move back to main menu
	
	MOV	AH , 02H				; set position of cursor 
	MOV	BH , 00
	MOV	DH , 06
	MOV	DL , 21
	INT	10H
	
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
	MOV	BH , 74H							
	MOV	CX , 0600H
	MOV	DX , 064FH
	INT	10H

	MOV AH, 09H					
	LEA DX, unsuccessfulMsg		;display unsuccessfulmsg	
	INT 21H		
	
	MOV	AH , 02H				; set position of cursor 
	MOV	BH , 00
	MOV	DH , 07
	MOV	DL , 21
	INT	10H
	
	MOV AH, 09H				
	LEA DX, anyKey		;display anyKey	
	INT 21H	
	
	mov ah, 01h
	int 21h

	jmp getIDPW					;get id and pw again
;====================================


;====================================
	special:					;for when too many error login
	MOV	AX , 0600H				; screen clearing + set blinking to on + set the background to white and foreground to red
	MOV	BH , 11110100B						
	MOV	CX , 0600H
	MOV	DX , 064FH
	INT	10H
	
	MOV	AH , 02H				; set position of cursor 
	MOV	BH , 00
	MOV	DH , 06
	MOV	DL , 33
	INT	10H
	
	MOV AH, 09H					;display too many error logins message
	LEA DX, warningMsg	
	INT 21H		
	
	MOV	AH , 02H				; set position of cursor 
	MOV	BH , 00
	MOV	DH , 08
	MOV	DL , 10
	INT	10H
	
	MOV AH, 09H					;display too many error logins message
	LEA DX, specialMsg	
	INT 21H		

	MOV	AH , 02H				; set position of cursor 
	MOV	BH , 00
	MOV	DH , 09
	MOV	DL , 10
	INT	10H	
	
	MOV AH, 09H				
	LEA DX, anyKey		;display anyKey	
	INT 21H	
	
	mov ah, 01h
	int 21h
	
	jmp starting					;go back to main menu
;====================================




;===========================
foodmenu:
	mov index, 0			;set all var to 0
	mov	subtotal, 0
	mov totalqty, 0
	mov	overby, 0
	mov oriqty, 0
	mov quo, 0
	mov rem, 0
	mov afterdiscQuo, 0
	mov afterdiscRem, 0
	mov taxFrontQuo, 0
	mov taxFrontRem, 0
	mov taxBackQuo, 0
	mov taxBackRem, 0
	mov gtQuo, 0
	mov gtRem, 0
	
	mov cx, 10
loopclear:
	mov si, 0
	mov choice[si], 0
	mov qty[si], 0
	shl si, 1
	mov pricingQty[si], 0
	shr si, 1
	inc si
	loop loopclear
	
	mov discountpercent, 0
	mov cx, 6
loopclearvaliddiscCode:
	mov si, 0
	mov validDiscCode[si], 0
	inc si
	loop loopclearvaliddiscCode
	mov minorderamount[0], 0
	mov minorderamount[1], 0
	
;===========================
	
	

;===========================
listmenu:	
	MOV	AX , 0600H				; screen clearing + set the background to white and font to black
	MOV	BH , 70H							
	MOV	CX , 0000H
	MOV	DX , 184FH
	INT	10H
		
	MOV	AH , 02H			; set the cursor position
	MOV	BH , 00
	MOV	DH , 01
	MOV	DL , 34
	INT	10H

	MOV AH, 09H			
	LEA DX, titleMenu		;print food menu title
	INT 21H		
	
	MOV	AX , 0600H				; screen clearing +  set the background to white and font to black
	MOV	BH , 70H					
	MOV	CX , 0300H
	MOV	DX , 184FH
	INT	10H
	
	MOV	AX , 0600H				; screen clearing +  set the background to black and font to white
	MOV	BH , 00001111B				
	MOV	CX , 0312H
	MOV	DX , 033BH
	INT	10H
	
	MOV	AX , 0600H				; screen clearing +  set the background to purple and font to purple
	MOV	BH , 01010000B				
	MOV	CX , 0412H
	MOV	DX , 083BH
	INT	10H
	
	MOV	AH , 02H			; set the cursor position
	MOV	BH , 00
	MOV	DH , 03
	MOV	DL , 19
	INT	10H
	
	MOV AH, 09H			
	LEA DX, menuline1			;print menulist1
	INT 21H	
	
	MOV	AH , 02H			; set the cursor position
	MOV	BH , 00
	MOV	DH , 04
	MOV	DL , 19
	INT	10H
	
	MOV AH, 09H			
	LEA DX, menuline2			;print menulist2
	INT 21H	
	
	MOV	AH , 02H			; set the cursor position
	MOV	BH , 00
	MOV	DH , 05
	MOV	DL , 19
	INT	10H
	
	MOV AH, 09H			
	LEA DX, menuline3			;print menulist3
	INT 21H	
	
	MOV	AH , 02H			; set the cursor position
	MOV	BH , 00
	MOV	DH , 06
	MOV	DL , 19
	INT	10H
	
	MOV AH, 09H			
	LEA DX, menuline4			;print menulist1
	INT 21H	
	
	MOV	AH , 02H			; set the cursor position
	MOV	BH , 00
	MOV	DH , 07
	MOV	DL , 19
	INT	10H
	
	MOV AH, 09H			
	LEA DX, menuline5			;print menulist2
	INT 21H	
	
	MOV	AH , 02H			; set the cursor position
	MOV	BH , 00
	MOV	DH , 08
	MOV	DL , 19
	INT	10H
	
	MOV AH, 09H			
	LEA DX, menuline6			;print menulist3
	INT 21H	
	
	MOV	AH , 02H			; set the cursor position
	MOV	BH , 00
	MOV	DH , 10
	MOV	DL , 19
	INT	10H
	
	MOV	AX , 0600H				; screen clearing +  set the background to black and font to white
	MOV	BH , 00001111B				
	MOV	CX , 0A12H
	MOV	DX , 0A3BH
	INT	10H
	
	MOV	AX , 0600H				; screen clearing +  set the background to purple and font to black
	MOV	BH , 01010000B				
	MOV	CX , 0B12H
	MOV	DX , 0D3BH
	INT	10H
	
	MOV AH, 09H			
	LEA DX, menuline7			;print menulist3
	INT 21H	
	
	MOV	AH , 02H			; set the cursor position
	MOV	BH , 00
	MOV	DH , 12
	MOV	DL , 19
	INT	10H
	
	MOV AH, 09H			
	LEA DX, menuline8			;print menulist3
	INT 21H	
	
	MOV	AH , 02H			; set the cursor position
	MOV	BH , 00
	MOV	DH , 15
	MOV	DL , 09
	INT	10H
	
	MOV AH, 09H			
	LEA DX, noteline1				;print note
	INT 21H	
	
	MOV	AH , 02H			; set the cursor position
	MOV	BH , 00
	MOV	DH , 16
	MOV	DL , 13
	INT	10H
	
	MOV AH, 09H			
	LEA DX, noteline2				;print note
	INT 21H	
;===========================
	


;===========================
getChoice:
	MOV	AH , 02H			; set the cursor position
	MOV	BH , 00
	MOV	DH , 18
	MOV	DL , 15
	INT	10H
	
	MOV AH, 09H			
	LEA DX, promptchoice  	;prompt for choice
	INT 21H	
	
	MOV	AH , 02H			; set the cursor position
	MOV	BH , 00
	MOV	DH , 18
	MOV	DL , 55
	INT	10H
	
	MOV AH, 09H			
	LEA DX, zerotoexit  	;prompt for choice
	INT 21H	

	mov	si, index
	
	MOV	AH , 02H			; set the cursor position
	MOV	BH , 00
	MOV	DH , 18
	MOV	DL , 38
	INT	10H
	
	MOV	AH , 0AH			;get choice
	LEA	DX , userChoice
	INT	 21H
	
	.386							;tell computer want to use advanced CPU instructions
	MOVZX   BX , userChoice_act		;move zero extension from actual to bx
	MOV	userChoice_buf[BX] , '$'
	
	;validate choice
	mov al, userChoice_buf
	cmp al, 30H
	jb reenterChoice
	cmp al, 38H
	ja reenterChoice
	cmp al, 30H
	je	jumptochecking4
	
	mov	[choice+si], al	
	jmp getQty
	
reenterChoice:	
	MOV	AH , 02H			; set the cursor position
	MOV	BH , 00
	MOV	DH , 20
	MOV	DL , 15
	INT	10H
	
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
	MOV	BH , 74H							
	MOV	CX , 1400H
	MOV	DX , 144FH
	INT	10H
	
	mov ah, 09H				;print invalid choice msg
	lea dx, invalidChoice
	int 21h
	
	MOV	AH , 02H				; set position of cursor 
	MOV	BH , 00
	MOV	DH , 21
	MOV	DL , 15
	INT	10H	
	
	MOV AH, 09H				
	LEA DX, anyKey		;display anyKey	
	INT 21H	
	
	mov ah, 01h
	int 21h
	
	MOV	AX , 0600H				; screen clearing + set the background to white and font to black
	MOV	BH , 70H							
	MOV	CX , 1200H
	MOV	DX , 184FH
	INT	10H
	
	jmp getChoice
;===========================



;===========================
getQty:
	MOV	AH , 02H			; set the cursor position
	MOV	BH , 00
	MOV	DH , 19
	MOV	DL , 15
	INT	10H
	
	MOV AH, 09H			
	LEA DX, promptQty 		;prompt quantity
	INT 21H	

	MOV	AH , 0AH			;get choice
	LEA	DX , userChoice
	INT	 21H
	
	.386							;tell computer want to use advanced CPU instructions
	MOVZX   BX , userChoice_act		;move zero extension from actual to bx
	MOV	userChoice_buf[BX] , '$'
	
	; validate qty
	mov al, userChoice_buf
	cmp al, 31H
	jb reenterQty
	cmp al, 39H
	ja reenterQty
	
	sub al, 48				;minus 30H to get actual value
	mov bl, totalQty
	mov oriqty, bl
	add	totalQty, al
	mov dl, 14H
	cmp totalQty, dl		;if add up entered qty become too much, 
	jg 	jmptotoomany				;show too many message, prompt to reenter
	
	add al, 48				;if not more than 9 qty, can add and inc index
	mov	[qty+si], al
	inc si
	mov index, si

	MOV AH, 09H		
	LEA DX, newline			;newline
	INT 21H	
	jmp	calc	
	
	jmptotoomany:			;too far so use this
	jmp toomany
	
reenterQty:
	MOV	AH , 02H			; set the cursor position
	MOV	BH , 00
	MOV	DH , 21
	MOV	DL , 15
	INT	10H
	
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
	MOV	BH , 74H							
	MOV	CX , 1500H
	MOV	DX , 154FH
	INT	10H
	
	mov ah, 09H				;print invalid qty msg
	lea dx, invalidQty
	int 21h
	
	MOV	AH , 02H				; set position of cursor 
	MOV	BH , 00
	MOV	DH , 22
	MOV	DL , 15
	INT	10H	
	
	MOV AH, 09H				
	LEA DX, anyKey		;display anyKey	
	INT 21H	
	
	mov ah, 01h
	int 21h
	
	MOV	AX , 0600H				; screen clearing + set the background to white and font to black
	MOV	BH , 70H							
	MOV	CX , 1300H
	MOV	DX , 184FH
	INT	10H
	
	jmp getQty
;===========================
jumptochecking4:
	jmp checking

	
	
;===========================
toomany:				;display message when qty exceed 20
	MOV	AX , 0600H		; screen clearing + set the background to white and foreground to green
	MOV	BH , 70H							
	MOV	CX , 0000H
	MOV	DX , 184FH
	INT	10H
	
	MOV	AX , 0600H				; screen clearing + set blinking to on + set the background to white and foreground to red
	MOV	BH , 11110100B						
	MOV	CX , 0700H
	MOV	DX , 074FH
	INT	10H
	
	MOV	AH , 02H				; set position of cursor 
	MOV	BH , 00
	MOV	DH , 07
	MOV	DL , 33
	INT	10H
	
	MOV AH, 09H					;display too many error logins message
	LEA DX, warningMsg	
	INT 21H		
		
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 09
	MOV	DL , 20
	INT	10H
	
	MOV AH, 09H			
	LEA DX, toomanyMsg 		
	INT 21H	
	
	mov bl, 14h
	sub bl, oriqty
	MOV AH, 02H	
	add bl, 48	
	mov Dl, bl 	
	INT 21H					;display how many more qty can be ordered
	mov al, totalQty
	sub al, oriqty
	mov bl, al
	sub totalQty, bl		;minus latest qty from the totalQty
	
	MOV AH, 09H			
	LEA DX, newline			;newline
	INT 21H					

	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 14
	MOV	DL , 24
	INT	10H

	MOV AH, 09H				
	LEA DX, anyKey		;display anyKey	
	INT 21H	

	MOV AH, 01H				
	INT 21H		
	
	jmp calc				;if want to continue order, go to menu, if not go to output
;===========================



;===========================
calc:					;calc itemprice * qty and store in pricingQty array 
	mov si, index
	sub si, 1
	mov	dl, [choice+si]
	mov	cl, [qty+si]
	sub cl, 48
	sub dl, 1
	sub dl, 48
	mov dh, 0
	mov si, dx
	mov al, [pricing+si]
	mul cl 
	mov si, index
	sub si, 1
	shl si, 1
	mov ah, 0
	mov [pricingqty+si], ax
	
	mov ax, [pricingqty+si]  ;prepare 1st digit for display
	mov bl, 100
	div bl
	
	cmp al, 00h  			;determine whether 3 digits
	je twod					;if only 2 digits, go to twod to display only 2 digits
	
	MOV AH, 02H	
	add al,48	
	mov Dl, al 				;display 3rd digit
	;INT 21H	
	mov thirddigit,al	
	
	sub al, 48   			;prepare 2nd digit for display
	mov bl, 100
	mul bl
	mov bx, [pricingqty+si]
	mov ah, 00
	sub bx, ax
	mov ax, bx
	mov bl, 10
	div bl
	
	MOV AH, 02H	
	add al,48	
	mov Dl, al 				;display 2nd digit
	;INT 21H		
	mov scdigit, al
	
	sub al, 48    			;prepare 1st digit for display
	mov bl, 10
	mul bl
	mov bx, [pricingqty+si]
	mov ah, 00
	sub bx, ax
	mov al, thirddigit
	sub al, 48
	mov cl, 100
	mul cl
	mov ah, 00
	sub bx, ax
	
	MOV AH, 02H	
	add bl, 48	
	mov Dl, bl 				;display 3rd digit
	;INT 21H	
	
	;mov dl, 14H				;if qty = 20 already, display qty = 20 message
	;cmp totalQty, dl		;and stop ordering
	;jge	equaltwenty
	
	jmp jumptochecking		;else ask whether to continue order
	
jumptochecking:
	jmp checking
	
twod:						;prepare to display 2 digits
	mov ax, [pricingqty+si]	;prepare to display 2nd digit
	mov ah, 00
	mov bl, 10
	div bl
	
	MOV AH, 02H	
	add al, 48	
	mov Dl, al 				;display 2nd digit
	;INT 21H	
	
	sub al, 48   			;prepare to display 1st digit
	mov bl, 10
	mul bl
	mov bx, [pricingqty+si]
	mov ah, 00h
	sub bx, ax
	mov ax, bx
	
	MOV AH, 02H	
	add al, 48	
	mov Dl, al 				;display 1st digit
	;INT 21H	
	
	;mov dl, 14H				;if qty = 9 already, display qty = 9 message, stop 
	;cmp totalQty, dl		;and stop ordering
	;jge	equaltwenty
	
	jmp checking				;else ask whether to continue order
	
equalTwenty:
	MOV AH, 09H			
	LEA DX, equalnineMsg 	;prompt qty = 9 message and stop ordering, go to next step
	INT 21H	
	jmp checking
;===========================



	
	
;===========================
checking:				;display order summary to check
	MOV	AX , 0600H				; screen clearing + set the background to white and font to black
	MOV	BH , 70H					
	MOV	CX , 0000H
	MOV	DX , 184FH
	INT	10H
	
	MOV	AH , 02H			; set the cursor position
	MOV	BH , 00
	MOV	DH , 01
	MOV	DL , 35
	INT	10H
	
	MOV AH, 09H				
	lea Dx, orderCartTitle 	;display order cart title	
	INT 21H	
		
	MOV	AH , 02H			; set the cursor position
	MOV	BH , 00
	MOV	DH , 03
	MOV	DL , 14
	INT	10H
	
	mov	bl, [choice]
	add bl, 48
	cmp bl, "0"
	je	noOrders
	
	MOV	AX , 0600H			; screen clearing + set the column name row on top of table background to black and font to white
	MOV	BH , 00001111B								
	MOV	CX , 030CH
	MOV	DX , 0342H
	INT	10H
	
	MOV AH, 09H				
	lea Dx, dispColName 	;display column name	
	INT 21H	
	
	MOV	AX , 0600H			; screen clearing + set table background to cyan and font to black
	MOV	BH , 00110000B								
	MOV	CX , 040CH
	MOV	DX , 0D42H
	INT	10H
	
displayOrdered:			;set index for looping
	;mov cx, index
	mov si, 0
	
	;mov	bl, [choice+si]
	;add bl, 48
	;cmp bl, "0"
	;je	noOrders
	
loopDisplayOrdered:
	mov cx, si
	add cl, 4
	
	MOV	AH , 02H			; set the cursor position
	MOV	BH , 00
	MOV	DH , cl
	MOV	DL , 14
	INT	10H
	
	cmp si, index
	jb  dispThings
	MOV AH, 02H	
	mov Dl, "-" 			;display -
	INT 21H	
	
	MOV AH, 09H		
	LEA DX, newline			;newline
	INT 21H	
	
	jmp determineLoopOrNot

dispThings:	
	inc si
	MOV AH, 09H	
	mov	orderIndex, si
	add orderIndex, 48
	lea Dx, orderIndex 	;display index no
	INT 21H	
	
	dec si
	mov	bl, [choice+si]
	
	cmp bl, "1"
	je dispChickenRamen
	cmp bl, "2"
	je dispBeefRamen
	cmp bl, "3"
	je dispPorkRamen
	cmp bl, "4"
	je dispSeafoodRamen
	cmp bl, "5"
	je dispSupremeRamen
	cmp bl, "6"
	je dispJapMelon
	cmp bl, "7"
	je dispCoffeeJelly
	cmp bl, "8"
	je dispMochiIC
	
noOrders:
	MOV AH, 09H				
	lea Dx, noOrdersMsg		
	INT 21H	
	jmp zero
	
dispChickenRamen:
	MOV AH, 09H				
	lea Dx, itemName1		
	INT 21H	
	jmp dispQty
dispBeefRamen:
	MOV AH, 09H				
	lea Dx, itemName2		
	INT 21H	
	jmp dispQty
dispPorkRamen:
	MOV AH, 09H				
	lea Dx, itemName3		
	INT 21H	
	jmp dispQty
dispSeafoodRamen:
	MOV AH, 09H				
	lea Dx, itemName4		
	INT 21H	
	jmp dispQty
dispSupremeRamen:
	MOV AH, 09H				
	lea Dx, itemName5		
	INT 21H	
	jmp dispQty
dispJapMelon:
	MOV AH, 09H				
	lea Dx, itemName6		
	INT 21H	
	jmp dispQty
dispCoffeeJelly:
	MOV AH, 09H				
	lea Dx, itemName7		
	INT 21H	
	jmp dispQty
dispMochiIC:
	MOV AH, 09H				
	lea Dx, itemName8		
	INT 21H	
	jmp dispQty

dispQty:
	MOV AH, 02H				;display ordered item name
	mov Dl, [qty+si] 		
	INT 21H	
	
	MOV AH, 09H		
	LEA DX, newline			;newline
	INT 21H	

determineLoopOrNot:	
	inc si					;check whether there are anymore in the array
	cmp si, 9
	jb jumpToloopDisplayOrdered

	cmp totalQty, 14H
	jge moreThanTwentyChoices
	
	cmp index, 9
	jge moreThanTwentyChoices
	
	cmp totalQty, 0H
	je jumptozero

promptProceedAns:
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to green
	MOV	BH , 70H							
	MOV	CX , 0F00H
	MOV	DX , 184FH
	INT	10H
		
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 15
	MOV	DL , 14
	INT	10H
	
	MOV AH, 09H				;used to check whether to proceed
	lea Dx, proceedMsg1L1 		;if proceed, go to discount
	INT 21H					;if cancel order, go to menu again, clear all var
	
	MOV AH, 09H				
	lea Dx, proceedMsg1L2 		
	INT 21H	
	
	MOV	AH , 0AH			;get choice
	LEA	DX , userChoice
	INT	 21H
	
	.386							;tell computer want to use advanced CPU instructions
	MOVZX   BX , userChoice_act		;move zero extension from actual to bx
	MOV	userChoice_buf[BX] , '$'
	
	MOV AH, 09H		
	LEA DX, newline			;newline
	INT 21H	
	
	cmp userChoice_buf, "1"
	jb	reenterProceedAns
	
	cmp userChoice_buf, "5"
	ja	reenterProceedAns
	
	cmp userChoice_buf, "1"		;valid choice
	je jumptolistmenu
	
	cmp userChoice_buf, "2"
	je jumptodeleteitem
	
	cmp userChoice_buf, "3"
	je jumptodiscountMod
	
	cmp userChoice_buf, "4"
	je cancelOrder
	
	cmp userChoice_buf, "5"
	je stopOrder
	
jumpToloopDisplayOrdered:
	jmp loopDisplayOrdered

reenterProceedAns:
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
	MOV	BH , 74H							
	MOV	CX , 1400H
	MOV	DX , 144FH
	INT	10H
	
	MOV AH, 09H				;display inavlid msg
	lea Dx, invalidProceed 		
	INT 21H	

	MOV AH, 01H				
	INT 21H		
	
	jmp promptProceedAns	
	
jumptolistmenu:
	jmp listMenu
	
jumptodiscountMod:
	jmp discountMod ;output;
	
cancelOrder:
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to green
	MOV	BH , 70H							
	MOV	CX , 1400H
	MOV	DX , 184FH
	INT	10H
		
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 20
	MOV	DL , 14
	INT	10H
	
	MOV AH, 09H				;ask confirmation to cancel order
	lea Dx, cancelOrderConfirmMsg 	
	INT 21H	
	
	MOV	AH , 0AH			;get choice
	LEA	DX , userChoice
	INT	 21H
	
	.386							;tell computer want to use advanced CPU instructions
	MOVZX   BX , userChoice_act		;move zero extension from actual to bx
	MOV	userChoice_buf[BX] , '$'
	
	;check is yes or no
	mov al, userChoice_buf		;if yes, list out menu again
	cmp al, "y"
	je	jumptofoodmenu

	mov al, userChoice_buf	
	cmp al, "Y"
	je	jumptofoodmenu

	mov al, userChoice_buf		;if no, list out short summary
	cmp al, "n"
	je	jumptochecking3

	mov al, userChoice_buf	
	cmp al, "N"
	je	jumptochecking3
	
	;if not y or n, print invalidYesNo msg and reprompt
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 22
	MOV	DL , 14
	INT	10H
	
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
	MOV	BH , 74H							
	MOV	CX , 1600H
	MOV	DX , 164FH
	INT	10H
	
	MOV AH, 09H				
	LEA DX, invalidYesNo	;print invalidYesNo msg 		
	INT 21H		
	MOV AH, 09H		
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 23
	MOV	DL , 14
	INT	10H

	MOV AH, 09H				
	LEA DX, anyKey		;display anyKey	
	INT 21H		
	
	MOV AH, 01H				
	INT 21H		
	jmp cancelOrder
	
jumptochecking3:
	jmp checking

jumptofoodmenu:
	jmp foodmenu
	
jumptodeleteitem:
	jmp deleteItem
	
stopOrder:
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to green
	MOV	BH , 70H							
	MOV	CX , 1400H
	MOV	DX , 184FH
	INT	10H
		
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 20
	MOV	DL , 14
	INT	10H
	
	MOV AH, 09H				;ask confirmation to stop
	lea Dx, stopOrderConfirmMsg 	
	INT 21H	
	
	MOV	AH , 0AH			;get choice
	LEA	DX , userChoice
	INT	 21H
	
	.386							;tell computer want to use advanced CPU instructions
	MOVZX   BX , userChoice_act		;move zero extension from actual to bx
	MOV	userChoice_buf[BX] , '$'
	
	;check is yes or no
	mov al, userChoice_buf		;if yes, list out menu again
	cmp al, "y"
	je	jumptomainmenu

	mov al, userChoice_buf	
	cmp al, "Y"
	je	jumptomainmenu

	mov al, userChoice_buf		;if no, list out short summary
	cmp al, "n"
	je	jumptochecking3

	mov al, userChoice_buf	
	cmp al, "N"
	je	jumptochecking3
	
	;if not y or n, print invalidYesNo msg and reprompt
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 22
	MOV	DL , 14
	INT	10H
	
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
	MOV	BH , 74H							
	MOV	CX , 1600H
	MOV	DX , 164FH
	INT	10H
	
	MOV AH, 09H				
	LEA DX, invalidYesNo	;print invalidYesNo msg 		
	INT 21H		
	MOV AH, 09H		
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 23
	MOV	DL , 14
	INT	10H

	MOV AH, 09H				
	LEA DX, anyKey		;display anyKey	
	INT 21H		
	
	MOV AH, 01H				
	INT 21H		
	jmp stopOrder

jumptozero:
	jmp zero

jumptomainmenu:
	jmp mainmenu
	
moreThanTwentyChoices:
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to green
	MOV	BH , 70H							
	MOV	CX , 0F00H
	MOV	DX , 184FH
	INT	10H
		
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 15
	MOV	DL , 14
	INT	10H
	
	MOV AH, 09H				;used to check whether to proceed
	lea Dx, proceedMsg2 		;if proceed, go to discount
	INT 21H					;if cancel order, go to menu again, clear all var
							;if stop order, go to mainmenu , clear all var
	
	MOV	AH , 0AH			;get choice
	LEA	DX , userChoice
	INT	 21H
	
	.386							;tell computer want to use advanced CPU instructions
	MOVZX   BX , userChoice_act		;move zero extension from actual to bx
	MOV	userChoice_buf[BX] , '$'
	
	MOV AH, 09H		
	LEA DX, newline			;newline
	INT 21H	
	
	cmp userChoice_buf, "1"
	jb	reenterMoreThanTwentyChoices
	
	cmp userChoice_buf, "4"
	ja	reenterMoreThanTwentyChoices
	
	cmp userChoice_buf, "1"		;valid choice
	je deleteItem
	
	cmp userChoice_buf, "2"
	je jumptodiscountMod
	
	cmp userChoice_buf, "3"
	je cancelOrder
	
	cmp userChoice_buf, "4"
	je stopOrder

reenterMoreThanTwentyChoices:
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 20
	MOV	DL , 14
	INT	10H
	
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
	MOV	BH , 74H							
	MOV	CX , 1400H
	MOV	DX , 144FH
	INT	10H
	
	MOV AH, 09H				;display inavlid msg
	lea Dx, invalidProceed2 		
	INT 21H	
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 21
	MOV	DL , 14
	INT	10H

	MOV AH, 09H				
	LEA DX, anyKey		;display anyKey	
	INT 21H	

	MOV AH, 01H				
	INT 21H		
	
	jmp moreThanTwentyChoices	
	
zero:
	MOV AH, 09H				;used to check whether to proceed
	lea Dx, proceedMsg3 		;if proceed, go to discount
	INT 21H					;if cancel order, go to menu again, clear all var
							;if stop order, go to mainmenu , clear all var
	
	MOV	AH , 0AH			;get choice
	LEA	DX , userChoice
	INT	 21H
	
	.386							;tell computer want to use advanced CPU instructions
	MOVZX   BX , userChoice_act		;move zero extension from actual to bx
	MOV	userChoice_buf[BX] , '$'
	
	MOV AH, 09H		
	LEA DX, newline			;newline
	INT 21H	
	
	cmp userChoice_buf, "1"
	jb	reenterZero
	
	cmp userChoice_buf, "3"
	ja	reenterZero
	
	cmp userChoice_buf, "1"		;valid choice
	je jumptolistmenu
	
	cmp userChoice_buf, "2"
	je cancelOrder
	
	cmp userChoice_buf, "3"
	je stopOrder
	
reenterZero:
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
	MOV	BH , 74H							
	MOV	CX , 1400H
	MOV	DX , 144FH
	INT	10H
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 20
	MOV	DL , 14
	INT	10H
	
	MOV AH, 09H				;display inavlid msg
	lea Dx, invalidProceed3 		
	INT 21H	
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 21
	MOV	DL , 14
	INT	10H

	MOV AH, 09H				
	LEA DX, anyKey		;display anyKey	
	INT 21H	

	MOV AH, 01H				
	INT 21H		
	
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
	MOV	BH , 70H							
	MOV	CX , 0400H
	MOV	DX , 184FH
	INT	10H
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 3
	MOV	DL , 0
	INT	10H
	
	jmp zero	


;===========================	



;===========================
deleteItem:
	MOV	AX , 0600H				; screen clearing + set the background to white and foreground to green
	MOV	BH , 70H				
	MOV	CX , 0F00H
	MOV	DX , 184FH
	INT	10H
	
	MOV	AH , 02H				; set position of cursor 
	MOV	BH , 00
	MOV	DH , 15
	MOV	DL , 14
	INT	10H
	
	;prompt item num to delete
	MOV AH, 09H	
	lea Dx, getDeleteItemMsg				
	INT 21H	
	
	MOV	AH , 02H				; set position of cursor 
	MOV	BH , 00
	MOV	DH , 15
	MOV	DL , 55
	INT	10H
	
	;prompt item num to delete
	MOV AH, 09H	
	lea Dx, zerotoexit				
	INT 21H	
	
	MOV	AH , 02H				; set position of cursor 
	MOV	BH , 00
	MOV	DH , 15
	MOV	DL , 43
	INT	10H
	
	MOV	AH , 0AH			;get choice
	LEA	DX , itemToDelete
	INT	 21H
	
	.386							;tell computer want to use advanced CPU instructions
	MOVZX   BX , itemToDelete_act		;move zero extension from actual to bx
	MOV	itemToDelete_buf[BX] , '$'
	
	;validate input
	mov al, itemToDelete_buf
	cmp al, "0"
	je  jumptochecking5
	
	mov al, itemToDelete_buf
	cmp al, "0"
	jb	renterItemToDelete
	
	mov ah, 0
	cmp ax, orderIndex
	ja	renterItemToDelete
	
	jmp confirmToDelete
	
renterItemToDelete:
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 17
	MOV	DL , 14
	INT	10H
	
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
	MOV	BH , 74H							
	MOV	CX , 1100H
	MOV	DX , 114FH
	INT	10H
	
	MOV AH, 09H	
	lea Dx, invalidDelMsg				
	INT 21H	
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 18
	MOV	DL , 14
	INT	10H

	MOV AH, 09H				
	LEA DX, anyKey		;display anyKey	
	INT 21H		
	
	MOV AH, 01H				
	INT 21H		
	
	jmp deleteItem
	
jumptochecking5:
	jmp checking
	
confirmToDelete:
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to green
	MOV	BH , 70H							
	MOV	CX , 1000H
	MOV	DX , 184FH
	INT	10H
	
	MOV	AH , 02H				; set position of cursor 
	MOV	BH , 00
	MOV	DH , 16
	MOV	DL , 14
	INT	10H
	
	mov ah, 09h					;confirm to delete
	lea dx, confirmDeleteMsg
	int 21h
	
	MOV	AH , 0AH			;get choice
	LEA	DX , userChoice
	INT	 21H
	
	.386							;tell computer want to use advanced CPU instructions
	MOVZX   BX , userChoice_act		;move zero extension from actual to bx
	MOV	userChoice_buf[BX] , '$'
	
	MOV AH, 09H		
	LEA DX, newline			;newline
	INT 21H	
	
	;check is yes or no
	mov al, userChoice_buf		;if yes, list out menu again
	cmp al, "y"
	je	proceedDelete

	mov al, userChoice_buf	
	cmp al, "Y"
	je	proceedDelete

	mov al, userChoice_buf		;if no, list out short summary
	cmp al, "n"
	je	jumptochecking2

	mov al, userChoice_buf	
	cmp al, "N"
	je	jumptochecking2

	;if not y or n, print invalidYesNo msg and reprompt
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 18
	MOV	DL , 14
	INT	10H
	
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
	MOV	BH , 74H							
	MOV	CX , 1200H
	MOV	DX , 124FH
	INT	10H
	
	MOV AH, 09H				
	LEA DX, invalidYesNo	;print invalidYesNo msg 		
	INT 21H		
	MOV AH, 09H		
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 19
	MOV	DL , 14
	INT	10H

	MOV AH, 09H				
	LEA DX, anyKey		;display anyKey	
	INT 21H		
	
	MOV AH, 01H				
	INT 21H		
	
	jmp confirmToDelete
	
jumptochecking2:
	jmp checking

proceedDelete:
	mov	al, itemToDelete_buf
	sub al, 1H				;minus 1
	sub al, 48				;chg char to actual value
	mov	itemToDelete_buf, al
	
	;minus 1 from index
	dec index
	
	;set subTotal to 0
	mov subTotal, 0000H
	
	;choice[x], qty[x]  -> choice[x+1]
	mov al, itemToDelete_buf
	mov ah, 00h
	mov si, ax
	
	;minus from total qty
	mov bl, [qty+si]
	sub bl, 48
	sub totalQty, bl
	
	shiftItems:
	inc si
	mov al, [choice+si]
	mov bl, [qty+si]
	mov [choice+si], 0
	mov [qty+si], 0
	shl si, 1
	mov cx, [pricingQty+si]
	mov [pricingQty+si], 0
	shr si, 1
	dec si
	mov [choice+si], al
	mov [qty+si], bl
	shl si, 1
	mov [pricingQty+si], cx
	shr si, 1
	inc si
	
	mov cx, index
	cmp si, cx
	jb shiftItems
	
	jmp checking

discountMod:
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to black
	MOV	BH , 70H							
	MOV	CX , 1400H
	MOV	DX , 184FH
	INT	10H
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 20
	MOV	DL , 14
	INT	10H
	
	mov ah, 09h					;confirm to checkout
	lea dx, confirmGoToDiscountMsg
	int 21h
	
	MOV	AH , 0AH			;get choice
	LEA	DX , userChoice
	INT	 21H
	
	.386							;tell computer want to use advanced CPU instructions
	MOVZX   BX , userChoice_act		;move zero extension from actual to bx
	MOV	userChoice_buf[BX] , '$'
	
	MOV AH, 09H		
	LEA DX, newline			;newline
	INT 21H	
	
	;check is yes or no
	mov al, userChoice_buf		;if yes, list out menu again
	cmp al, "y"
	je	output
	mov al, userChoice_buf	
	cmp al, "Y"
	je	output

	mov al, userChoice_buf		;if no, list out short summary
	cmp al, "n"
	je	jumptochecking2
	mov al, userChoice_buf	
	cmp al, "N"
	je	jumptochecking2

	;if not y or n, print invalidYesNo msg and reprompt
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 22
	MOV	DL , 14
	INT	10H
	
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
	MOV	BH , 74H							
	MOV	CX , 1600H
	MOV	DX , 164FH
	INT	10H
	
	MOV AH, 09H				
	LEA DX, invalidYesNo	;print invalidYesNo msg 		
	INT 21H		
	MOV AH, 09H		
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 23
	MOV	DL , 14
	INT	10H

	MOV AH, 09H				
	LEA DX, anyKey		;display anyKey	
	INT 21H		
	
	MOV AH, 01H				
	INT 21H	
	jmp discountMod
	
mainmenu:
	MOV AH, 02H	
	mov Dl, "m"				
	INT 21H	
	jmp starting
;===========================
	
	
	

;============ discount =============================================================
;===========================	
output:						;prepare index to sum up all price*qty into subtotal
	mov subTotal, 0
	mov dx, index
	mov si, 0
	mov cx, index
	
	MOV AH, 09H		
	LEA DX, newline			;newline
	INT 21H		
	
loopoutput:					;sum up all price*qty into subtotal
	mov	bx, subTotal
	add bx, [pricingqty+si]
	mov subTotal, bx
	
	inc si					;check whether there are anymore in the array
	inc si
	loop loopoutput
	
	mov ax, [subtotal]  	;prepare to display 3rd digit
	mov bl, 100
	div bl
	
	cmp al, 00				;if not 3 digits, move to 2 digits part
	je subtwod
	
	MOV AH, 02H	
	add al, 48	
	mov Dl, al 				;display 3rd digit
	INT 21H	
	mov thirddigit, al	
	mov subTotalValue[0], al
	
	mov ax, 0h
	mov al, thirddigit
	sub al, 48   			;prepare to display 2nd digit
	mov bl, 100
	mul bl
	mov bx, [subtotal]
	sub bx, ax
	mov ax, bx
	mov bl, 10
	div bl
	
	MOV AH, 02H	
	add al, 48	
	mov Dl, al 				;display 2nd digit
	INT 21H		
	mov scdigit, al
	mov subTotalValue[1], al
	
	sub al, 48   			;prepare to display 1st digit
	mov bl, 10
	mul bl
	mov bx, [subtotal]
	mov ah, 00
	sub bx, ax
	mov al, thirddigit
	sub al, 48
	mov cl, 100
	mul cl
	
	sub bx, ax
	
	MOV AH, 02H	
	add bl,48	
	mov Dl, bl 				;display 1st digit
	INT 21H	
	mov subTotalValue[2], bl
	jmp discountModule
	
subtwod:				;prepare to display 2nd digit
	mov ax, [subtotal]
	mov bl, 10
	div bl
	
	MOV AH, 02H	
	add al,48	
	mov Dl, al 				;display 2nd digit
	INT 21H	
	mov subTotalValue[1], al
	
	sub al, 48  				;prepare to display 1st digit
	mov bl, 10
	mul bl
	mov bx, [subtotal]
	mov ah, 00
	sub bx, ax
	mov ax, bx
	
	MOV AH, 02H	
	add al, 48	
	mov Dl, al 				;display 1st digit
	INT 21H	
	mov subTotalValue[2], al
	mov subTotalValue[0], 20h
	
	
;===========================
discountModule:
		MOV 	discountfileHandler, 0
		
		MOV 	ah, 3dh
		MOV 	al, 0
		LEA 	dx, discountfileName
		int 	21h
		MOV 	discountfileHandler, ax


choiceDiscount:											; ask if user want to apply discount or not?
		mov discountpercent, 0
		mov cx, 6
		
loopclearvaliddiscCode2:
		mov si, 0
		mov validDiscCode[si], 0
		inc si
		loop loopclearvaliddiscCode2
		mov minorderamount[0], 0
		mov minorderamount[1], 0
	
		MOV	AX , 0600H			; screen clearing + set the background to white and foreground to green
		MOV	BH , 70H							
		MOV	CX , 0000H
		MOV	DX , 184FH
		INT	10H
			
		MOV	AH , 02H		; set the cursor position
		MOV	BH , 00
		MOV	DH , 01
		MOV	DL , 35
		INT	10H
	
		MOV AH, 09H		
		LEA DX, discountTitle			;display discount title
		INT 21H		
		
		MOV	AH , 02H		; set the cursor position
		MOV	BH , 00
		MOV	DH , 03
		MOV	DL , 24
		INT	10H
	
		MOV		AH , 09H								; display prompt discount
		LEA		DX , PROMPTDISCOUNT
		INT 	21H
		
		MOV	AH , 0AH			;get choice
		LEA	DX , userChoice
		INT	 21H
		
		.386							;tell computer want to use advanced CPU instructions
		MOVZX   BX , userChoice_act		;move zero extension from actual to bx
		MOV	userChoice_buf[BX] , '$'

		;MOV		TEMP , AL 								; move AL value (input) to TEMP to prevent disappear

		MOV		AH , 09H
		LEA		DX , NEWLINE							; break new line
		INT		21H

		CMP 	userChoice_buf, 79H								; compare the character to check is it 'y' ？
		JE		inputDiscount							; proceed to get discount if it is 'y'

		CMP 	userChoice_buf, 59H								; compare the character to check is it 'Y' ?
		JE		inputDiscount							; proceed to get discount if it is 'Y'

		CMP 	userChoice_buf, 4EH								; compare the character to check is it 'n' ?
		JE		jumptosummary									; proceed to summary module

		CMP 	userChoice_buf, 6EH								; compare the character to check is it 'N' ?
		JE		jumptosummary								; proceed to summary module

		MOV	AH , 02H			; set position of cursor 
		MOV	BH , 00
		MOV	DH , 05
		MOV	DL , 24
		INT	10H
		
		MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
		MOV	BH , 74H							
		MOV	CX , 0500H
		MOV	DX , 054FH
		INT	10H
		
		MOV AH, 09H				
		LEA DX, errorMsg		;display errorMsg	
		INT 21H					

		MOV AH, 09H			
		LEA DX, newline			;newline
		INT 21H					

		MOV	AH , 02H			; set position of cursor 
		MOV	BH , 00
		MOV	DH , 06
		MOV	DL , 24
		INT	10H

		MOV AH, 09H				
		LEA DX, anyKey		;display anyKey	
		INT 21H	

		MOV AH, 01H				
		INT 21H		

		JMP 	choiceDiscount

jumptosummary:
		mov ah, 3eh          			;close file
		mov bx, discountfileHandler  
		int 21h
		
		MOV	AH , 02H			; set position of cursor 
		MOV	BH , 00
		MOV	DH , 05
		MOV	DL , 24
		INT	10H
		
		MOV AH, 09H				
		LEA DX, anyKey		;display anyKey	
		INT 21H	

		MOV AH, 01H				
		INT 21H		
		
		mov ax, subTotal								; if no discount, set to subtotal amount
		mov afterdiscQuo, ax
		mov afterdiscRem, 00
	
		JMP 	summaryModule							; jump to summary module

inputDiscount:
		MOV	AH , 02H			; set position of cursor 
		MOV	BH , 00
		MOV	DH , 05
		MOV	DL , 24
		INT	10H

		MOV 	AH , 09H								; display prompt discount code
		LEA 	DX , PROMPTCODE
		INT 	21H

		MOV 	AH , 0AH								; input the discount code
		LEA 	DX , APPLIEDCODE
		INT 	21H		
		
checkDiscount:
		MOV 	discountcolNum, 	0
		MOV 	numOfDiscount, 		0

discountfile:
		CMP 	numOfDiscount,  	5
		JAE 	jumptocodeunsuccesss
		
		MOV 	ah, 	42h 					; service to seek
		MOV 	al, 	0 						; start from beginning of file
		MOV 	bx,		discountfileHandler		; file
		MOV 	cx, 	0						
		MOV 	dx,  	discountcolNum
		INT 	21h
		
		MOV 	ah, 	3fh						; service to read from file
		MOV 	bx, 	discountfileHandler
		MOV 	cx, 	6 						; how many bytes to read
		LEA 	dx, 	validDiscCode 			; where to store the read bytes
		INT 	21h
		ADD 	discountcolNum, 6h
		
		MOV 	ah, 	42h 					; service to seek
		MOV 	al, 	0 						; start from beginning of file
		MOV 	bx,		discountfileHandler		; file
		MOV 	cx, 	0						
		MOV 	dx,  	discountcolNum
		INT 	21h
		
		MOV 	ah, 	3fh						; service to read from file
		MOV 	bx, 	discountfileHandler
		MOV 	cx, 	1 						; how many bytes to read
		LEA 	dx, 	discountpercent			; where to store the read bytes
		INT 	21h
		ADD 	discountcolNum, 1h
		
		MOV 	ah, 	42h 					; service to seek
		MOV 	al, 	0 						; start from beginning of file
		MOV 	bx,		discountfileHandler		; file
		MOV 	cx, 	0						
		MOV 	dx,  	discountcolNum
		INT 	21h
		
		MOV 	ah, 	3fh						; service to read from file
		MOV 	bx, 	discountfileHandler
		MOV 	cx, 	2 						; how many bytes to read
		LEA 	dx, 	minorderamount 			; where to store the read bytes
		INT 	21h
		ADD 	discountcolNum, 3H

		INC 	numOfDiscount
		JMP 	checkDiscCodeInput
		
		

jumptocodeunsuccesss:
		JMP  	discountCodeFail
		
checkDiscCodeInput:
		MOV SI, OFFSET [appliedcode+2] 		;point to the entered discount code array
		MOV DI, OFFSET validDiscCode		;point to the valid discount code array

ckDiscCodeInput:
		MOV DH, [DI] 						; check whether is the end of valid discount code
		CMP DH, '$'
		JE 	convertDiscMinAmount
		
		MOV DL, [SI] 						; check whether entered discount code reach end of string
		CMP DL, 13
		JE 	jumpToDiscountCodeFail
		
		CMP DL, DH							; compare valid discount code and entered discount code
		JNE jumpToDiscFile					; jump to unsucess if not same
		INC SI
		INC DI
		JMP ckDiscCodeInput 				; loop again to check next char in discount code

jumpToDiscountCodeFail:
		JMP discountCodeFail
		
jumpToDiscFile:
		JMP discountfile

convertDiscMinAmount:
		MOV bx, 0
		MOV al, minorderamount[bx]			; get tens
		SUB al, 30H
		MOV ah, 0
		MUL TEN 							; multiply tens by 10
		MOV actMinAmountValue, al
		
		MOV bx, 1
		MOV al, minorderamount[bx]          ; get onces
		SUB al, 30H
		ADD actMinAmountValue, al
		

checkMinAmount:
		MOV al, [actMinAmountValue]
		MOV ah, 0
		CMP ax, subTotal
		JA 	jumpToDiscAmountFail
		
		mov ah, 3eh          			;close file
		mov bx, discountfileHandler  
		int 21h
		
		jmp calcDiscountAmount
		
jumpToDiscAmountFail:
		JMP discountAmountFail
		
calcDiscountAmount:
		mov ax, subtotal
		mov bl, discountpercent
		sub bl, 48
		mov bh, 0
		mul bx
		
		;product / 100, get quotient
		div HUNDREDword
		mov quo, al
		mov rem, dl
		
		MOV	AH , 02H			; set position of cursor 
		MOV	BH , 00
		MOV	DH , 07
		MOV	DL , 24
		INT	10H
		
		MOV AH, 09H
		LEA DX, discPercentMsg		; display discount amount text string
		INT 21H
		
		MOV AH, 02H	
		mov dl, discountpercent
		int 21h
		
		MOV AH, 02H	
		mov dl, "%"
		int 21h
		
		;display value of tax (RM17.85)
		mov al, [quo]
		mov bl, 10
		mov ah, 00
		div bl
		
		MOV	AH , 02H			; set position of cursor 
		MOV	BH , 00
		MOV	DH , 09
		MOV	DL , 24
		INT	10H
		
		MOV AH, 09H
		LEA DX, discamountMsg		; display discount amount text string
		INT 21H
		CMP al, 0
		JE firstDigit
		
		MOV AH, 02H	
		mov dl, " "
		int 21h

		MOV AH, 02H	
		add al, 48	
		MOV BX, 0
		MOV discountvalue[bx], al 	; store tens for further display usage
		mov Dl, al 					;display tens of quo
		INT 21H	

		sub al, 48  				;prepare to display 1st digit
		mov bl, 10
		mul bl
		mov bl, [quo]
		sub bl, al
		mov al, bl
		
		MOV AH, 02H	
		add al, 48	
		MOV BX, 1
		MOV discountvalue[bx], al ; store once for further display usage
		mov Dl, al 				;display 1st digit of quo
		INT 21H	
		
		JMP dispDiscAmountDec
		
firstDigit:
		MOV AH, 02H	
		mov dl, " "
		int 21h
		
		mov al, [quo]		
		add al, 48
		mov ah, 02H
		mov bx, 1
		mov discountvalue[bx], al
		mov dl, al
		INT 21H
		
		
		mov bx, 0
		mov al, 20H
		mov discountvalue[bx], al
		
		
dispDiscAmountDec:
		mov ah, 02h				;display .
		mov dl, "."
		int 21h
		
		mov al, [rem]
		mov bl, 10
		mov ah, 00
		div bl
		
		MOV AH, 02H	
		add al, 48	
		MOV BX, 2
		MOV discountvalue[bx], al ; store first decimal for further display usage
		mov Dl, al 				;display 1st digit of remainder
		INT 21H	
		
		sub al, 48  			;prepare to display 2nd digit of remainder
		mov bl, 10
		mul bl
		mov bl, [rem]
		sub bl, al
		mov al, bl
		
		MOV AH, 02H	
		add al, 48	
		MOV BX, 3
		MOV discountvalue[bx], al ; store second decimal for further display usage 
		mov Dl, al 				;display 2nd digit of remainder
		INT 21H		
		
		MOV AH, 09H		
		LEA DX, newline			;newline
		INT 21H	
		
		MOV AH, 09H		
		LEA DX, newline			;newline
		INT 21H	
		
		JMP calcAfterDiscAmount
		
		
calcAfterDiscAmount:
		mov ax, subtotal
		MOV bl, discountpercent
		sub bl, 48
		mov bh, 0
		mov cx, 100
		sub cx, bx
		mul cx
		
		;product / 100, get quotient
		div HUNDREDword ;dw 100
		
		mov afterdiscQuo, ax
		mov afterdiscRem, dx
		
		mov ax, [afterdiscQuo]
		mov bl, 100
		div bl
		
		cmp al, 0				;if not 3 digits, move to 2 digits part
		je twod2
		
		
		add al, 48	
		mov discounttotal[0], al
		
		MOV AH, 09H
		LEA DX, RM
		;INT 21H
		
		MOV AH, 02H	
		mov Dl, al 				;display 3rd digit
		;INT 21H	
		mov thirddigit, al	
		
		mov ax, 0h
		mov al, thirddigit
		sub al, 48   			;prepare to display 2nd digit
		mov bl, 100
		mul bl
		mov bx, [afterdiscQuo]
		sub bx, ax
		mov ax, bx
		mov bl, 10
		div bl
		
		MOV AH, 02H	
		add al, 48	
		mov discounttotal[1], al
		mov Dl, al 				;display 2nd digit
		;INT 21H		
		mov scdigit, al
		
		sub al, 48   			;prepare to display 1st digit
		mov bl, 10
		mul bl
		mov bx, [afterdiscQuo]
		sub bx, ax
		mov al, thirddigit
		sub al, 48
		mov cl, 100
		mul cl
		
		sub bx, ax
		
		MOV AH, 02H	
		add bl, 48	
		mov discounttotal[2], bl
		mov Dl, bl 				;display 1st digit
		;INT 21H	
		jmp dispDecimal
		
twod2:				;prepare to display 2nd digit

		mov bx, 0
		mov al, 20H
		mov discounttotal[0], al
		
		MOV AH, 09H
		LEA DX, RM
		;INT 21H
		
		mov ax, [afterdiscQuo]
		mov bl, 10
		div bl
		
		MOV AH, 02H	
		add al, 48	
		mov discounttotal[1], al
		mov Dl, al 				;display 2nd digit of quo
		;INT 21H	
		
		sub al, 48  				;prepare to display 1st digit
		mov bl, 10
		mul bl
		mov bx, [afterdiscQuo]
		sub bl, al
		mov al, bl
		
		MOV AH, 02H	
		add al, 48	
		mov discounttotal[2], al
		mov Dl, al 				;display 1st digit of quo
		;INT 21H	
	
dispDecimal:
		mov ah, 02h				;display .
		mov dl, "."
		int 21h
		
		mov ax, [afterdiscRem]
		mov bl, 10
		div bl
		
		MOV AH, 02H	
		add al, 48	
		mov discounttotal[3], al
		mov Dl, al 				;display 1st digit of remainder
		;INT 21H	
		
		sub al, 48  			;prepare to display 2nd digit of remainder
		mov bl, 10
		mul bl
		mov bx, [afterdiscRem]
		sub bl, al
		mov al, bl
		
		MOV AH, 02H	
		add al, 48	
		mov discounttotal[4], al
		mov Dl, al 				;display 2nd digit of remainder
		;INT 21H		
		
dispDiscAmountArray:
		MOV	AH , 02H			; set position of cursor 
		MOV	BH , 00
		MOV	DH , 11
		MOV	DL , 24
		INT	10H
		
		MOV AH, 09H
		LEA DX, amtafterdiscMsg
		INT 21H
		
		MOV AH, 02H
		MOV BX, 0
		MOV DL, discounttotal[bx]
		INT 21H
		
		MOV AH, 02H
		MOV BX, 1
		MOV DL, discounttotal[bx]
		INT 21H
		
		MOV AH, 02H
		MOV BX, 2
		MOV DL, discounttotal[bx]
		INT 21H
		
		MOV AH, 02H
		MOV DL, "."
		INT 21H
		
		MOV AH, 02H
		MOV BX, 3
		MOV DL, discounttotal[bx]
		INT 21H
		
		MOV AH, 02H
		MOV BX, 4
		MOV DL, discounttotal[bx]
		INT 21H
		
		MOV	AH , 02H			; set position of cursor 
		MOV	BH , 00
		MOV	DH , 15
		MOV	DL , 20
		INT	10H
		
		MOV	AX , 0600H			; screen clearing + set the background to white and font to black
		MOV	BH , 71H							
		MOV	CX , 0F00H
		MOV	DX , 0F4FH
		INT	10H
		
		MOV AH, 09H				
		LEA DX, discountIsApplied	;display discount applied successfully message 
		INT 21H	
		
		MOV	AH , 02H			; set position of cursor 
		MOV	BH , 00
		MOV	DH , 18
		MOV	DL , 24
		INT	10H
		
		MOV AH, 09H				
		LEA DX, anyKey		;display anyKey	
		INT 21H	

		MOV AH, 01H				
		INT 21H		
		
		JMP summaryModule

discountCodeFail:
		MOV	AH , 02H			; set position of cursor 
		MOV	BH , 00
		MOV	DH , 07
		MOV	DL , 24
		INT	10H
		
		MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
		MOV	BH , 74H							
		MOV	CX , 0700H
		MOV	DX , 074FH
		INT	10H
	
		MOV AH, 09H
		LEA DX, INVALIDCODE
		INT 21H
		
		MOV	AH , 02H			; set position of cursor 
		MOV	BH , 00
		MOV	DH , 08
		MOV	DL , 24
		INT	10H
		
		MOV AH, 09H				
		LEA DX, anyKey		;display anyKey	
		INT 21H	
		
		mov ah, 01h
		int 21h
		
		JMP choiceDiscount 	; prompt user again
		
discountAmountFail:
		MOV	AH , 02H			; set position of cursor 
		MOV	BH , 00
		MOV	DH , 07
		MOV	DL , 24
		INT	10H
		
		MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
		MOV	BH , 74H							
		MOV	CX , 0700H
		MOV	DX , 074FH
		INT	10H
		
		MOV Ah, 09H
		LEA DX, TERMSNOTMET
		INT 21H
		
		MOV	AH , 02H			; set position of cursor 
		MOV	BH , 00
		MOV	DH , 08
		MOV	DL , 24
		INT	10H
		
		MOV AH, 09H				
		LEA DX, anyKey		;display anyKey	
		INT 21H	
		
		mov ah, 01h
		int 21h
		
		JMP choiceDiscount	; prompt user again	
	
	
	
;============ summary =============================================================
summaryModule: 
	MOV	AX , 0600H			; screen clearing + set the background to white and font to black
	MOV	BH , 70H							
	MOV	CX , 0000H
	MOV	DX , 184FH
	INT	10H
		
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 01
	MOV	DL , 33
	INT	10H
	
	MOV AH, 09H				
	LEA DX, summaryTitle		;display "order summary"	
	INT 21H	
	
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 03
	MOV	DL , 07
	INT	10H
	
	MOV AH, 09H				
	LEA DX, datemsg		;display date:	
	INT 21H	
	
	mov ah, 2Ah     ; To get system date [DD in dl , MM in dh, YYYY in cx]
        int 21h         ; DOS interrupt to get date

        mov al, dl      ; day in dl
        call disp       ; call disp procedure to display day
        mov dl, '/'     ; To print /
        mov ah, 02h
        int 21h

        mov al, dh      ; month in dh
        call disp       ; call disp procedure to display month
        mov dl, '/'     ; To print /
        mov ah, 02h
        int 21h

        add cx, 0F830h  ; Add 0F830 to adjust hexadecimal effects on year
        mov ax, cx      ; year in ax 
        call disp       ; call disp procedure to display year

		jmp disptime

        disp proc       ; Beginning of disp procedure

    aam           ; ASCII adjust after multiplication [ax register]
    mov bx, ax    ; loading adjusted value to bx
    add bx, 3030h ; Add 3030 to properly print the data

          mov dl, bh    ; To print first digit of data
          mov ah, 02h
          int 21h
          mov dl, bl    ; To print second digit of data
          mov ah, 02h
          int 21h
          ret           ; return from the procedure
          disp endp     ; end display procedure
		  
dispTime:
	MOV AH, 09H				
	LEA DX, timemsg		;display time:
	INT 21H	
	
	mov ah, 2ch     ; To get system time [HH in ch, MM in cl, SS in dh]
        int 21h         ; DOS interrupt to get time

        mov al, ch      ; hour in ch
        call disp       ; call disp procedure to display hour

        mov dl, ':'     ; copy : to dl to print
        mov ah, 02h     ; copy 02 to ah
        int 21h         ; DOS interrupt to display content in dl i.e. : 

        mov al, cl      ; minutes in cl
        call disp       ; call disp procedure to display minutes

        mov dl, ':'     ; To print : as above
        mov ah, 02h     
        int 21h         

        mov al, dh      ; seconds in dh as SS
        call disp       ; call disp procedure to display seconds
		
		jmp dispstaffName
	
dispstaffName:
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 04
	MOV	DL , 07
	INT	10H
	
	MOV AH, 09H				
	LEA DX, staffnameMsg		;display "Staff name:"	
	INT 21H	
	
	MOV AH, 09H				
	LEA DX, empName		;display name of employee
	INT 21H	
	
summTable:				;display order summary to check
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 06
	MOV	DL , 07
	INT	10H
	
	MOV	AX , 0600H			; screen clearing + set the background to white and font to black
	MOV	BH , 00001111B						
	MOV	CX , 0606H
	MOV	DX , 0649H
	INT	10H
	
	MOV AH, 09H				
	lea Dx, dispColName2 	;display column name	
	INT 21H	
	
	MOV	AX , 0600H			; screen clearing + set the background to white and font to black
	MOV	BH , 00110000B						
	MOV	CX , 0706H
	MOV	DX , 0F49H
	INT	10H
	
	MOV	AX , 0600H			; screen clearing + set the background to white and font to black
	MOV	BH , 00011111B						
	MOV	CX , 1032H
	MOV	DX , 1049H
	INT	10H
	
summdisplayOrdered:			;set index for looping
	;mov cx, index
	mov si, 0
	
	;mov	bl, [choice+si]
	;add bl, 48
	;cmp bl, "0"
	;je	noOrders
	
summloopDisplayOrdered:
	mov cx, si
	add cl, 7
	MOV	AH , 02H			; set the cursor position
	MOV	BH , 00
	MOV	DH , cl
	MOV	DL , 07
	INT	10H
	
	cmp si, index
	jb  summDispThings
	MOV AH, 02H	
	mov Dl, "-" 			;display -
	INT 21H	
	
	MOV AH, 09H		
	LEA DX, newline			;newline
	INT 21H	
	
	jmp summdetermineLoopOrNot

summDispThings:
	inc si
	MOV AH, 09H	
	mov	orderIndex, si
	add orderIndex, 48
	lea Dx, orderIndex 	;display index no
	INT 21H	
	
	dec si
	mov	bl, [choice+si]
	
	cmp bl, "1"
	je summdispChickenRamen
	cmp bl, "2"
	je summdispBeefRamen
	cmp bl, "3"
	je summdispPorkRamen
	cmp bl, "4"
	je summdispSeafoodRamen
	cmp bl, "5"
	je summdispSupremeRamen
	cmp bl, "6"
	je summdispJapMelon
	cmp bl, "7"
	je summdispCoffeeJelly
	cmp bl, "8"
	je summdispMochiIC
	
summnoOrders:
	MOV AH, 09H				
	lea Dx, noOrdersMsg		
	INT 21H	
	jmp zero
	
summdispChickenRamen:
	MOV AH, 09H				
	lea Dx, itemName1		
	INT 21H	
	jmp summdispQty
summdispBeefRamen:
	MOV AH, 09H				
	lea Dx, itemName2		
	INT 21H	
	jmp summdispQty
summdispPorkRamen:
	MOV AH, 09H				
	lea Dx, itemName3		
	INT 21H	
	jmp summdispQty
summdispSeafoodRamen:
	MOV AH, 09H				
	lea Dx, itemName4		
	INT 21H	
	jmp summdispQty
summdispSupremeRamen:
	MOV AH, 09H				
	lea Dx, itemName5		
	INT 21H	
	jmp summdispQty
summdispJapMelon:
	MOV AH, 09H				
	lea Dx, itemName6		
	INT 21H	
	jmp summdispQty
summdispCoffeeJelly:
	MOV AH, 09H				
	lea Dx, itemName7		
	INT 21H	
	jmp summdispQty
summdispMochiIC:
	MOV AH, 09H				
	lea Dx, itemName8		
	INT 21H	
	jmp summdispQty

summdispQty:
	MOV AH, 02H				;display ordered item name
	mov Dl, [qty+si] 		
	INT 21H	
	
	;set cursor to align with 'A' of amount
	MOV AH, 09H				
	lea Dx, elevenSpace 	;display 11 spaces
	INT 21H
	
summdispAmount:			;display ordered item name
	shl si, 1
	mov ax, [pricingqty+si]  ;prepare 1st digit for display
	mov bl, 100
	div bl
	
	cmp al, 00h  			;determine whether 3 digits
	je summtwod					;if only 2 digits, go to twod to display only 2 digits
	
	MOV AH, 02H	
	add al,48	
	mov Dl, al 				;display 3rd digit
	INT 21H	
	mov thirddigit,al	
	
	sub al, 48   			;prepare 2nd digit for display
	mov bl, 100
	mul bl
	mov bx, [pricingqty+si]
	mov ah, 00
	sub bx, ax
	mov ax, bx
	mov bl, 10
	div bl
	
	MOV AH, 02H	
	add al,48	
	mov Dl, al 				;display 2nd digit
	INT 21H		
	mov scdigit, al
	
	sub al, 48    			;prepare 1st digit for display
	mov bl, 10
	mul bl
	mov bx, [pricingqty+si]
	mov ah, 00
	sub bx, ax
	mov al, thirddigit
	sub al, 48
	mov cl, 100
	mul cl
	mov ah, 00
	sub bx, ax
	
	MOV AH, 02H	
	add bl, 48	
	mov Dl, bl 				;display 3rd digit
	INT 21H	
	
	MOV AH, 02H	
	mov Dl, "."
	INT 21H	
	
	MOV AH, 02H	
	mov Dl, "0"
	INT 21H	
	
	MOV AH, 02H	
	mov Dl, "0"
	INT 21H	
	shr si, 1
	
	jmp summdetermineLoopOrNot
	
summtwod:					;prepare to display 2 digits
	mov ah, 02H				;add a space in front of 2 digit value
	mov dl, 20H
	int 21h
	
	mov ax, [pricingqty+si]	;prepare to display 2nd digit
	mov ah, 00
	mov bl, 10
	div bl
	
	MOV AH, 02H	
	add al, 48	
	mov Dl, al 				;display 2nd digit
	INT 21H	
	
	sub al, 48   			;prepare to display 1st digit
	mov bl, 10
	mul bl
	mov bx, [pricingqty+si]
	mov ah, 00h
	sub bx, ax
	mov ax, bx
	
	MOV AH, 02H	
	add al, 48	
	mov Dl, al 				;display 1st digit
	INT 21H	
	
	MOV AH, 02H	
	mov Dl, "."
	INT 21H	
	
	MOV AH, 02H	
	mov Dl, "0"
	INT 21H	
	
	MOV AH, 02H	
	mov Dl, "0"
	INT 21H	
	shr si, 1
	
summdetermineLoopOrNot:
	inc si					;check whether there are anymore in the array
	cmp si, 9
	jb summloopDisplayOrdered
	
	;move cursor to below qty
	
dispTotalQty:				;display total qty
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 16
	MOV	DL , 53
	INT	10H
	
	cmp totalQty, 9H
	ja	aboveNineTotalQty
	
	mov ah, 02h
	mov dl, " "
	int 21h
	
	mov ah, 02h
	mov cl, totalQty
	add cl, 48
	mov dl, cl
	int 21h
	jmp subtotalUnderTable
	
aboveNineTotalQty:
	mov al, totalQty		;get total qty value
	;mov bl, 48
	;sub al, bl
	
	mov bl, 10				;prepare display 2nd digit
	mov ah, 00
	div bl
	
	MOV AH, 02H	
	add al, 48	
	mov Dl, al 				;display 2nd digit
	INT 21H	
	mov scdigit, al
	
	sub al, 48   			;prepare to display 1st digit
	mov bl, 10
	mul bl
	mov bl, [totalQty]
	sub bl, al
	mov al, bl
	
	MOV AH, 02H	
	add al, 48	
	mov Dl, al 				;display 1st digit
	INT 21H	

subtotalUnderTable:
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 16
	MOV	DL , 65
	INT	10H
		
	MOV AH, 02H			
	MOV BX, 0
	MOV DL, subTotalValue[bx]
	INT 21H
		
	MOV AH, 02H
	MOV BX, 1
	MOV DL, subTotalValue[bx]
	INT 21H
		
	MOV AH, 02H
	MOV BX, 2
	MOV DL, subTotalValue[bx]
	INT 21H
	
	MOV AH, 02H		
	MOV DL, "."
	INT 21H
		
	MOV AH, 02H		
	MOV DL, "0"
	INT 21H
		
	MOV AH, 02H		
	MOV DL, "0"
	INT 21H
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 19
	MOV	DL , 10
	INT	10H

	MOV AH, 09H				
	LEA DX, anyKey		;display anyKey	
	INT 21H	

	MOV AH, 01H				
	INT 21H		

priceDetails:		;price details
	MOV	AX , 0600H			; screen clearing + set the background to white and font to black
	MOV	BH , 70H							
	MOV	CX , 0000H
	MOV	DX , 184FH
	INT	10H
		
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 01
	MOV	DL , 33
	INT	10H
	
	MOV AH, 09H		
	LEA DX, summaryTitle    		;display summary title
	INT 21H	
	
	;subtotal
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 03
	MOV	DL , 24
	INT	10H
	
	MOV AH, 09H		
	LEA DX, subtotalmsg    		;display Subtotal: RMxx.00
	INT 21H	
	
	MOV AH, 02H			
	MOV BX, 0
	MOV DL, subTotalValue[bx]
	INT 21H
		
	MOV AH, 02H
	MOV BX, 1
	MOV DL, subTotalValue[bx]
	INT 21H
		
	MOV AH, 02H
	MOV BX, 2
	MOV DL, subTotalValue[bx]
	INT 21H
	
	MOV AH, 02H		
	MOV DL, "."
	INT 21H
		
	MOV AH, 02H		
	MOV DL, "0"
	INT 21H
		
	MOV AH, 02H		
	MOV DL, "0"
	INT 21H
	
	cmp discountpercent, 0
	je	calctax
	
	;discount code applied
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 04
	MOV	DL , 24
	INT	10H
		
	MOV AH, 09H		
	LEA DX, discCodeMsg    		;display Discount Code:
	INT 21H	
	
	MOV AH, 09H		
	LEA DX, validDiscCode
	INT 21H	
	
	;discount percentage
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 05
	MOV	DL , 24
	INT	10H
	
	MOV AH, 09H		
	LEA DX, discPercentMsg    		;display discount perc: RMxx.00
	INT 21H	
	
	MOV AH, 02H		
	mov bl, discountpercent
	;add bl, 48
	mov dl, bl
	INT 21H	
	
	MOV AH, 02H		
	mov dl, "%"
	INT 21H	
	
	;discount amt
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 06
	MOV	DL , 24
	INT	10H
	
	MOV AH, 09H		
	LEA DX, discamountMsg    		;display  discount amt: RMxx.00
	INT 21H	
	
	MOV AH, 02H			
	MOV BX, 0
	MOV DL, discountvalue[bx]
	INT 21H
	
	MOV AH, 02H			
	MOV BX, 1
	MOV DL, discountvalue[bx]
	INT 21H
	
	MOV AH, 02H		
	MOV DL, "."
	INT 21H
	
	MOV AH, 02H			
	MOV BX, 2
	MOV DL, discountvalue[bx]
	INT 21H
	
	MOV AH, 02H			
	MOV BX, 3
	MOV DL, discountvalue[bx]
	INT 21H
	
	;amt after disc
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 07
	MOV	DL , 24
	INT	10H
	
	MOV AH, 09H		
	LEA DX, amtafterdiscMsg    		;display After Discount: RMxxx.xx
	INT 21H	
	
	MOV AH, 02H			
	MOV BX, 0
	MOV DL, discounttotal[bx]
	INT 21H
	
	MOV AH, 02H			
	MOV BX, 1
	MOV DL, discounttotal[bx]
	INT 21H
	
	MOV AH, 02H			
	MOV BX, 2
	MOV DL, discounttotal[bx]
	INT 21H
	
	MOV AH, 02H		
	MOV DL, "."
	INT 21H
	
	MOV AH, 02H			
	MOV BX, 3
	MOV DL, discounttotal[bx]
	INT 21H
	
	MOV AH, 02H			
	MOV BX, 4
	MOV DL, discounttotal[bx]
	INT 21H
	
	
calcTax:	
	mov ax, afterdiscQuo		;RM ppp.qq, ppp * 5 
	mul FIVEPerc
		
	div HUNDRED					;product / 100, get quotient
	mov taxFrontQuo, al			;get ringgit of tax
	mov taxFrontRem, ah
	
	mov ax, afterdiscRem		;RM ppp.qq, qq * 5 
	mul FIVEPerc
		
	div HUNDRED					;product / 100, get quotient
	mov taxBackQuo, al			
	;mov taxBackRem, ah			;too small to be counted
	
	mov bl, taxBackQuo
	add taxFrontRem, bl			;get cents of tax
	
	mov al, [taxFrontQuo]
	mov bl, 10
	mov ah, 00
	div bl
	
	MOV AH, 02H	
	add al, 48	
	;mov Dl, al 				;display 2nd digit of quo
	;INT 21H	
	mov taxValue[0], al
	
	cmp al, 30H
	jne	cont
	mov taxValue[0], 20h
	
cont:
	sub al, 48  				;prepare to display 2nd digit
	mov bl, 10
	mul bl
	mov bl, [taxFrontQuo]
	sub bl, al
	mov al, bl
	
	MOV AH, 02H	
	add al, 48	
	;mov Dl, al 				;display 1st digit of quo
	;INT 21H	
	mov taxValue[1], al
	
	;mov ah, 02h				;display .
	;mov dl, "."
	;int 21h
	
	mov al, [taxFrontRem]
	mov bl, 10
	mov ah, 00
	div bl
	
	MOV AH, 02H	
	add al, 48	
	;mov Dl, al 				;display 1st digit of remainder
	;INT 21H	
	mov taxValue[2], al
	
	sub al, 48  			;prepare to display 2nd digit of remainder
	mov bl, 10
	mul bl
	mov bl, [taxFrontRem]
	sub bl, al
	mov al, bl
	
	MOV AH, 02H	
	add al, 48	
	;mov Dl, al 				;display 2nd digit of remainder
	;INT 21H		
	mov taxValue[3], al
	
	cmp discountpercent, 0
	je	setHigher
	
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 08
	MOV	DL , 24
	INT	10H
	jmp dispTaxAmt
	
setHigher:
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 04
	MOV	DL , 24
	INT	10H

dispTaxAmt:
	MOV AH, 09H		
	LEA DX, taxMsg  			;Tax: 
	INT 21H	
	
	MOV AH, 02H					; display tax value, RMxx.xx
	MOV BX, 0
	MOV DL, taxValue[bx]
	INT 21H
		
	MOV AH, 02H
	MOV BX, 1
	MOV DL, taxValue[bx]
	INT 21H
	
	MOV AH, 02H
	MOV DL, "."
	INT 21H
		
	MOV AH, 02H
	MOV BX, 2
	MOV DL, taxValue[bx]
	INT 21H
	
	MOV AH, 02H
	MOV BX, 3
	MOV DL, taxValue[bx]
	INT 21H
	
	MOV AH, 09H		
	LEA DX, newline			;newline
	INT 21H	
	
;================ multipy 1.05 ==================================================
calcGrandTotal:
	mov bl, taxFrontQuo		;set grand total ringgit to tax ringit
	mov bh, 0
	mov gtQuo, bx
	
	mov bx, afterdiscQuo	;add grand total ringgit with after discount ringgit
	add gtQuo, bx
	
	mov bl, taxFrontRem
	mov bh, 0
	mov gtRem, bx
	
	mov bx, afterdiscRem
	add gtRem, bx
	
	cmp gtRem, 100
	jb	dispGrandTotal
	
	sub	gtRem, 100
	add	gtQuo, 1
	
dispGrandTotal:
	mov ax, [gtQuo]
	mov bl, 100
	div bl
	
	cmp al, 0				;if not 3 digits, move to 2 digits part
	je dispGrandTotalTwoDigits
	
	MOV AH, 02H	
	add al, 48	
	;mov Dl, al 				;display 3rd digit
	;INT 21H	
	mov thirddigit, al
	mov afterTaxValue[0], al
	
	mov ax, 0h
	mov al, thirddigit
	sub al, 48   			;prepare to display 2nd digit
	mov bl, 100
	mul bl
	mov bx, [gtQuo]
	sub bx, ax
	mov ax, bx
	mov bl, 10
	div bl
	
	MOV AH, 02H	
	add al, 48	
	;mov Dl, al 				;display 2nd digit
	;INT 21H		
	mov scdigit, al
	mov afterTaxValue[1], al
	
	sub al, 48   			;prepare to display 1st digit
	mov bl, 10
	mul bl
	mov bx, [gtQuo]
	sub bx, ax
	mov al, thirddigit
	sub al, 48
	mov cl, 100
	mul cl
	
	sub bx, ax
	
	MOV AH, 02H	
	add bl, 48	
	;mov Dl, bl 				;display 1st digit
	;INT 21H	
	mov afterTaxValue[2], bl
	jmp dispGrandTotalDecimal
	
dispGrandTotalTwoDigits:				;prepare to display 2nd digit
	mov ax, [gtQuo]
	mov bl, 10
	div bl
	
	MOV AH, 02H	
	add al, 48	
	;mov Dl, al 				;display 2nd digit of quo
	;INT 21H	
	mov afterTaxValue[1], al
	
	sub al, 48  				;prepare to display 1st digit
	mov bl, 10
	mul bl
	mov bx, [gtQuo]
	sub bl, al
	mov al, bl
	
	MOV AH, 02H	
	add al, 48	
	;mov Dl, al 				;display 1st digit of quo
	;INT 21H	
	mov afterTaxValue[2], al
	
	mov al, 20H					;set index 0 to a space char
	mov afterTaxValue[0], al
	
dispGrandTotalDecimal:
	;mov ah, 02h				;display .
	;mov dl, "."
	;int 21h
	
	mov ax, [gtRem]
	mov bl, 10
	div bl
	
	MOV AH, 02H	
	add al, 48	
	;mov Dl, al 				;display 1st digit of remainder
	;INT 21H	
	mov afterTaxValue[3], al
	
	sub al, 48  			;prepare to display 2nd digit of remainder
	mov bl, 10
	mul bl
	mov bx, [gtRem]
	sub bl, al
	mov al, bl
	
	MOV AH, 02H	
	add al, 48	
	;mov Dl, al 				;display 2nd digit of remainder
	;INT 21H		
	mov afterTaxValue[4], al
	
	cmp discountpercent, 0
	je	setHigher2
	
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 09
	MOV	DL , 24
	INT	10H
	jmp dispGTAmt
	
setHigher2:
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 05
	MOV	DL , 24
	INT	10H

dispGTAmt:
	MOV AH, 09H		
	LEA DX, grandTotalMsg    	;Grand total : RMxxx.xx
	INT 21H	
	
	MOV AH, 02H					; display tax value, RMxx.xx
	MOV BX, 0
	MOV DL, afterTaxValue[bx]
	INT 21H
		
	MOV AH, 02H
	MOV BX, 1
	MOV DL, afterTaxValue[bx]
	INT 21H
		
	MOV AH, 02H
	MOV BX, 2
	MOV DL, afterTaxValue[bx]
	INT 21H
	
	MOV AH, 02H
	MOV DL, "."
	INT 21H
	
	MOV AH, 02H
	MOV BX, 3
	MOV DL, afterTaxValue[bx]
	INT 21H
	
	MOV AH, 02H
	MOV BX, 4
	MOV DL, afterTaxValue[bx]
	INT 21H
	
	
	
summaryProceed:
	MOV	AX , 0600H			; screen clearing + set the background to white and font to black
	MOV	BH , 70H							
	MOV	CX , 0B00H
	MOV	DX , 184FH
	INT	10H
	
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 11
	MOV	DL , 15
	INT	10H
	
	MOV AH, 09H				;used to check whether to proceed
	lea Dx, proceedMsg4 		;if proceed, go to discount
	INT 21H					;if cancel order, go to menu again, clear all var
							;if stop order, go to mainmenu , clear all var
	
	MOV	AH , 0AH			;get choice
	LEA	DX , userChoice
	INT	 21H
	
	.386							;tell computer want to use advanced CPU instructions
	MOVZX   BX , userChoice_act		;move zero extension from actual to bx
	MOV	userChoice_buf[BX] , '$'
	
	MOV AH, 09H		
	LEA DX, newline			;newline
	INT 21H	
	
	cmp userChoice_buf, "1"
	jb	reenterSummaryProceed
	
	cmp userChoice_buf, "4"
	ja	reenterSummaryProceed
	
	cmp userChoice_buf, "1"		;valid choice
	je  confirmpay
	
	cmp userChoice_buf, "2"
	je jumptosummaryModule
	
	cmp userChoice_buf, "3"
	je cancelOrder2
	
	cmp userChoice_buf, "4"
	je stopOrder2
	
confirmpay:
	MOV	AX , 0600H			; screen clearing + set the background to white and font to black
	MOV	BH , 70H							
	MOV	CX , 1200H
	MOV	DX , 184FH
	INT	10H
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 18
	MOV	DL , 15
	INT	10H
	
	MOV AH, 09H				;ask confirmation to pay
	lea Dx, payConfirmMsg 	
	INT 21H	
	
	MOV	AH , 0AH			;get choice
	LEA	DX , userChoice
	INT	 21H
	
	.386							;tell computer want to use advanced CPU instructions
	MOVZX   BX , userChoice_act		;move zero extension from actual to bx
	MOV	userChoice_buf[BX] , '$'
	
	;check is yes or no
	mov al, userChoice_buf		;if yes, list out menu again
	cmp al, "y"
	je	jumptopaymentmodule

	mov al, userChoice_buf	
	cmp al, "Y"
	je	jumptopaymentmodule

	mov al, userChoice_buf		;if no, list out short summary
	cmp al, "n"
	je	priceDetails

	mov al, userChoice_buf	
	cmp al, "N"
	je	priceDetails
	
	;if not y or n, print invalidYesNo msg and reprompt
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 20
	MOV	DL , 15
	INT	10H
	
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
	MOV	BH , 74H							
	MOV	CX , 1400H
	MOV	DX , 144FH
	INT	10H
	
	MOV AH, 09H				
	LEA DX, invalidYesNo	;print invalidYesNo msg 		
	INT 21H		
	MOV AH, 09H		
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 21
	MOV	DL , 15
	INT	10H

	MOV AH, 09H				
	LEA DX, anyKey		;display anyKey	
	INT 21H		
	
	MOV AH, 01H				
	INT 21H		
	jmp confirmpay
	
jumptopaymentmodule:
	jmp payment

jumptosummaryModule:
	jmp summaryModule
	
cancelOrder2:
	MOV	AX , 0600H			; screen clearing + set the background to white and font to black
	MOV	BH , 70H							
	MOV	CX , 1200H
	MOV	DX , 184FH
	INT	10H
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 18
	MOV	DL , 15
	INT	10H
	
	MOV AH, 09H				;ask confirmation to cancel order
	lea Dx, cancelOrderConfirmMsg 	
	INT 21H	
	
	MOV	AH , 0AH			;get choice
	LEA	DX , userChoice
	INT	 21H
	
	.386							;tell computer want to use advanced CPU instructions
	MOVZX   BX , userChoice_act		;move zero extension from actual to bx
	MOV	userChoice_buf[BX] , '$'
	
	;check is yes or no
	mov al, userChoice_buf		;if yes, list out menu again
	cmp al, "y"
	je	jumptofoodmenu2

	mov al, userChoice_buf	
	cmp al, "Y"
	je	jumptofoodmenu2

	mov al, userChoice_buf		;if no, list out short summary
	cmp al, "n"
	je	priceDetails

	mov al, userChoice_buf	
	cmp al, "N"
	je	priceDetails
	
	;if not y or n, print invalidYesNo msg and reprompt
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 20
	MOV	DL , 15
	INT	10H
	
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
	MOV	BH , 74H							
	MOV	CX , 1400H
	MOV	DX , 144FH
	INT	10H
	
	MOV AH, 09H				
	LEA DX, invalidYesNo	;print invalidYesNo msg 		
	INT 21H		
	MOV AH, 09H		
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 21
	MOV	DL , 15
	INT	10H

	MOV AH, 09H				
	LEA DX, anyKey		;display anyKey	
	INT 21H		
	
	MOV AH, 01H				
	INT 21H		
	jmp cancelOrder2

stopOrder2:
	MOV	AX , 0600H			; screen clearing + set the background to white and font to black
	MOV	BH , 70H							
	MOV	CX , 1200H
	MOV	DX , 184FH
	INT	10H
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 18
	MOV	DL , 15
	INT	10H
	
	MOV AH, 09H				;ask confirmation to stop
	lea Dx, stopOrderConfirmMsg 	
	INT 21H	
	
	MOV	AH , 0AH			;get choice
	LEA	DX , userChoice
	INT	 21H
	
	.386							;tell computer want to use advanced CPU instructions
	MOVZX   BX , userChoice_act		;move zero extension from actual to bx
	MOV	userChoice_buf[BX] , '$'
	
	;check is yes or no
	mov al, userChoice_buf		;if yes, list out menu again
	cmp al, "y"
	je	jumptomainmenu2

	mov al, userChoice_buf	
	cmp al, "Y"
	je	jumptomainmenu2

	mov al, userChoice_buf		;if no, list out short summary
	cmp al, "n"
	je	priceDetails

	mov al, userChoice_buf	
	cmp al, "N"
	je	priceDetails
	
	;if not y or n, print invalidYesNo msg and reprompt
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 20
	MOV	DL , 15
	INT	10H
	
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
	MOV	BH , 74H							
	MOV	CX , 1400H
	MOV	DX , 144FH
	INT	10H
	
	MOV AH, 09H				
	LEA DX, invalidYesNo	;print invalidYesNo msg 		
	INT 21H		
	MOV AH, 09H		
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 21
	MOV	DL , 15
	INT	10H

	MOV AH, 09H				
	LEA DX, anyKey		;display anyKey	
	INT 21H		
	
	MOV AH, 01H				
	INT 21H		
	jmp stopOrder2
	
jumptofoodmenu2:
	jmp foodmenu
	
jumptomainmenu2:
	jmp mainmenu

reenterSummaryProceed:
	MOV	AH , 02H		; set the cursor position
	MOV	BH , 00
	MOV	DH , 18
	MOV	DL , 15
	INT	10H
	
	MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
	MOV	BH , 74H							
	MOV	CX , 1200H
	MOV	DX , 124FH
	INT	10H
	
	MOV AH, 09H				;display inavlid msg
	lea Dx, invalidProceed2		
	INT 21H	
	
	MOV	AH , 02H			; set position of cursor 
	MOV	BH , 00
	MOV	DH , 19
	MOV	DL , 15
	INT	10H

	MOV AH, 09H				
	LEA DX, anyKey		;display anyKey	
	INT 21H	

	MOV AH, 01H				
	INT 21H		
	
	jmp summaryProceed	
	
;================================ payment ======================================================
payment:
		;mov paymentOption, 0		;set all var to 0
		mov change, 0
		mov paysuccess,"0"
		mov continue, "0"
		;mov previouspayOpt,0
		mov sen, 0
		mov cnt, 0					;set the maximum count of payment =0

	paymentmenu:
		MOV	AX , 0600H			; screen clearing + set the background to white and font to black
		MOV	BH , 70H							
		MOV	CX , 0000H
		MOV	DX , 184FH
		INT	10H
			
		MOV	AH , 02H		; set the cursor position
		MOV	BH , 00
		MOV	DH , 01
		MOV	DL , 34
		INT	10H
		
		MOV AH, 09H			
		LEA DX, paymentTitle		;Msg :print all payment option
		INT 21H
	
		MOV	AH , 02H		; set the cursor position
		MOV	BH , 00
		MOV	DH , 03
		MOV	DL , 25
		INT	10H
		
		MOV AH, 09H			
		LEA DX, paymentOptMenu1		;Msg :print all payment option
		INT 21H
		
		MOV AH, 09H			
		LEA DX, paymentOptMenu2		;Msg :print all payment option
		INT 21H

	getOption:
		MOV	AX , 0600H			; screen clearing + set the background to white and font to black
		MOV	BH , 70H							
		MOV	CX , 0900H
		MOV	DX , 184FH
		INT	10H
	
		MOV	AH , 02H		; set the cursor position
		MOV	BH , 00
		MOV	DH , 09
		MOV	DL , 15
		INT	10H
		
		MOV AH, 09H			
		LEA DX, paymentOpt			;prompt for payment option
		INT 21H

		MOV	AH , 0AH			;get choice
		LEA	DX , userChoice
		INT	 21H
		
		.386							;tell computer want to use advanced CPU instructions
		MOVZX   BX , userChoice_act		;move zero extension from actual to bx
		MOV	userChoice_buf[BX] , '$'

		;mov al, userChoice_buf		;if case :pay thorugh cash
		cmp userChoice_buf, "1"
		je tocashPayment
		
		cmp userChoice_buf, "2"					;if case :pay through card
		je tocardPayment

		cmp userChoice_buf, "3"					;if case:pay through online
		je toonlineBank
		
		cmp userChoice_buf, "4"					;if case:cancel pay
		je cancelOrder3

		jmp invalidSelection		;go invalid function if all 'if' not achieve (invalid selection for payment option)


	tocashPayment:					;cant reach due to exceed byte
		jmp cashPayment
		
	tocardPayment:
		jmp cardPayment

	toonlineBank:
		jmp onlineBank

	invalidSelection:
		MOV	AH , 02H			; set position of cursor 
		MOV	BH , 00
		MOV	DH , 11
		MOV	DL , 15
		INT	10H
		
		MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
		MOV	BH , 74H							
		MOV	CX , 0B00H
		MOV	DX , 0B4FH
		INT	10H
	
		mov ah, 09h					;Msg :print invalid message for invalid input
		lea dx, invalidProceed2
		int 21h
		
		MOV	AH , 02H			; set position of cursor 
		MOV	BH , 00
		MOV	DH , 12
		MOV	DL , 15
		INT	10H

		MOV AH, 09H				
		LEA DX, anyKey		;display anyKey	
		INT 21H		
		
		MOV AH, 01H				
		INT 21H		
		
		jmp getOption				;get new payment option (invalid selection)

	cashPayment:
		MOV	AX , 0600H			; screen clearing + set the background to white and font to black
		MOV	BH , 70H							
		MOV	CX , 0B00H
		MOV	DX , 184FH
		INT	10H
			
		mov ax, gtQuo
		mov gttlQuo, ax				;set all variable to zero before calculation
		mov paidAmt,0
		mov change,0
		mov enufnot,2
		mov	ax, gtRem
		mov gttlRem, ax			;set all variable to zero before calculation
		mov paidAmtsen,0
		
		MOV	AH , 02H		; set the cursor position
		MOV	BH , 00
		MOV	DH , 11
		MOV	DL , 15
		INT	10H
		
		mov ah, 09h					;Msg :print cash pay info
		lea dx, cashpay
		int 21h
			
		;mov digitsEntered, 0	
		read:			
			mov ah, 01h					;get total amt of paid
			int 21h		
					
			cmp al,2Eh					;if character enter = '.' stop reading & go readsen(to get sen paid)
			je readsen
			
			cmp al,0dh					;if character enter = 'enter' stop reading(finish input of paid(no sen))
			je endread
			
			cmp al,30h					;if character enter <0 read again (not integer)
			jl errorinput
			
			cmp al,39h					;if character enter >9 stop reading (not integer)
			jg errorinput
				
			mov cl,0
			mov cl,al					;move read value into al register
			sub cl, 30h 				;ascii to integer
			mov ch, 00
			
			mov ax,paidAmt				;multiply digit in paidAmt with 10
			mov bl,10					;e.g. digits in paidAmt =4
			mul bl						;4*10=40
			add ax,cx					;add digits latest enter with the ans multiplied (e.g. 40+2)
			mov paidAmt,ax				;store ans into paidAmt
			
			cmp paidAmt, 03E7H
			ja errorinput

			jmp read					;to get next digits
			
		errorinput:
			MOV	AH , 02H		; set the cursor position
			MOV	BH , 00
			MOV	DH , 13
			MOV	DL , 15
			INT	10H
			
			MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
			MOV	BH , 74H							
			MOV	CX , 0D00H
			MOV	DX , 0D4FH
			INT	10H
			
			mov ah, 09h					;Msg: Invalid input of amount
			lea dx, errorinputMsg
			int 21h
			
			MOV	AH , 02H			; set position of cursor 
			MOV	BH , 00
			MOV	DH , 14
			MOV	DL , 15
			INT	10H

			MOV AH, 09H				
			LEA DX, anyKey		;display anyKey	
			INT 21H		
			
			MOV AH, 01H				
			INT 21H	
			
			jmp cashPayment
			
		readsen:
			mov ah, 01h					;get total amt of order (unit sen)
			int 21h
			
			cmp al,0dh					;if character enter = 'enter' stop reading
			je endreadsen
			
			cmp al,30h					;if character enter <0 read again (not integer)
			jl errorinput
			
			cmp al,39h					;if character enter >9 stop reading (not integer)
			jg errorinput
			
			mov cl,0
			mov cl,al					;move read value into al register
			sub cl, 30h 				;ascii to integer
			
			mov ax,paidAmtsen			;multiply digit in ttlAmount with 10
			mov bl,10					;e.g. digits in ttlAmount =3
			mul bl						;3*10=30
			add ax,cx					;add digits latest enter with the ans multiplied (e.g. 30+3)
			mov paidAmtsen,ax			;store ans into ttlAmount
			
			cmp paidAmtsen, 64H
			jae errorinput

			jmp readsen					;to get next digits
			
		endreadsen:	
		endread:
			MOV	AH , 02H		; set the cursor position
			MOV	BH , 00
			MOV	DH , 12
			MOV	DL , 15
			INT	10H
		
			mov ah, 09h					;Msg: check the user input correct amount
			lea dx, correctInMsg
			int 21h
			
			MOV	AH , 0AH			;get choice
			LEA	DX , userChoice
			INT	 21H
			
			.386							;tell computer want to use advanced CPU instructions
			MOVZX   BX , userChoice_act		;move zero extension from actual to bx
			MOV	userChoice_buf[BX] , '$'
			
			;mov userChoice_buf,al
			
			;mov al,correctInput			;after the user confirm, proceed the process
			cmp userChoice_buf, "y"
			je correctEnter
			cmp userChoice_buf, "Y"
			je correctEnter
			cmp userChoice_buf, "n"
			je cashPayment
			cmp userChoice_buf, "N"
			je cashPayment
			
			MOV	AH , 02H			; set position of cursor 
			MOV	BH , 00
			MOV	DH , 14
			MOV	DL , 15
			INT	10H
			
			MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
			MOV	BH , 74H							
			MOV	CX , 0E00H
			MOV	DX , 0E4FH
			INT	10H
			
			MOV AH, 09H				
			LEA DX, invalidYesNo	;print invalidYesNo msg 		
			INT 21H			
			
			MOV	AH , 02H			; set position of cursor 
			MOV	BH , 00
			MOV	DH , 15
			MOV	DL , 15
			INT	10H

			MOV AH, 09H				
			LEA DX, anyKey		;display anyKey	
			INT 21H		
			
			MOV AH, 01H				
			INT 21H		
			
			MOV	AX , 0600H			; screen clearing + set the background to white and font to black
			MOV	BH , 70H							
			MOV	CX , 0C00H
			MOV	DX , 184FH
			INT	10H
			
			jmp endread				;back to get payment amount again if user didnt confirm
		
		correctEnter:
			MOV	AH , 02H		; set the cursor position
			MOV	BH , 00
			MOV	DH , 14
			MOV	DL , 15
			INT	10H
						
			MOV AH, 09H		
			LEA DX, grandTotalMsg2    	; display grandtotal message Grand total: RM XX.XX
			INT 21H	
			
			MOV AH, 02H					; display grandtotal
			MOV BX, 0
			MOV DL, afterTaxValue[bx]
			INT 21H
				
			MOV AH, 02H
			MOV BX, 1
			MOV DL, afterTaxValue[bx]
			INT 21H
				
			MOV AH, 02H
			MOV BX, 2
			MOV DL, afterTaxValue[bx]
			INT 21H
			
			MOV AH, 02H
			MOV DL, "."
			INT 21H
			
			MOV AH, 02H
			MOV BX, 3
			MOV DL, afterTaxValue[bx]
			INT 21H
			
			MOV AH, 02H
			MOV BX, 4
			MOV DL, afterTaxValue[bx]
			INT 21H
			
			MOV	AH , 02H		; set the cursor position
			MOV	BH , 00
			MOV	DH , 15
			MOV	DL , 15
			INT	10H
			
			mov ah,09h					;Msg: display changes title
			lea dx,changeMsg
			int 21h
			
			mov sen,0
			
	paycalc:		
		cmp sen,1
		je calc1
		
		mov ax, paidAmt
		cmp ax,gttlQuo
		jg RMEnuf
		
		cmp ax,gttlQuo
		jl RMNotEnuf
		
		jmp calc1
		
	RMNotEnuf:
		mov enufnot,0
		jmp senDefine
		
	RMEnuf:
		mov enufnot,1
		jmp senDefine
	
	tomoresen:
		jmp moresen
		
	tolessSen:
		jmp lessSen
		
	senDefine:	
		mov ax,paidAmtSen
		cmp ax,gttlRem
		jl tolessSen
		
		mov ax,paidAmtSen
		cmp ax,0
		je tosen0alter
		
		mov al, enufnot
		cmp al,0
		je tomoresen
		
	calc1:
		mov ax,paidAmt				;calculate the changes
		mov bx,gttlQuo
		sub ax,bx					;subtract ttlAmount(the total of order) from paidAmt(amount paid by customers)
		add ax, 30h
		mov change,ax				;set the change value
		
	calc2:
		mov ax, change				;compare if change > 9 - will present other characters than numbers
		cmp ax,39h
		jg toexceedten				;use other method to display if > 9
		
		cmp ax, 30h					;compare if change < 0 - present failure
		jl tonegativechange
		
		cmp sen,0
		je displayChange
		
	displayZero:
		mov ah, 02h					;to display the first 0 for sen unit when the sen changes is only one digit
		mov dl, "0"
		int 21h
		
	displayChange:
		mov ah, 02h					;display the change
		mov dx, change
		int 21h
		
	calcsen:
		mov al,sen
		cmp al,1
		je toprocess
		
		mov ah, 02h
		mov dl, "."
		int 21h
		
		mov sen,1
		
		mov ax, paidAmtSen
		mov paidAmt, ax
		mov ax, gttlRem
		mov gttlQuo, ax
		
		jmp calc1
		
	toprocess:
		mov sen,0
		
		mov ah, 09h					;newline
		lea   dx, newline
		int    21h		
		mov ah, 09h					;newline
		lea   dx, newline
		int    21h
		
		jmp process
		
	tosen0alter:
		jmp sen0alter
		
	toexceedten:
		jmp exceedten
		
	tonegativechange:
		jmp negativechange
		
	lessSen:
		mov al, enufnot
		cmp al, 0
		je lessNgtsen
		
		cmp al, 1
		je lessPstsen
		
	lessPstsen:		
		mov ax,paidAmtSen
		cmp ax,gttlRem
		jg moresen
		
		mov ax,paidAmtSen
		add ax,100
		mov paidAmtSen,ax
		sub paidAmt,1
		
		jmp calc1
	
	moresen:
		mov ax,paidAmtSen
		cmp ax,gttlRem
		je tocalc1
		
		mov ax,gttlRem
		add ax,100
		mov gttlRem,ax
		sub gttlQuo,1
		
		jmp calc1
		
	lessNgtsen:			
		jmp negativechange
		
	sen0alter:
		mov al, enufnot
		cmp al,1
		je tocalc1
		
		mov ax, gttlRem
		cmp ax,0
		je tocalc1
		
		mov ax,paidAmtSen
		add ax,100
		mov paidAmtSen,ax
		sub paidAmt,1
		
		jmp calc1
		
	tocalc1:
		jmp calc1
	
	exceedten:
		mov quotient,0
		mov valuer,0
		mov valuer2,0
	
	exceedten2:
		sub change,30h				;ascii to integer
		mov ax,change				;divide value in change by 10 (e.g. 13)
		mov bl, 10					;13 / 10 =1 r 3
		div bl						;al store 1, ah store 3
		mov quotient,al				;set quotient into 1
		mov valuer, ah				;set valuer into 3
		add quotient, 30h			;add 30h (48) to quotient -turn back ascii
		add valuer, 30h				;add 30h (48) to valuer -turn back ascii
		
		cmp quotient,39h
		jg quotientexceedten
		
		mov ah, 02h					;print quotient(represent tenth-place digits)
		mov dl, quotient
		int 21h
		
		mov ah, 02h					;print remainder(represent ones-place digits)		
		mov dl, valuer
		int 21h
		
		mov ah,valuer2
		cmp ah,0
		jg display3dgt
		
		jmp calcsen
	
	display3dgt:
		mov ah, 02h					;print remainder(represent ones-place digits)		
		mov dl, valuer2
		int 21h
		
		jmp calcsen
	
	quotientexceedten:
		mov ah, valuer
		mov valuer2, ah
		
		mov ax, 0
		mov al,quotient
		mov change,ax
		jmp exceedten2
		
	negativechange:
		mov ah, sen
		cmp ah,1
		je negativeSenChange
		
		mov ah, 02h
		mov dl, " "
		int 21h
		
		mov ah, 02h
		mov dl, "-"
		int 21h
		
		MOV	AH , 02H		; set the cursor position
		MOV	BH , 00
		MOV	DH , 16
		MOV	DL , 15
		INT	10H
		
		MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
		MOV	BH , 74H							
		MOV	CX , 1000H
		MOV	DX , 104FH
		INT	10H
		
		mov ah, 09h
		lea dx, notenufMsg
		int 21h
		
	cont_negativeChange:
		mov ax, paidAmt
		mov bx, gttlQuo
		sub bx,ax
		mov change,bx
		add change, 30h
		
		mov ax, change
		cmp ax, 39h
		jg goexceedten
		
		mov ah, 02h
		mov dx, change
		int 21h
		
		jmp calcsen

	negativeSenChange:
		mov ax, paidAmtSen
		mov paidAmt, ax
		mov ax, gttlRem
		mov gttlQuo, ax
		
		jmp cont_negativeChange
		
	goexceedten:
		jmp exceedten
		
	cardPayment:
		MOV	AH , 02H		; set the cursor position
		MOV	BH , 00
		MOV	DH , 11
		MOV	DL , 15
		INT	10H
	
		mov ah, 09h					;print card pay info
		lea   dx, cardPay
		int    21h
		
		jmp process

	onlineBank:
		MOV	AH , 02H		; set the cursor position
		MOV	BH , 00
		MOV	DH , 11
		MOV	DL , 15
		INT	10H
		
		mov ah, 09h					;print online pay info
		lea dx, onlinePay
		int    21h
		
		jmp process

	process:
	pay:
		MOV	AX , 0600H			; screen clearing + set the background to white and font to black
		MOV	BH , 70H							
		MOV	CX , 1300H
		MOV	DX , 184FH
		INT	10H
	
		MOV	AH , 02H		; set the cursor position
		MOV	BH , 00
		MOV	DH , 19
		MOV	DL , 15
		INT	10H
	
		mov ah, 09h					;ask if payment success
		lea   dx, confirmMsg
		int    21h

		MOV	AH , 0AH			;get choice
		LEA	DX , userChoice
		INT	 21H
		
		.386							;tell computer want to use advanced CPU instructions
		MOVZX   BX , userChoice_act		;move zero extension from actual to bx
		MOV	userChoice_buf[BX] , '$'

		;mov al, success				;if yes (uppercase) go successpay
		cmp userChoice_buf, "y"
		je successPay

		;mov al, success				;if yes (lowercase) go successpay
		cmp userChoice_buf, "Y"
		je successPay

		;mov al, success				;if no (uppercase) go unsuccessPay
		cmp userChoice_buf, "n"
		je unsuccessPay

		;mov al, success				;if no (lowercase) go unsuccessPay
		cmp userChoice_buf, "N"
		je unsuccessPay

		jmp invalidOpt				;if all case not achieve will show invalid input

	invalidOpt:
		MOV	AH , 02H		; set the cursor position
		MOV	BH , 00
		MOV	DH , 21
		MOV	DL , 15
		INT	10H
		
		MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
		MOV	BH , 74H							
		MOV	CX , 1500H
		MOV	DX , 154FH
		INT	10H
	
		mov ah, 09h					;Msg: invalid selection
		lea dx, invalidYesNo
		int 21h
		
		MOV	AH , 02H			; set position of cursor 
		MOV	BH , 00
		MOV	DH , 22
		MOV	DL , 15
		INT	10H

		MOV AH, 09H				
		LEA DX, anyKey		;display anyKey	
		INT 21H	

		MOV AH, 01H				
		INT 21H	
		
		jmp pay						;back to get correct input (whether success pay?)

	successPay:	
		MOV	AX , 0600H			; screen clearing + set the background to white and font to black
		MOV	BH , 70H							
		MOV	CX , 0000H
		MOV	DX , 184FH
		INT	10H
	
		MOV	AH , 02H			; set position of cursor 
		MOV	BH , 00
		MOV	DH , 09
		MOV	DL , 30
		INT	10H
		
		MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
		MOV	BH , 71H							
		MOV	CX , 0900H
		MOV	DX , 094FH
		INT	10H
	
		mov ah, 09h					;display successful payment message
		lea dx, successMsg
		int 21h
		
		jmp continueNextOrder		;continue next order

	unsuccessPay:
		MOV	AH , 02H			; set position of cursor 
		MOV	BH , 00
		MOV	DH , 21
		MOV	DL , 15
		INT	10H
		
		MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
		MOV	BH , 74H							
		MOV	CX , 1500H
		MOV	DX , 154FH
		INT	10H
		
		MOV AH, 09H					;print try again message
		LEA DX, trymsg
		INT 21H
		
		MOV AH,01H					;accept input to continue payment method or proceed to others
		INT 21H
		
		;mov againInput,al
		
		jmp payment


	togetnewOption:					;too far from paymentmenu
		jmp paymentmenu

	continueNextOrder:
		MOV	AX , 0600H			; screen clearing + set the background to white and font to black
		MOV	BH , 70H							
		MOV	CX , 0E00H
		MOV	DX , 184FH
		INT	10H
	
		MOV	AH , 02H		; set the cursor position
		MOV	BH , 00
		MOV	DH , 14
		MOV	DL , 20
		INT	10H
	
		mov ah, 09h					;Msg :continue to next order
		lea   dx, continueMsg
		int    21h
		
		MOV	AH , 0AH			;get choice
		LEA	DX , userChoice
		INT	 21H
		
		.386							;tell computer want to use advanced CPU instructions
		MOVZX   BX , userChoice_act		;move zero extension from actual to bx
		MOV	userChoice_buf[BX] , '$'

		;mov al, continue			;if yes (uppercase && lowercase)
		cmp userChoice_buf, "y"
		je jumptofoodmenu3
		cmp userChoice_buf, "Y"
		je jumptofoodmenu3

		;mov userChoice_buf, continue			;if no (uppercase && lowercase)
		cmp userChoice_buf, "n"
		je jumptomain1
		cmp userChoice_buf, "N"
		je jumptomain1

		jmp invalidCont				;all if case not achieve go to show invalid message

	invalidCont:
		;if not y or n, print invalidYesNo msg and reprompt
		MOV	AH , 02H			; set position of cursor 
		MOV	BH , 00
		MOV	DH , 16
		MOV	DL , 20
		INT	10H
		
		MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
		MOV	BH , 74H							
		MOV	CX , 1000H
		MOV	DX , 104FH
		INT	10H
		
		MOV AH, 09H				
		LEA DX, invalidYesNo	;print invalidYesNo msg 		
		INT 21H		
		MOV AH, 09H		
		
		MOV	AH , 02H			; set position of cursor 
		MOV	BH , 00
		MOV	DH , 17
		MOV	DL , 20
		INT	10H

		MOV AH, 09H				
		LEA DX, anyKey		;display anyKey	
		INT 21H		
		
		MOV AH, 01H				
		INT 21H		
		
		jmp continueNextOrder		;back getting correct input for (whether to continue ordering?)

	jumptofoodmenu3:
		jmp foodmenu
			
	jumptomain1:
		jmp starting

	cancelOrder3:
		MOV	AX , 0600H			; screen clearing + set the background to white and foreground to black
		MOV	BH , 70H							
		MOV	CX , 0B00H
		MOV	DX , 184FH
		INT	10H
		
		MOV	AH , 02H		; set the cursor position
		MOV	BH , 00
		MOV	DH , 11
		MOV	DL , 15
		INT	10H
	
		MOV AH, 09H				;ask confirmation to cancel order
		lea Dx, cancelOrderConfirmMsg 	
		INT 21H	
		
		MOV	AH , 0AH			;get choice
		LEA	DX , userChoice
		INT	 21H
		
		.386							;tell computer want to use advanced CPU instructions
		MOVZX   BX , userChoice_act		;move zero extension from actual to bx
		MOV	userChoice_buf[BX] , '$'
		
		;check is yes or no
		mov al, userChoice_buf		;if yes, list out menu again
		cmp al, "y"
		je	jumptofoodmenu4

		mov al, userChoice_buf	
		cmp al, "Y"
		je	jumptofoodmenu4

		mov al, userChoice_buf		;if no, list out short summary
		cmp al, "n"
		je	payment

		mov al, userChoice_buf	
		cmp al, "N"
		je	payment
		
		;if not y or n, print invalidYesNo msg and reprompt
		MOV	AH , 02H			; set position of cursor 
		MOV	BH , 00
		MOV	DH , 13
		MOV	DL , 15
		INT	10H
		
		MOV	AX , 0600H			; screen clearing + set the background to white and foreground to red
		MOV	BH , 74H							
		MOV	CX , 0D00H
		MOV	DX , 0D4FH
		INT	10H
		
		MOV AH, 09H				
		LEA DX, invalidYesNo	;print invalidYesNo msg 		
		INT 21H		
		MOV AH, 09H		
		
		MOV	AH , 02H			; set position of cursor 
		MOV	BH , 00
		MOV	DH , 14
		MOV	DL , 15
		INT	10H

		MOV AH, 09H				
		LEA DX, anyKey		;display anyKey	
		INT 21H		
		
		MOV AH, 01H				
		INT 21H		
	
		jmp cancelOrder3

	
	jumptofoodmenu4:
		jmp foodmenu
		

exit:	
	MOV	AX , 0600H								; screen clearing + set the background to white and foreground to green
	MOV	BH , 70H							
	MOV	CX , 0000H
	MOV	DX , 184FH
	INT	10H
		
	MOV	AH , 02H								; set the cursor position
	MOV	BH , 00
	MOV	DH , 09
	MOV	DL , 33
	INT	10H
	
	MOV AH, 09H			
	LEA DX, goodbyeMsg		;print goodbye message
	INT 21H		
	
	MOV     CX, 0FH			; delay 1 second
	MOV     DX, 4240H
	MOV     AH, 86H
	INT     15H
	
	MOV	AX , 0600H						; screen clearing + set the background to white and foreground to green
	MOV	BH , 0FH							
	MOV	CX , 0000H
	MOV	DX , 184FH
	INT	10H
	
	mov ax, 4C00h
	int 21h
	
	main endp
end main


