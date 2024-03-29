" Vim syntax file
" Language:     ARM Assembler
" Maintainer:   Gerald S. Williams <gsw@agere.com>
" Last Change:  2005 Mar 16
" URL:          http://www.vim.org
" Revision:     1.2
"
" based on PIC16F84 Assembler syntax file (pic.vim) by Aleksandar Veselinovic

" This includes V2, V3, V4, V5, T, E, M, XS, and VFP extensions

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

setlocal iskeyword+=.

syn case match
syn keyword armasmTodo		NOTE TODO XXX contained


syn case ignore

syn match armasmIdentifier	"[a-z_$][a-z0-9_$]*"
syn match armasmLabel		"^[a-zA-Z_$][a-zA-Z0-9_$]*"
syn region armasmLabel		start="||" end="||" oneline
syn region armasmLabel		start="|" end="|" oneline

syn match armasmAddress		"^[0-9a-fA-F][0-9a-fA-F]\{7\}"
syn match armasmInstrBin	"\t\([ ]*[0-9a-fA-F]\{4\}[ ]*\|[0-9a-fA-F]\{8\}\)\t"

syn region armasmASCII		start="'" end="'" skip="\\'" oneline
syn match armasmDecimal		"\d\+[^a-fA-F]"
syn match armasmDecimal		"#\d\+"
syn match armasmHexadecimal	"0[xX]\x\+"
syn match armasmHexadecimal	"#0[xX]\x\+"
syn match armasmHexadecimal	"&\x\+"
syn match armasmBinary		"2_[0-1]\+"
syn match armasmBinary		"0[bB][0-1]\+"
syn match armasmBase3		"3_[0-2]\+"
syn match armasmBase4		"4_[0-3]\+"
syn match armasmBase5		"5_[0-4]\+"
syn match armasmBase6		"6_[0-5]\+"
syn match armasmBase7		"7_[0-6]\+"
syn match armasmOctal		"8_[0-7]\o*"
syn match armasmBase9		"9_[0-8]\+"
syn match armasmFloat		"-\=[0-9]\+[eE]-\=[0-9]\+"
syn match armasmFloat		"-\=[0-9]*\.[0-9]\+\([eE]-\=[0-9]\+\)\="
syn match armasmBoolean		"{TRUE}"
syn match armasmBoolean		"{FALSE}"

syn match armasmBuiltIn		"{PC}"
syn match armasmBuiltIn		"{VAR}"
syn match armasmBuiltIn		"{TRUE}"
syn match armasmBuiltIn		"{FALSE}"
syn match armasmBuiltIn		"{OPT}"
syn match armasmBuiltIn		"{CONFIG}"
syn match armasmBuiltIn		"{ENDIAN}"
syn match armasmBuiltIn		"{CODESIZE}"
syn match armasmBuiltIn		"{CPU}"
syn match armasmBuiltIn		"{FPU}"
syn match armasmBuiltIn		"{ARCHITECTURE}"
syn match armasmBuiltIn		"{PCSTOREOFFSET}"
syn match armasmBuiltIn		"{ARMASM_VERSION}"
syn match armasmBuiltIn		"{INTER}"
syn match armasmBuiltIn		"{ROPI}"
syn match armasmBuiltIn		"{RWPI}"
syn match armasmBuiltIn		"{SWST}"
syn match armasmBuiltIn		"{NOSWST}"

" TODO: consider handling for string expansions ($x)

syn match armasmComment		";.*" contains=armasmTodo
syn match armasmComment		"@.*" contains=armasmTodo
syn match armasmComment		"//.*" contains=armasmTodo
syn region armasmComment	matchgroup=armasmCommentStart start="/\*" end="\*/" contains=armasmTodo extend
syn match armasmIfdef		"\#\(include\|ifdef\|ifndef\|define\|error\|if\|endif\|else\|elif\)"

syn region armasmString		start=+"+ end=+"+ oneline

syn match armasmOperator	":BASE:"
syn match armasmOperator	":INDEX:"
syn match armasmOperator	":LEN:"
syn match armasmOperator	":CHR:"
syn match armasmOperator	":STR:"
syn match armasmOperator	":NOT:"
syn match armasmOperator	":LNOT:"
syn match armasmOperator	":DEF:"
syn match armasmOperator	":SB_OFFSET_19_12:"
syn match armasmOperator	":SB_OFFSET_11_0:"
syn match armasmOperator	":MOD:"
syn match armasmOperator	":LEFT:"
syn match armasmOperator	":RIGHT:"
syn match armasmOperator	":CC:"
syn match armasmOperator	":ROL:"
syn match armasmOperator	":ROR:"
syn match armasmOperator	":SHL:"
syn match armasmOperator	":SHR:"
syn match armasmOperator	":AND:"
syn match armasmOperator	":OR:"
syn match armasmOperator	":EOR:"
syn match armasmOperator	":LAND:"
syn match armasmOperator	":LOR:"
syn match armasmOperator	":LEOR:"


syn keyword armasmRegister	r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13
syn keyword armasmRegister	r14 r15
syn keyword armasmRegister	pc lr sp ip sl sb fp
syn keyword armasmRegister	a1 a2 a3 a4
syn keyword armasmRegister	cpsr cpsr_c cpsr_x cpsr_s cpsr_f cpsr_cx
syn keyword armasmRegister	cpsr_cxs cpsr_xs cpsr_xsf cpsr_sf cpsr_cxsf
syn keyword armasmRegister	spsr spsr_c spsr_x spsr_s spsr_f spsr_cx
syn keyword armasmRegister	spsr_cxs spsr_xs spsr_xsf spsr_sf spsr_cxsf
syn keyword armasmRegister	p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13
syn keyword armasmRegister	p14 p15
syn keyword armasmRegister	c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13
syn keyword armasmRegister	c14 c15
syn keyword armasmRegister	f0 f1 f2 f3 f4 f5 f6 f7

" ARM v8 general purpose regs
syn keyword armasmRegister	x0 x1 x2 x3 x4 x5 x6 x7 x8 x9
syn keyword armasmRegister	x10 x11 x12 x13 x14 x15 x16 x17 x18 x19
syn keyword armasmRegister	x20 x21 x22 x23 x24 x25 x26 x27 x28 x29
syn keyword armasmRegister	x30 x31 xzr
syn keyword armasmRegister	w0 w1 w2 w3 w4 w5 w6 w7 w8 w9
syn keyword armasmRegister	w10 w11 w12 w13 w14 w15 w16 w17 w18 w19
syn keyword armasmRegister	w20 w21 w22 w23 w24 w25 w26 w27 w28 w29
syn keyword armasmRegister	w30 w31 wzr

" ARM v8 SIMD/VFP regs
syn keyword armasmRegister	b0 b1 b2 b3 b4 b5 b6 b7 b8 b9
syn keyword armasmRegister	b10 b11 b12 b13 b14 b15 b16 b17 b18 b19
syn keyword armasmRegister	b20 b21 b22 b23 b24 b25 b26 b27 b28 b29
syn keyword armasmRegister	b30 b31
syn keyword armasmRegister	h0 h1 h2 h3 h4 h5 h6 h7 h8 h9
syn keyword armasmRegister	h10 h11 h12 h13 h14 h15 h16 h17 h18 h19
syn keyword armasmRegister	h20 h21 h22 h23 h24 h25 h26 h27 h28 h29
syn keyword armasmRegister	h30 h31
syn keyword armasmRegister	s0 s1 s2 s3 s4 s5 s6 s7 s8 s9
syn keyword armasmRegister	s10 s11 s12 s13 s14 s15 s16 s17 s18 s19
syn keyword armasmRegister	s20 s21 s22 s23 s24 s25 s26 s27 s28 s29
syn keyword armasmRegister	s30 s31
syn keyword armasmRegister	d0 d1 d2 d3 d4 d5 d6 d7 d8 d9
syn keyword armasmRegister	d10 d11 d12 d13 d14 d15 d16 d17 d18 d19
syn keyword armasmRegister	d20 d21 d22 d23 d24 d25 d26 d27 d28 d29
syn keyword armasmRegister	d30 d31
syn keyword armasmRegister	q0 q1 q2 q3 q4 q5 q6 q7 q8 q9
syn keyword armasmRegister	q10 q11 q12 q13 q14 q15 q16 q17 q18 q19
syn keyword armasmRegister	q20 q21 q22 q23 q24 q25 q26 q27 q28 q29
syn keyword armasmRegister	q30 q31
syn keyword armasmRegister	v0 v1 v2 v3 v4 v5 v6 v7 v8 v9
syn keyword armasmRegister	v10 v11 v12 v13 v14 v15 v16 v17 v18 v19
syn keyword armasmRegister	v20 v21 v22 v23 v24 v25 v26 v27 v28 v29
syn keyword armasmRegister	v30 v31
syn keyword armasmRegister	v0.b v1.b v2.b v3.b v4.b v5.b v6.b v7.b v8.b v9.b
syn keyword armasmRegister	v10.b v11.b v12.b v13.b v14.b v15.b v16.b v17.b v18.b v19.b
syn keyword armasmRegister	v20.b v21.b v22.b v23.b v24.b v25.b v26.b v27.b v28.b v29.b
syn keyword armasmRegister	v30.b v31.b
syn keyword armasmRegister	v0.h v1.h v2.h v3.h v4.h v5.h v6.h v7.h v8.h v9.h
syn keyword armasmRegister	v10.h v11.h v12.h v13.h v14.h v15.h v16.h v17.h v18.h v19.h
syn keyword armasmRegister	v20.h v21.h v22.h v23.h v24.h v25.h v26.h v27.h v28.h v29.h
syn keyword armasmRegister	v30.h v31.h
syn keyword armasmRegister	v0.s v1.s v2.s v3.s v4.s v5.s v6.s v7.s v8.s v9.s
syn keyword armasmRegister	v10.s v11.s v12.s v13.s v14.s v15.s v16.s v17.s v18.s v19.s
syn keyword armasmRegister	v20.s v21.s v22.s v23.s v24.s v25.s v26.s v27.s v28.s v29.s
syn keyword armasmRegister	v30.s v31.s
syn keyword armasmRegister	v0.d v1.d v2.d v3.d v4.d v5.d v6.d v7.d v8.d v9.d
syn keyword armasmRegister	v10.d v11.d v12.d v13.d v14.d v15.d v16.d v17.d v18.d v19.d
syn keyword armasmRegister	v20.d v21.d v22.d v23.d v24.d v25.d v26.d v27.d v28.d v29.d
syn keyword armasmRegister	v30.d v31.d
syn keyword armasmRegister	v0.q v1.q v2.q v3.q v4.q v5.q v6.q v7.q v8.q v9.q
syn keyword armasmRegister	v10.q v11.q v12.q v13.q v14.q v15.q v16.q v17.q v18.q v19.q
syn keyword armasmRegister	v20.q v21.q v22.q v23.q v24.q v25.q v26.q v27.q v28.q v29.q
syn keyword armasmRegister	v30.q v31.q

syn keyword armasmOpcode	MOV MOVEQ MOVNE MOVCS MOVHS MOVCC MOVLO
syn keyword armasmOpcode	MOVMI MOVPL MOVVS MOVVC MOVHI MOVLS
syn keyword armasmOpcode	MOVGE MOVLT MOVGT MOVLE MOVAL
syn keyword armasmOpcode	MOVS MOVEQS MOVNES MOVCSS MOVHSS MOVCCS MOVLOS
syn keyword armasmOpcode	MOVMIS MOVPLS MOVVSS MOVVCS MOVHIS MOVLSS
syn keyword armasmOpcode	MOVGES MOVLTS MOVGTS MOVLES MOVALS MOVW MOVT

syn keyword armasmOpcode	MVN MVNEQ MVNNE MVNCS MVNHS MVNCC MVNLO
syn keyword armasmOpcode	MVNMI MVNPL MVNVS MVNVC MVNHI MVNLS
syn keyword armasmOpcode	MVNGE MVNLT MVNGT MVNLE MVNAL
syn keyword armasmOpcode	MVNS MVNEQS MVNNES MVNCSS MVNHSS MVNCCS MVNLOS
syn keyword armasmOpcode	MVNMIS MVNPLS MVNVSS MVNVCS MVNHIS MVNLSS
syn keyword armasmOpcode	MVNGES MVNLTS MVNGTS MVNLES MVNALS

syn keyword armasmOpcode	MRS MRSEQ MRSNE MRSCS MRSHS MRSCC MRSLO
syn keyword armasmOpcode	MRSMI MRSPL MRSVS MRSVC MRSHI MRSLS
syn keyword armasmOpcode	MRSGE MRSLT MRSGT MRSLE MRSAL

syn keyword armasmOpcode	MSR MSREQ MSRNE MSRCS MSRHS MSRCC MSRLO
syn keyword armasmOpcode	MSRMI MSRPL MSRVS MSRVC MSRHI MSRLS
syn keyword armasmOpcode	MSRGE MSRLT MSRGT MSRLE MSRAL

syn keyword armasmOpcode	MRA MRAEQ MRANE MRACS MRAHS MRACC MRALO
syn keyword armasmOpcode	MRAMI MRAPL MRAVS MRAVC MRAHI MRALS
syn keyword armasmOpcode	MRAGE MRALT MRAGT MRALE MRAAL

syn keyword armasmOpcode	MAR MAREQ MARNE MARCS MARHS MARCC MARLO
syn keyword armasmOpcode	MARMI MARPL MARVS MARVC MARHI MARLS
syn keyword armasmOpcode	MARGE MARLT MARGT MARLE MARAL

syn keyword armasmOpcode	ADD ADDEQ ADDNE ADDCS ADDHS ADDCC ADDLO
syn keyword armasmOpcode	ADDMI ADDPL ADDVS ADDVC ADDHI ADDLS
syn keyword armasmOpcode	ADDGE ADDLT ADDGT ADDLE ADDAL
syn keyword armasmOpcode	ADDS ADDEQS ADDNES ADDCSS ADDHSS ADDCCS ADDLOS
syn keyword armasmOpcode	ADDMIS ADDPLS ADDVSS ADDVCS ADDHIS ADDLSS
syn keyword armasmOpcode	ADDGES ADDLTS ADDGTS ADDLES ADDALS

syn keyword armasmOpcode	ADC ADCEQ ADCNE ADCCS ADCHS ADCCC ADCLO
syn keyword armasmOpcode	ADCMI ADCPL ADCVS ADCVC ADCHI ADCLS
syn keyword armasmOpcode	ADCGE ADCLT ADCGT ADCLE ADCAL
syn keyword armasmOpcode	ADCS ADCEQS ADCNES ADCCSS ADCHSS ADCCCS ADCLOS
syn keyword armasmOpcode	ADCMIS ADCPLS ADCVSS ADCVCS ADCHIS ADCLSS
syn keyword armasmOpcode	ADCGES ADCLTS ADCGTS ADCLES ADCALS

syn keyword armasmOpcode	QADD QADDEQ QADDNE QADDCS QADDHS QADDCC QADDLO
syn keyword armasmOpcode	QADDMI QADDPL QADDVS QADDVC QADDHI QADDLS
syn keyword armasmOpcode	QADDGE QADDLT QADDGT QADDLE QADDAL

syn keyword armasmOpcode	QDADD QDADDEQ QDADDNE QDADDCS QDADDHS QDADDCC
syn keyword armasmOpcode	QDADDLO QDADDMI QDADDPL QDADDVS QDADDVC QDADDHI
syn keyword armasmOpcode	QDADDLS QDADDGE QDADDLT QDADDGT QDADDLE QDADDAL

syn keyword armasmOpcode	SUB SUBEQ SUBNE SUBCS SUBHS SUBCC SUBLO
syn keyword armasmOpcode	SUBMI SUBPL SUBVS SUBVC SUBHI SUBLS
syn keyword armasmOpcode	SUBGE SUBLT SUBGT SUBLE SUBAL
syn keyword armasmOpcode	SUBS SUBEQS SUBNES SUBCSS SUBHSS SUBCCS SUBLOS
syn keyword armasmOpcode	SUBMIS SUBPLS SUBVSS SUBVCS SUBHIS SUBLSS
syn keyword armasmOpcode	SUBGES SUBLTS SUBGTS SUBLES SUBALS

syn keyword armasmOpcode	SBC SBCEQ SBCNE SBCCS SBCHS SBCCC SBCLO
syn keyword armasmOpcode	SBCMI SBCPL SBCVS SBCVC SBCHI SBCLS
syn keyword armasmOpcode	SBCGE SBCLT SBCGT SBCLE SBCAL
syn keyword armasmOpcode	SBCS SBCEQS SBCNES SBCCSS SBCHSS SBCCCS SBCLOS
syn keyword armasmOpcode	SBCMIS SBCPLS SBCVSS SBCVCS SBCHIS SBCLSS
syn keyword armasmOpcode	SBCGES SBCLTS SBCGTS SBCLES SBCALS

syn keyword armasmOpcode	RSB RSBEQ RSBNE RSBCS RSBHS RSBCC RSBLO
syn keyword armasmOpcode	RSBMI RSBPL RSBVS RSBVC RSBHI RSBLS
syn keyword armasmOpcode	RSBGE RSBLT RSBGT RSBLE RSBAL
syn keyword armasmOpcode	RSBS RSBEQS RSBNES RSBCSS RSBHSS RSBCCS RSBLOS
syn keyword armasmOpcode	RSBMIS RSBPLS RSBVSS RSBVCS RSBHIS RSBLSS
syn keyword armasmOpcode	RSBGES RSBLTS RSBGTS RSBLES RSBALS

syn keyword armasmOpcode	RSC RSCEQ RSCNE RSCCS RSCHS RSCCC RSCLO
syn keyword armasmOpcode	RSCMI RSCPL RSCVS RSCVC RSCHI RSCLS
syn keyword armasmOpcode	RSCGE RSCLT RSCGT RSCLE RSCAL
syn keyword armasmOpcode	RSCS RSCEQS RSCNES RSCCSS RSCHSS RSCCCS RSCLOS
syn keyword armasmOpcode	RSCMIS RSCPLS RSCVSS RSCVCS RSCHIS RSCLSS
syn keyword armasmOpcode	RSCGES RSCLTS RSCGTS RSCLES RSCALS

syn keyword armasmOpcode	QSUB QSUBEQ QSUBNE QSUBCS QSUBHS QSUBCC QSUBLO
syn keyword armasmOpcode	QSUBMI QSUBPL QSUBVS QSUBVC QSUBHI QSUBLS
syn keyword armasmOpcode	QSUBGE QSUBLT QSUBGT QSUBLE QSUBAL

syn keyword armasmOpcode	QDSUB QDSUBEQ QDSUBNE QDSUBCS QDSUBHS QDSUBCC
syn keyword armasmOpcode	QDSUBLO QDSUBMI QDSUBPL QDSUBVS QDSUBVC QDSUBHI
syn keyword armasmOpcode	QDSUBLS QDSUBGE QDSUBLT QDSUBGT QDSUBLE QDSUBAL

syn keyword armasmOpcode	MUL MULEQ MULNE MULCS MULHS MULCC MULLO
syn keyword armasmOpcode	MULMI MULPL MULVS MULVC MULHI MULLS
syn keyword armasmOpcode	MULGE MULLT MULGT MULLE MULAL
syn keyword armasmOpcode	MULS MULEQS MULNES MULCSS MULHSS MULCCS MULLOS
syn keyword armasmOpcode	MULMIS MULPLS MULVSS MULVCS MULHIS MULLSS
syn keyword armasmOpcode	MULGES MULLTS MULGTS MULLES MULALS

syn keyword armasmOpcode	MLA MLAEQ MLANE MLACS MLAHS MLACC MLALO
syn keyword armasmOpcode	MLAMI MLAPL MLAVS MLAVC MLAHI MLALS
syn keyword armasmOpcode	MLAGE MLALT MLAGT MLALE MLAAL
syn keyword armasmOpcode	MLAS MLAEQS MLANES MLACSS MLAHSS MLACCS MLALOS
syn keyword armasmOpcode	MLAMIS MLAPLS MLAVSS MLAVCS MLAHIS MLALSS
syn keyword armasmOpcode	MLAGES MLALTS MLAGTS MLALES MLAALS

syn keyword armasmOpcode	UMULL UMULLEQ UMULLNE UMULLCS UMULLHS UMULLCC
syn keyword armasmOpcode	UMULLLO UMULLMI UMULLPL UMULLVS UMULLVC UMULLHI
syn keyword armasmOpcode	UMULLLS UMULLGE UMULLLT UMULLGT UMULLLE UMULLAL
syn keyword armasmOpcode	UMULLS UMULLEQS UMULLNES UMULLCSS UMULLHSS
syn keyword armasmOpcode	UMULLCCS UMULLLOS UMULLMIS UMULLPLS UMULLVSS
syn keyword armasmOpcode	UMULLVCS UMULLHIS UMULLLSS UMULLGES UMULLLTS
syn keyword armasmOpcode	UMULLGTS UMULLLES UMULLALS

syn keyword armasmOpcode	UMLAL UMLALEQ UMLALNE UMLALCS UMLALHS UMLALCC
syn keyword armasmOpcode	UMLALLO UMLALMI UMLALPL UMLALVS UMLALVC UMLALHI
syn keyword armasmOpcode	UMLALLS UMLALGE UMLALLT UMLALGT UMLALLE UMLALAL
syn keyword armasmOpcode	UMLALS UMLALEQS UMLALNES UMLALCSS UMLALHSS
syn keyword armasmOpcode	UMLALCCS UMLALLOS UMLALMIS UMLALPLS UMLALVSS
syn keyword armasmOpcode	UMLALVCS UMLALHIS UMLALLSS UMLALGES UMLALLTS
syn keyword armasmOpcode	UMLALGTS UMLALLES UMLALALS

syn keyword armasmOpcode	SMULL SMULLEQ SMULLNE SMULLCS SMULLHS SMULLCC
syn keyword armasmOpcode	SMULLLO SMULLMI SMULLPL SMULLVS SMULLVC SMULLHI
syn keyword armasmOpcode	SMULLLS SMULLGE SMULLLT SMULLGT SMULLLE SMULLAL
syn keyword armasmOpcode	SMULLS SMULLEQS SMULLNES SMULLCSS SMULLHSS
syn keyword armasmOpcode	SMULLCCS SMULLLOS SMULLMIS SMULLPLS SMULLVSS
syn keyword armasmOpcode	SMULLVCS SMULLHIS SMULLLSS SMULLGES SMULLLTS
syn keyword armasmOpcode	SMULLGTS SMULLLES SMULLALS

syn keyword armasmOpcode	SMLAL SMLALEQ SMLALNE SMLALCS SMLALHS SMLALCC
syn keyword armasmOpcode	SMLALLO SMLALMI SMLALPL SMLALVS SMLALVC SMLALHI
syn keyword armasmOpcode	SMLALLS SMLALGE SMLALLT SMLALGT SMLALLE SMLALAL
syn keyword armasmOpcode	SMLALS SMLALEQS SMLALNES SMLALCSS SMLALHSS
syn keyword armasmOpcode	SMLALCCS SMLALLOS SMLALMIS SMLALPLS SMLALVSS
syn keyword armasmOpcode	SMLALVCS SMLALHIS SMLALLSS SMLALGES SMLALLTS
syn keyword armasmOpcode	SMLALGTS SMLALLES SMLALALS

syn keyword armasmOpcode	SMULxy SMULxyEQ SMULxyNE SMULxyCS SMULxyHS
syn keyword armasmOpcode	SMULxyCC SMULxyLO SMULxyMI SMULxyPL SMULxyVS
syn keyword armasmOpcode	SMULxyVC SMULxyHI SMULxyLS SMULxyGE SMULxyLT
syn keyword armasmOpcode	SMULxyGT SMULxyLE SMULxyAL

syn keyword armasmOpcode	SMULWy SMULWyEQ SMULWyNE SMULWyCS SMULWyHS
syn keyword armasmOpcode	SMULWyCC SMULWyLO SMULWyMI SMULWyPL SMULWyVS
syn keyword armasmOpcode	SMULWyVC SMULWyHI SMULWyLS SMULWyGE SMULWyLT
syn keyword armasmOpcode	SMULWyGT SMULWyLE SMULWyAL

syn keyword armasmOpcode	SMLAxy SMLAxyEQ SMLAxyNE SMLAxyCS SMLAxyHS
syn keyword armasmOpcode	SMLAxyCC SMLAxyLO SMLAxyMI SMLAxyPL SMLAxyVS
syn keyword armasmOpcode	SMLAxyVC SMLAxyHI SMLAxyLS SMLAxyGE SMLAxyLT
syn keyword armasmOpcode	SMLAxyGT SMLAxyLE SMLAxyAL

syn keyword armasmOpcode	SMLAWy SMLAWyEQ SMLAWyNE SMLAWyCS SMLAWyHS
syn keyword armasmOpcode	SMLAWyCC SMLAWyLO SMLAWyMI SMLAWyPL SMLAWyVS
syn keyword armasmOpcode	SMLAWyVC SMLAWyHI SMLAWyLS SMLAWyGE SMLAWyLT
syn keyword armasmOpcode	SMLAWyGT SMLAWyLE SMLAWyAL

syn keyword armasmOpcode	SMLALxy SMLALxyEQ SMLALxyNE SMLALxyCS SMLALxyHS
syn keyword armasmOpcode	SMLALxyCC SMLALxyLO SMLALxyMI SMLALxyPL
syn keyword armasmOpcode	SMLALxyVS SMLALxyVC SMLALxyHI SMLALxyLS
syn keyword armasmOpcode	SMLALxyGE SMLALxyLT SMLALxyGT SMLALxyLE
syn keyword armasmOpcode	SMLALxyAL

syn keyword armasmOpcode	MIA MIAEQ MIANE MIACS MIAHS MIACC MIALO
syn keyword armasmOpcode	MIAMI MIAPL MIAVS MIAVC MIAHI MIALS
syn keyword armasmOpcode	MIAGE MIALT MIAGT MIALE MIAAL

syn keyword armasmOpcode	MIAPH MIAPHEQ MIAPHNE MIAPHCS MIAPHHS MIAPHCC
syn keyword armasmOpcode	MIAPHLO MIAPHMI MIAPHPL MIAPHVS MIAPHVC MIAPHHI
syn keyword armasmOpcode	MIAPHLS MIAPHGE MIAPHLT MIAPHGT MIAPHLE MIAPHAL

syn keyword armasmOpcode	MIAxy MIAxyEQ MIAxyNE MIAxyCS MIAxyHS MIAxyCC
syn keyword armasmOpcode	MIAxyLO MIAxyMI MIAxyPL MIAxyVS MIAxyVC MIAxyHI
syn keyword armasmOpcode	MIAxyLS MIAxyGE MIAxyLT MIAxyGT MIAxyLE MIAxyAL

syn keyword armasmOpcode	CLZ CLZEQ CLZNE CLZCS CLZHS CLZCC CLZLO
syn keyword armasmOpcode	CLZMI CLZPL CLZVS CLZVC CLZHI CLZLS
syn keyword armasmOpcode	CLZGE CLZLT CLZGT CLZLE CLZAL

syn keyword armasmOpcode	TST TSTEQ TSTNE TSTCS TSTHS TSTCC TSTLO
syn keyword armasmOpcode	TSTMI TSTPL TSTVS TSTVC TSTHI TSTLS
syn keyword armasmOpcode	TSTGE TSTLT TSTGT TSTLE TSTAL

syn keyword armasmOpcode	TEQ TEQEQ TEQNE TEQCS TEQHS TEQCC TEQLO
syn keyword armasmOpcode	TEQMI TEQPL TEQVS TEQVC TEQHI TEQLS
syn keyword armasmOpcode	TEQGE TEQLT TEQGT TEQLE TEQAL

syn keyword armasmOpcode	AND ANDEQ ANDNE ANDCS ANDHS ANDCC ANDLO
syn keyword armasmOpcode	ANDMI ANDPL ANDVS ANDVC ANDHI ANDLS
syn keyword armasmOpcode	ANDGE ANDLT ANDGT ANDLE ANDAL
syn keyword armasmOpcode	ANDS ANDEQS ANDNES ANDCSS ANDHSS ANDCCS ANDLOS
syn keyword armasmOpcode	ANDMIS ANDPLS ANDVSS ANDVCS ANDHIS ANDLSS
syn keyword armasmOpcode	ANDGES ANDLTS ANDGTS ANDLES ANDALS

syn keyword armasmOpcode	EOR EOREQ EORNE EORCS EORHS EORCC EORLO
syn keyword armasmOpcode	EORMI EORPL EORVS EORVC EORHI EORLS
syn keyword armasmOpcode	EORGE EORLT EORGT EORLE EORAL
syn keyword armasmOpcode	EORS EOREQS EORNES EORCSS EORHSS EORCCS EORLOS
syn keyword armasmOpcode	EORMIS EORPLS EORVSS EORVCS EORHIS EORLSS
syn keyword armasmOpcode	EORGES EORLTS EORGTS EORLES EORALS

syn keyword armasmOpcode	ORR ORREQ ORRNE ORRCS ORRHS ORRCC ORRLO
syn keyword armasmOpcode	ORRMI ORRPL ORRVS ORRVC ORRHI ORRLS
syn keyword armasmOpcode	ORRGE ORRLT ORRGT ORRLE ORRAL
syn keyword armasmOpcode	ORRS ORREQS ORRNES ORRCSS ORRHSS ORRCCS ORRLOS
syn keyword armasmOpcode	ORRMIS ORRPLS ORRVSS ORRVCS ORRHIS ORRLSS
syn keyword armasmOpcode	ORRGES ORRLTS ORRGTS ORRLES ORRALS

syn keyword armasmOpcode	BIC BICEQ BICNE BICCS BICHS BICCC BICLO
syn keyword armasmOpcode	BICMI BICPL BICVS BICVC BICHI BICLS
syn keyword armasmOpcode	BICGE BICLT BICGT BICLE BICAL
syn keyword armasmOpcode	BICS BICEQS BICNES BICCSS BICHSS BICCCS BICLOS
syn keyword armasmOpcode	BICMIS BICPLS BICVSS BICVCS BICHIS BICLSS
syn keyword armasmOpcode	BICGES BICLTS BICGTS BICLES BICALS

syn keyword armasmOpcode	CMP CMPEQ CMPNE CMPCS CMPHS CMPCC CMPLO
syn keyword armasmOpcode	CMPMI CMPPL CMPVS CMPVC CMPHI CMPLS
syn keyword armasmOpcode	CMPGE CMPLT CMPGT CMPLE CMPAL

syn keyword armasmOpcode	CMN CMNEQ CMNNE CMNCS CMNHS CMNCC CMNLO
syn keyword armasmOpcode	CMNMI CMNPL CMNVS CMNVC CMNHI CMNLS
syn keyword armasmOpcode	CMNGE CMNLT CMNGT CMNLE CMNAL
syn keyword armasmOpcode	CBZ CBNZ TBZ TBNZ

syn keyword armasmOpcode	NOP

syn keyword armasmOpcode	B BEQ BNE BCS BHS BCC BLO
syn keyword armasmOpcode	BMI BPL BVS BVC BHI BLS
syn keyword armasmOpcode	BGE BLT BGT BLE BAL

syn keyword armasmOpcode	BL BLEQ BLNE BLCS BLHS BLCC BLLO
syn keyword armasmOpcode	BLMI BLPL BLVS BLVC BLHI BLLS
syn keyword armasmOpcode	BLGE BLLT BLGT BLLE BLAL

syn keyword armasmOpcode	BX BXEQ BXNE BXCS BXHS BXCC BXLO
syn keyword armasmOpcode	BXMI BXPL BXVS BXVC BXHI BXLS
syn keyword armasmOpcode	BXGE BXLT BXGT BXLE BXAL

syn keyword armasmOpcode	BLX BLXEQ BLXNE BLXCS BLXHS BLXCC BLXLO
syn keyword armasmOpcode	BLXMI BLXPL BLXVS BLXVC BLXHI BLXLS
syn keyword armasmOpcode	BLXGE BLXLT BLXGT BLXLE BLXAL

syn keyword armasmOpcode	LDR LDREQ LDRNE LDRCS LDRHS LDRCC LDRLO
syn keyword armasmOpcode	LDRMI LDRPL LDRVS LDRVC LDRHI LDRLS
syn keyword armasmOpcode	LDRGE LDRLT LDRGT LDRLE LDRAL
syn keyword armasmOpcode	LDRT LDREQT LDRNET LDRCST LDRHST LDRCCT LDRLOT
syn keyword armasmOpcode	LDRMIT LDRPLT LDRVST LDRVCT LDRHIT LDRLST
syn keyword armasmOpcode	LDRGET LDRLTT LDRGTT LDRLET LDRALT
syn keyword armasmOpcode	LDRB LDREQB LDRNEB LDRCSB LDRHSB LDRCCB LDRLOB
syn keyword armasmOpcode	LDRMIB LDRPLB LDRVSB LDRVCB LDRHIB LDRLSB
syn keyword armasmOpcode	LDRGEB LDRLTB LDRGTB LDRLEB LDRALB
syn keyword armasmOpcode	LDRBT LDREQBT LDRNEBT LDRCSBT LDRHSBT LDRCCBT
syn keyword armasmOpcode	LDRLOBT LDRMIBT LDRPLBT LDRVSBT LDRVCBT LDRHIBT
syn keyword armasmOpcode	LDRLSBT LDRGEBT LDRLTBT LDRGTBT LDRLEBT LDRALBT
syn keyword armasmOpcode	LDRSB LDREQSB LDRNESB LDRCSSB LDRHSSB LDRCCSB
syn keyword armasmOpcode	LDRLOSB LDRMISB LDRPLSB LDRVSSB LDRVCSB LDRHISB
syn keyword armasmOpcode	LDRLSSB LDRGESB LDRLTSB LDRGTSB LDRLESB LDRALSB
syn keyword armasmOpcode	LDRH LDREQH LDRNEH LDRCSH LDRHSH LDRCCH LDRLOH
syn keyword armasmOpcode	LDRMIH LDRPLH LDRVSH LDRVCH LDRHIH LDRLSH
syn keyword armasmOpcode	LDRGEH LDRLTH LDRGTH LDRLEH LDRALH
syn keyword armasmOpcode	LDRSH LDREQSH LDRNESH LDRCSSH LDRHSSH LDRCCSH
syn keyword armasmOpcode	LDRLOSH LDRMISH LDRPLSH LDRVSSH LDRVCSH LDRHISH
syn keyword armasmOpcode	LDRLSSH LDRGESH LDRLTSH LDRGTSH LDRLESH LDRALSH
syn keyword armasmOpcode	LDRD LDREQD LDRNED LDRCSD LDRHSD LDRCCD LDRLOD
syn keyword armasmOpcode	LDRMID LDRPLD LDRVSD LDRVCD LDRHID LDRLSD
syn keyword armasmOpcode	LDRGED LDRLTD LDRGTD LDRLED LDRALD

syn keyword armasmOpcode	LDMIA LDMEQIA LDMNEIA LDMCSIA LDMHSIA LDMCCIA
syn keyword armasmOpcode	LDMLOIA LDMMIIA LDMPLIA LDMVSIA LDMVCIA LDMHIIA
syn keyword armasmOpcode	LDMLSIA LDMGEIA LDMLTIA LDMGTIA LDMLEIA LDMALIA
syn keyword armasmOpcode	LDMIB LDMEQIB LDMNEIB LDMCSIB LDMHSIB LDMCCIB
syn keyword armasmOpcode	LDMLOIB LDMMIIB LDMPLIB LDMVSIB LDMVCIB LDMHIIB
syn keyword armasmOpcode	LDMLSIB LDMGEIB LDMLTIB LDMGTIB LDMLEIB LDMALIB
syn keyword armasmOpcode	LDMDA LDMEQDA LDMNEDA LDMCSDA LDMHSDA LDMCCDA
syn keyword armasmOpcode	LDMLODA LDMMIDA LDMPLDA LDMVSDA LDMVCDA LDMHIDA
syn keyword armasmOpcode	LDMLSDA LDMGEDA LDMLTDA LDMGTDA LDMLEDA LDMALDA
syn keyword armasmOpcode	LDMDB LDMEQDB LDMNEDB LDMCSDB LDMHSDB LDMCCDB
syn keyword armasmOpcode	LDMLODB LDMMIDB LDMPLDB LDMVSDB LDMVCDB LDMHIDB
syn keyword armasmOpcode	LDMLSDB LDMGEDB LDMLTDB LDMGTDB LDMLEDB LDMALDB
syn keyword armasmOpcode	LDMFD LDMEQFD LDMNEFD LDMCSFD LDMHSFD LDMCCFD
syn keyword armasmOpcode	LDMLOFD LDMMIFD LDMPLFD LDMVSFD LDMVCFD LDMHIFD
syn keyword armasmOpcode	LDMLSFD LDMGEFD LDMLTFD LDMGTFD LDMLEFD LDMALFD
syn keyword armasmOpcode	LDMED LDMEQED LDMNEED LDMCSED LDMHSED LDMCCED
syn keyword armasmOpcode	LDMLOED LDMMIED LDMPLED LDMVSED LDMVCED LDMHIED
syn keyword armasmOpcode	LDMLSED LDMGEED LDMLTED LDMGTED LDMLEED LDMALED
syn keyword armasmOpcode	LDMFA LDMEQFA LDMNEFA LDMCSFA LDMHSFA LDMCCFA
syn keyword armasmOpcode	LDMLOFA LDMMIFA LDMPLFA LDMVSFA LDMVCFA LDMHIFA
syn keyword armasmOpcode	LDMLSFA LDMGEFA LDMLTFA LDMGTFA LDMLEFA LDMALFA
syn keyword armasmOpcode	LDMEA LDMEQEA LDMNEEA LDMCSEA LDMHSEA LDMCCEA
syn keyword armasmOpcode	LDMLOEA LDMMIEA LDMPLEA LDMVSEA LDMVCEA LDMHIEA
syn keyword armasmOpcode	LDMLSEA LDMGEEA LDMLTEA LDMGTEA LDMLEEA LDMALEA
syn keyword armasmOpcode	LDM

syn keyword armasmOpcode	PLD

syn keyword armasmOpcode	STR STREQ STRNE STRCS STRHS STRCC STRLO STRHEQ
syn keyword armasmOpcode	STRMI STRPL STRVS STRVC STRHI STRLS
syn keyword armasmOpcode	STRGE STRLT STRGT STRLE STRAL
syn keyword armasmOpcode	STRT STREQT STRNET STRCST STRHST STRCCT STRLOT
syn keyword armasmOpcode	STRMIT STRPLT STRVST STRVCT STRHIT STRLST
syn keyword armasmOpcode	STRGET STRLTT STRGTT STRLET STRALT
syn keyword armasmOpcode	STRB STREQB STRNEB STRCSB STRHSB STRCCB STRLOB
syn keyword armasmOpcode	STRMIB STRPLB STRVSB STRVCB STRHIB STRLSB
syn keyword armasmOpcode	STRGEB STRLTB STRGTB STRLEB STRALB
syn keyword armasmOpcode	STRBT STREQBT STRNEBT STRCSBT STRHSBT STRCCBT
syn keyword armasmOpcode	STRLOBT STRMIBT STRPLBT STRVSBT STRVCBT STRHIBT
syn keyword armasmOpcode	STRLSBT STRGEBT STRLTBT STRGTBT STRLEBT STRALBT
syn keyword armasmOpcode	STRH STREQH STRNEH STRCSH STRHSH STRCCH STRLOH
syn keyword armasmOpcode	STRMIH STRPLH STRVSH STRVCH STRHIH STRLSH
syn keyword armasmOpcode	STRGEH STRLTH STRGTH STRLEH STRALH
syn keyword armasmOpcode	STRD STREQD STRNED STRCSD STRHSD STRCCD STRLOD
syn keyword armasmOpcode	STRMID STRPLD STRVSD STRVCD STRHID STRLSD
syn keyword armasmOpcode	STRGED STRLTD STRGTD STRLED STRALD

syn keyword armasmOpcode	STMIA STMEQIA STMNEIA STMCSIA STMHSIA STMCCIA
syn keyword armasmOpcode	STMLOIA STMMIIA STMPLIA STMVSIA STMVCIA STMHIIA
syn keyword armasmOpcode	STMLSIA STMGEIA STMLTIA STMGTIA STMLEIA STMALIA
syn keyword armasmOpcode	STMIB STMEQIB STMNEIB STMCSIB STMHSIB STMCCIB
syn keyword armasmOpcode	STMLOIB STMMIIB STMPLIB STMVSIB STMVCIB STMHIIB
syn keyword armasmOpcode	STMLSIB STMGEIB STMLTIB STMGTIB STMLEIB STMALIB
syn keyword armasmOpcode	STMDA STMEQDA STMNEDA STMCSDA STMHSDA STMCCDA
syn keyword armasmOpcode	STMLODA STMMIDA STMPLDA STMVSDA STMVCDA STMHIDA
syn keyword armasmOpcode	STMLSDA STMGEDA STMLTDA STMGTDA STMLEDA STMALDA
syn keyword armasmOpcode	STMDB STMEQDB STMNEDB STMCSDB STMHSDB STMCCDB
syn keyword armasmOpcode	STMLODB STMMIDB STMPLDB STMVSDB STMVCDB STMHIDB
syn keyword armasmOpcode	STMLSDB STMGEDB STMLTDB STMGTDB STMLEDB STMALDB
syn keyword armasmOpcode	STMFD STMEQFD STMNEFD STMCSFD STMHSFD STMCCFD
syn keyword armasmOpcode	STMLOFD STMMIFD STMPLFD STMVSFD STMVCFD STMHIFD
syn keyword armasmOpcode	STMLSFD STMGEFD STMLTFD STMGTFD STMLEFD STMALFD
syn keyword armasmOpcode	STMED STMEQED STMNEED STMCSED STMHSED STMCCED
syn keyword armasmOpcode	STMLOED STMMIED STMPLED STMVSED STMVCED STMHIED
syn keyword armasmOpcode	STMLSED STMGEED STMLTED STMGTED STMLEED STMALED
syn keyword armasmOpcode	STMFA STMEQFA STMNEFA STMCSFA STMHSFA STMCCFA
syn keyword armasmOpcode	STMLOFA STMMIFA STMPLFA STMVSFA STMVCFA STMHIFA
syn keyword armasmOpcode	STMLSFA STMGEFA STMLTFA STMGTFA STMLEFA STMALFA
syn keyword armasmOpcode	STMEA STMEQEA STMNEEA STMCSEA STMHSEA STMCCEA
syn keyword armasmOpcode	STMLOEA STMMIEA STMPLEA STMVSEA STMVCEA STMHIEA
syn keyword armasmOpcode	STMLSEA STMGEEA STMLTEA STMGTEA STMLEEA STMALEA

syn keyword armasmOpcode	SWP SWPEQ SWPNE SWPCS SWPHS SWPCC SWPLO
syn keyword armasmOpcode	SWPMI SWPPL SWPVS SWPVC SWPHI SWPLS
syn keyword armasmOpcode	SWPGE SWPLT SWPGT SWPLE SWPAL

syn keyword armasmOpcode	SWPB SWPEQB SWPNEB SWPCSB SWPHSB SWPCCB SWPLOB 
syn keyword armasmOpcode	SWPMIB SWPPLB SWPVSB SWPVCB SWPHIB SWPLSB 
syn keyword armasmOpcode	SWPGEB SWPLTB SWPGTB SWPLEB SWPALB 

syn keyword armasmOpcode	CDP CDPEQ CDPNE CDPCS CDPHS CDPCC CDPLO
syn keyword armasmOpcode	CDPMI CDPPL CDPVS CDPVC CDPHI CDPLS
syn keyword armasmOpcode	CDPGE CDPLT CDPGT CDPLE CDPAL

syn keyword armasmOpcode	CDP2 CDP2EQ CDP2NE CDP2CS CDP2HS CDP2CC CDP2LO
syn keyword armasmOpcode	CDP2MI CDP2PL CDP2VS CDP2VC CDP2HI CDP2LS
syn keyword armasmOpcode	CDP2GE CDP2LT CDP2GT CDP2LE CDP2AL

syn keyword armasmOpcode	MRC MRCEQ MRCNE MRCCS MRCHS MRCCC MRCLO
syn keyword armasmOpcode	MRCMI MRCPL MRCVS MRCVC MRCHI MRCLS
syn keyword armasmOpcode	MRCGE MRCLT MRCGT MRCLE MRCAL

syn keyword armasmOpcode	MRC2 MRC2EQ MRC2NE MRC2CS MRC2HS MRC2CC MRC2LO
syn keyword armasmOpcode	MRC2MI MRC2PL MRC2VS MRC2VC MRC2HI MRC2LS
syn keyword armasmOpcode	MRC2GE MRC2LT MRC2GT MRC2LE MRC2AL

syn keyword armasmOpcode	MRRC MRRCEQ MRRCNE MRRCCS MRRCHS MRRCCC MRRCLO
syn keyword armasmOpcode	MRRCMI MRRCPL MRRCVS MRRCVC MRRCHI MRRCLS
syn keyword armasmOpcode	MRRCGE MRRCLT MRRCGT MRRCLE MRRCAL

syn keyword armasmOpcode	MCR MCREQ MCRNE MCRCS MCRHS MCRCC MCRLO
syn keyword armasmOpcode	MCRMI MCRPL MCRVS MCRVC MCRHI MCRLS
syn keyword armasmOpcode	MCRGE MCRLT MCRGT MCRLE MCRAL

syn keyword armasmOpcode	MCR2 MCR2EQ MCR2NE MCR2CS MCR2HS MCR2CC MCR2LO
syn keyword armasmOpcode	MCR2MI MCR2PL MCR2VS MCR2VC MCR2HI MCR2LS
syn keyword armasmOpcode	MCR2GE MCR2LT MCR2GT MCR2LE MCR2AL

syn keyword armasmOpcode	MCRR MCRREQ MCRRNE MCRRCS MCRRHS MCRRCC MCRRLO
syn keyword armasmOpcode	MCRRMI MCRRPL MCRRVS MCRRVC MCRRHI MCRRLS
syn keyword armasmOpcode	MCRRGE MCRRLT MCRRGT MCRRLE MCRRAL

syn keyword armasmOpcode	LDC LDCEQ LDCNE LDCCS LDCHS LDCCC LDCLO
syn keyword armasmOpcode	LDCMI LDCPL LDCVS LDCVC LDCHI LDCLS
syn keyword armasmOpcode	LDCGE LDCLT LDCGT LDCLE LDCAL

syn keyword armasmOpcode	LDC2 LDC2EQ LDC2NE LDC2CS LDC2HS LDC2CC LDC2LO
syn keyword armasmOpcode	LDC2MI LDC2PL LDC2VS LDC2VC LDC2HI LDC2LS
syn keyword armasmOpcode	LDC2GE LDC2LT LDC2GT LDC2LE LDC2AL

syn keyword armasmOpcode	STC STCEQ STCNE STCCS STCHS STCCC STCLO
syn keyword armasmOpcode	STCMI STCPL STCVS STCVC STCHI STCLS
syn keyword armasmOpcode	STCGE STCLT STCGT STCLE STCAL

syn keyword armasmOpcode	STC2 STC2EQ STC2NE STC2CS STC2HS STC2CC STC2LO
syn keyword armasmOpcode	STC2MI STC2PL STC2VS STC2VC STC2HI STC2LS
syn keyword armasmOpcode	STC2GE STC2LT STC2GT STC2LE STC2AL

syn keyword armasmOpcode	SWI SWIEQ SWINE SWICS SWIHS SWICC SWILO
syn keyword armasmOpcode	SWIMI SWIPL SWIVS SWIVC SWIHI SWILS
syn keyword armasmOpcode	SWIGE SWILT SWIGT SWILE SWIAL

syn keyword armasmOpcode	SVC SVCEQ SVCNE SVCCS SVCHS SVCCC SVCLO
syn keyword armasmOpcode	SVCMI SVCPL SVCVS SVCVC SVCHI SVCLS
syn keyword armasmOpcode	SVCGE SVCLT SVCGT SVCLE SVCAL

syn keyword armasmOpcode	BKPT

syn keyword armasmOpcode	NEG LSL LSR ASR ROR RRX PUSH PUSHNE PUSHEQ POP
syn keyword armasmOpcode	POPNE POPEQ
syn keyword armasmOpcode	ASRS ASLS LSLS LSRS UXTB TRAP

syn keyword armasmOpcode	FMULS FMULSEQ FMULSNE FMULSCS FMULSHS FMULSCC
syn keyword armasmOpcode	FMULSLO FMULSMI FMULSPL FMULSVS FMULSVC FMULSHI
syn keyword armasmOpcode	FMULSLS FMULSGE FMULSLT FMULSGT FMULSLE FMULSAL
syn keyword armasmOpcode	FMULD FMULDEQ FMULDNE FMULDCS FMULDHS FMULDCC
syn keyword armasmOpcode	FMULDLO FMULDMI FMULDPL FMULDVS FMULDVC FMULDHI
syn keyword armasmOpcode	FMULDLS FMULDGE FMULDLT FMULDGT FMULDLE FMULDAL

syn keyword armasmOpcode	FNMULS FNMULSEQ FNMULSNE FNMULSCS FNMULSHS
syn keyword armasmOpcode	FNMULSCC FNMULSLO FNMULSMI FNMULSPL FNMULSVS
syn keyword armasmOpcode	FNMULSVC FNMULSHI FNMULSLS FNMULSGE FNMULSLT
syn keyword armasmOpcode	FNMULSGT FNMULSLE FNMULSAL FNMULD FNMULDEQ
syn keyword armasmOpcode	FNMULDNE FNMULDCS FNMULDHS FNMULDCC FNMULDLO
syn keyword armasmOpcode	FNMULDMI FNMULDPL FNMULDVS FNMULDVC FNMULDHI
syn keyword armasmOpcode	FNMULDLS FNMULDGE FNMULDLT FNMULDGT FNMULDLE
syn keyword armasmOpcode	FNMULDAL

syn keyword armasmOpcode	FMACS FMACSEQ FMACSNE FMACSCS FMACSHS FMACSCC
syn keyword armasmOpcode	FMACSLO FMACSMI FMACSPL FMACSVS FMACSVC FMACSHI
syn keyword armasmOpcode	FMACSLS FMACSGE FMACSLT FMACSGT FMACSLE FMACSAL
syn keyword armasmOpcode	FMACD FMACDEQ FMACDNE FMACDCS FMACDHS FMACDCC
syn keyword armasmOpcode	FMACDLO FMACDMI FMACDPL FMACDVS FMACDVC FMACDHI
syn keyword armasmOpcode	FMACDLS FMACDGE FMACDLT FMACDGT FMACDLE FMACDAL

syn keyword armasmOpcode	FNMACS FNMACSEQ FNMACSNE FNMACSCS FNMACSHS
syn keyword armasmOpcode	FNMACSCC FNMACSLO FNMACSMI FNMACSPL FNMACSVS
syn keyword armasmOpcode	FNMACSVC FNMACSHI FNMACSLS FNMACSGE FNMACSLT
syn keyword armasmOpcode	FNMACSGT FNMACSLE FNMACSAL FNMACD FNMACDEQ
syn keyword armasmOpcode	FNMACDNE FNMACDCS FNMACDHS FNMACDCC FNMACDLO
syn keyword armasmOpcode	FNMACDMI FNMACDPL FNMACDVS FNMACDVC FNMACDHI
syn keyword armasmOpcode	FNMACDLS FNMACDGE FNMACDLT FNMACDGT FNMACDLE
syn keyword armasmOpcode	FNMACDAL

syn keyword armasmOpcode	FMSCS FMSCSEQ FMSCSNE FMSCSCS FMSCSHS FMSCSCC
syn keyword armasmOpcode	FMSCSLO FMSCSMI FMSCSPL FMSCSVS FMSCSVC FMSCSHI
syn keyword armasmOpcode	FMSCSLS FMSCSGE FMSCSLT FMSCSGT FMSCSLE FMSCSAL
syn keyword armasmOpcode	FMSCD FMSCDEQ FMSCDNE FMSCDCS FMSCDHS FMSCDCC
syn keyword armasmOpcode	FMSCDLO FMSCDMI FMSCDPL FMSCDVS FMSCDVC FMSCDHI
syn keyword armasmOpcode	FMSCDLS FMSCDGE FMSCDLT FMSCDGT FMSCDLE FMSCDAL

syn keyword armasmOpcode	FNMSCS FNMSCSEQ FNMSCSNE FNMSCSCS FNMSCSHS
syn keyword armasmOpcode	FNMSCSCC FNMSCSLO FNMSCSMI FNMSCSPL FNMSCSVS
syn keyword armasmOpcode	FNMSCSVC FNMSCSHI FNMSCSLS FNMSCSGE FNMSCSLT
syn keyword armasmOpcode	FNMSCSGT FNMSCSLE FNMSCSAL FNMSCD FNMSCDEQ
syn keyword armasmOpcode	FNMSCDNE FNMSCDCS FNMSCDHS FNMSCDCC FNMSCDLO
syn keyword armasmOpcode	FNMSCDMI FNMSCDPL FNMSCDVS FNMSCDVC FNMSCDHI
syn keyword armasmOpcode	FNMSCDLS FNMSCDGE FNMSCDLT FNMSCDGT FNMSCDLE
syn keyword armasmOpcode	FNMSCDAL

syn keyword armasmOpcode	FADDS FADDSEQ FADDSNE FADDSCS FADDSHS FADDSCC
syn keyword armasmOpcode	FADDSLO FADDSMI FADDSPL FADDSVS FADDSVC FADDSHI
syn keyword armasmOpcode	FADDSLS FADDSGE FADDSLT FADDSGT FADDSLE FADDSAL
syn keyword armasmOpcode	FADDD FADDDEQ FADDDNE FADDDCS FADDDHS FADDDCC
syn keyword armasmOpcode	FADDDLO FADDDMI FADDDPL FADDDVS FADDDVC FADDDHI
syn keyword armasmOpcode	FADDDLS FADDDGE FADDDLT FADDDGT FADDDLE FADDDAL

syn keyword armasmOpcode	FSUBS FSUBSEQ FSUBSNE FSUBSCS FSUBSHS FSUBSCC
syn keyword armasmOpcode	FSUBSLO FSUBSMI FSUBSPL FSUBSVS FSUBSVC FSUBSHI
syn keyword armasmOpcode	FSUBSLS FSUBSGE FSUBSLT FSUBSGT FSUBSLE FSUBSAL
syn keyword armasmOpcode	FSUBD FSUBDEQ FSUBDNE FSUBDCS FSUBDHS FSUBDCC
syn keyword armasmOpcode	FSUBDLO FSUBDMI FSUBDPL FSUBDVS FSUBDVC FSUBDHI
syn keyword armasmOpcode	FSUBDLS FSUBDGE FSUBDLT FSUBDGT FSUBDLE FSUBDAL

syn keyword armasmOpcode	FDIVS FDIVSEQ FDIVSNE FDIVSCS FDIVSHS FDIVSCC
syn keyword armasmOpcode	FDIVSLO FDIVSMI FDIVSPL FDIVSVS FDIVSVC FDIVSHI
syn keyword armasmOpcode	FDIVSLS FDIVSGE FDIVSLT FDIVSGT FDIVSLE FDIVSAL
syn keyword armasmOpcode	FDIVD FDIVDEQ FDIVDNE FDIVDCS FDIVDHS FDIVDCC
syn keyword armasmOpcode	FDIVDLO FDIVDMI FDIVDPL FDIVDVS FDIVDVC FDIVDHI
syn keyword armasmOpcode	FDIVDLS FDIVDGE FDIVDLT FDIVDGT FDIVDLE FDIVDAL

syn keyword armasmOpcode	FCPYS FCPYSEQ FCPYSNE FCPYSCS FCPYSHS FCPYSCC
syn keyword armasmOpcode	FCPYSLO FCPYSMI FCPYSPL FCPYSVS FCPYSVC FCPYSHI
syn keyword armasmOpcode	FCPYSLS FCPYSGE FCPYSLT FCPYSGT FCPYSLE FCPYSAL
syn keyword armasmOpcode	FCPYD FCPYDEQ FCPYDNE FCPYDCS FCPYDHS FCPYDCC
syn keyword armasmOpcode	FCPYDLO FCPYDMI FCPYDPL FCPYDVS FCPYDVC FCPYDHI
syn keyword armasmOpcode	FCPYDLS FCPYDGE FCPYDLT FCPYDGT FCPYDLE FCPYDAL

syn keyword armasmOpcode	FABSS FABSSEQ FABSSNE FABSSCS FABSSHS FABSSCC
syn keyword armasmOpcode	FABSSLO FABSSMI FABSSPL FABSSVS FABSSVC FABSSHI
syn keyword armasmOpcode	FABSSLS FABSSGE FABSSLT FABSSGT FABSSLE FABSSAL
syn keyword armasmOpcode	FABSD FABSDEQ FABSDNE FABSDCS FABSDHS FABSDCC
syn keyword armasmOpcode	FABSDLO FABSDMI FABSDPL FABSDVS FABSDVC FABSDHI
syn keyword armasmOpcode	FABSDLS FABSDGE FABSDLT FABSDGT FABSDLE FABSDAL

syn keyword armasmOpcode	FNEGS FNEGSEQ FNEGSNE FNEGSCS FNEGSHS FNEGSCC
syn keyword armasmOpcode	FNEGSLO FNEGSMI FNEGSPL FNEGSVS FNEGSVC FNEGSHI
syn keyword armasmOpcode	FNEGSLS FNEGSGE FNEGSLT FNEGSGT FNEGSLE FNEGSAL
syn keyword armasmOpcode	FNEGD FNEGDEQ FNEGDNE FNEGDCS FNEGDHS FNEGDCC
syn keyword armasmOpcode	FNEGDLO FNEGDMI FNEGDPL FNEGDVS FNEGDVC FNEGDHI
syn keyword armasmOpcode	FNEGDLS FNEGDGE FNEGDLT FNEGDGT FNEGDLE FNEGDAL

syn keyword armasmOpcode	FSQRTS FSQRTSEQ FSQRTSNE FSQRTSCS FSQRTSHS
syn keyword armasmOpcode	FSQRTSCC FSQRTSLO FSQRTSMI FSQRTSPL FSQRTSVS
syn keyword armasmOpcode	FSQRTSVC FSQRTSHI FSQRTSLS FSQRTSGE FSQRTSLT
syn keyword armasmOpcode	FSQRTSGT FSQRTSLE FSQRTSAL FSQRTD FSQRTDEQ
syn keyword armasmOpcode	FSQRTDNE FSQRTDCS FSQRTDHS FSQRTDCC FSQRTDLO
syn keyword armasmOpcode	FSQRTDMI FSQRTDPL FSQRTDVS FSQRTDVC FSQRTDHI
syn keyword armasmOpcode	FSQRTDLS FSQRTDGE FSQRTDLT FSQRTDGT FSQRTDLE
syn keyword armasmOpcode	FSQRTDAL

syn keyword armasmOpcode	FCMPS FCMPSEQ FCMPSNE FCMPSCS FCMPSHS FCMPSCC
syn keyword armasmOpcode	FCMPSLO FCMPSMI FCMPSPL FCMPSVS FCMPSVC FCMPSHI
syn keyword armasmOpcode	FCMPSLS FCMPSGE FCMPSLT FCMPSGT FCMPSLE FCMPSAL
syn keyword armasmOpcode	FCMPD FCMPDEQ FCMPDNE FCMPDCS FCMPDHS FCMPDCC
syn keyword armasmOpcode	FCMPDLO FCMPDMI FCMPDPL FCMPDVS FCMPDVC FCMPDHI
syn keyword armasmOpcode	FCMPDLS FCMPDGE FCMPDLT FCMPDGT FCMPDLE FCMPDAL

syn keyword armasmOpcode	FCMPES FCMPESEQ FCMPESNE FCMPESCS FCMPESHS
syn keyword armasmOpcode	FCMPESCC FCMPESLO FCMPESMI FCMPESPL FCMPESVS
syn keyword armasmOpcode	FCMPESVC FCMPESHI FCMPESLS FCMPESGE FCMPESLT
syn keyword armasmOpcode	FCMPESGT FCMPESLE FCMPESAL FCMPED FCMPEDEQ
syn keyword armasmOpcode	FCMPEDNE FCMPEDCS FCMPEDHS FCMPEDCC FCMPEDLO
syn keyword armasmOpcode	FCMPEDMI FCMPEDPL FCMPEDVS FCMPEDVC FCMPEDHI
syn keyword armasmOpcode	FCMPEDLS FCMPEDGE FCMPEDLT FCMPEDGT FCMPEDLE
syn keyword armasmOpcode	FCMPEDAL

syn keyword armasmOpcode	FCMPZS FCMPZSEQ FCMPZSNE FCMPZSCS FCMPZSHS
syn keyword armasmOpcode	FCMPZSCC FCMPZSLO FCMPZSMI FCMPZSPL FCMPZSVS
syn keyword armasmOpcode	FCMPZSVC FCMPZSHI FCMPZSLS FCMPZSGE FCMPZSLT
syn keyword armasmOpcode	FCMPZSGT FCMPZSLE FCMPZSAL FCMPZD FCMPZDEQ
syn keyword armasmOpcode	FCMPZDNE FCMPZDCS FCMPZDHS FCMPZDCC FCMPZDLO
syn keyword armasmOpcode	FCMPZDMI FCMPZDPL FCMPZDVS FCMPZDVC FCMPZDHI
syn keyword armasmOpcode	FCMPZDLS FCMPZDGE FCMPZDLT FCMPZDGT FCMPZDLE
syn keyword armasmOpcode	FCMPZDAL

syn keyword armasmOpcode	FCMPEZS FCMPEZSEQ FCMPEZSNE FCMPEZSCS FCMPEZSHS
syn keyword armasmOpcode	FCMPEZSCC FCMPEZSLO FCMPEZSMI FCMPEZSPL
syn keyword armasmOpcode	FCMPEZSVS FCMPEZSVC FCMPEZSHI FCMPEZSLS
syn keyword armasmOpcode	FCMPEZSGE FCMPEZSLT FCMPEZSGT FCMPEZSLE
syn keyword armasmOpcode	FCMPEZSAL FCMPEZD FCMPEZDEQ FCMPEZDNE FCMPEZDCS
syn keyword armasmOpcode	FCMPEZDHS FCMPEZDCC FCMPEZDLO FCMPEZDMI
syn keyword armasmOpcode	FCMPEZDPL FCMPEZDVS FCMPEZDVC FCMPEZDHI
syn keyword armasmOpcode	FCMPEZDLS FCMPEZDGE FCMPEZDLT FCMPEZDGT
syn keyword armasmOpcode	FCMPEZDLE FCMPEZDAL

syn keyword armasmOpcode	FCVTDS FCVTDSEQ FCVTDSNE FCVTDSCS FCVTDSHS
syn keyword armasmOpcode	FCVTDSCC FCVTDSLO FCVTDSMI FCVTDSPL FCVTDSVS
syn keyword armasmOpcode	FCVTDSVC FCVTDSHI FCVTDSLS FCVTDSGE FCVTDSLT
syn keyword armasmOpcode	FCVTDSGT FCVTDSLE FCVTDSAL

syn keyword armasmOpcode	FCVTSD FCVTSDEQ FCVTSDNE FCVTSDCS FCVTSDHS
syn keyword armasmOpcode	FCVTSDCC FCVTSDLO FCVTSDMI FCVTSDPL FCVTSDVS
syn keyword armasmOpcode	FCVTSDVC FCVTSDHI FCVTSDLS FCVTSDGE FCVTSDLT
syn keyword armasmOpcode	FCVTSDGT FCVTSDLE FCVTSDAL

syn keyword armasmOpcode	FUITOS FUITOSEQ FUITOSNE FUITOSCS FUITOSHS
syn keyword armasmOpcode	FUITOSCC FUITOSLO FUITOSMI FUITOSPL FUITOSVS
syn keyword armasmOpcode	FUITOSVC FUITOSHI FUITOSLS FUITOSGE FUITOSLT
syn keyword armasmOpcode	FUITOSGT FUITOSLE FUITOSAL
syn keyword armasmOpcode	FUITOD FUITODEQ FUITODNE FUITODCS FUITODHS
syn keyword armasmOpcode	FUITODCC FUITODLO FUITODMI FUITODPL FUITODVS
syn keyword armasmOpcode	FUITODVC FUITODHI FUITODLS FUITODGE FUITODLT
syn keyword armasmOpcode	FUITODGT FUITODLE FUITODAL

syn keyword armasmOpcode	FSITOS FSITOSEQ FSITOSNE FSITOSCS FSITOSHS
syn keyword armasmOpcode	FSITOSCC FSITOSLO FSITOSMI FSITOSPL FSITOSVS
syn keyword armasmOpcode	FSITOSVC FSITOSHI FSITOSLS FSITOSGE FSITOSLT
syn keyword armasmOpcode	FSITOSGT FSITOSLE FSITOSAL
syn keyword armasmOpcode	FSITOD FSITODEQ FSITODNE FSITODCS FSITODHS
syn keyword armasmOpcode	FSITODCC FSITODLO FSITODMI FSITODPL FSITODVS
syn keyword armasmOpcode	FSITODVC FSITODHI FSITODLS FSITODGE FSITODLT
syn keyword armasmOpcode	FSITODGT FSITODLE FSITODAL

syn keyword armasmOpcode	FTOUIS FTOUISEQ FTOUISNE FTOUISCS FTOUISHS
syn keyword armasmOpcode	FTOUISCC FTOUISLO FTOUISMI FTOUISPL FTOUISVS
syn keyword armasmOpcode	FTOUISVC FTOUISHI FTOUISLS FTOUISGE FTOUISLT
syn keyword armasmOpcode	FTOUISGT FTOUISLE FTOUISAL
syn keyword armasmOpcode	FTOUID FTOUIDEQ FTOUIDNE FTOUIDCS FTOUIDHS
syn keyword armasmOpcode	FTOUIDCC FTOUIDLO FTOUIDMI FTOUIDPL FTOUIDVS
syn keyword armasmOpcode	FTOUIDVC FTOUIDHI FTOUIDLS FTOUIDGE FTOUIDLT
syn keyword armasmOpcode	FTOUIDGT FTOUIDLE FTOUIDAL

syn keyword armasmOpcode	FTOUIZS FTOUIZSEQ FTOUIZSNE FTOUIZSCS FTOUIZSHS
syn keyword armasmOpcode	FTOUIZSCC FTOUIZSLO FTOUIZSMI FTOUIZSPL
syn keyword armasmOpcode	FTOUIZSVS FTOUIZSVC FTOUIZSHI FTOUIZSLS
syn keyword armasmOpcode	FTOUIZSGE FTOUIZSLT FTOUIZSGT FTOUIZSLE
syn keyword armasmOpcode	FTOUIZSAL
syn keyword armasmOpcode	FTOUIZD FTOUIZDEQ FTOUIZDNE FTOUIZDCS FTOUIZDHS
syn keyword armasmOpcode	FTOUIZDCC FTOUIZDLO FTOUIZDMI FTOUIZDPL
syn keyword armasmOpcode	FTOUIZDVS FTOUIZDVC FTOUIZDHI FTOUIZDLS
syn keyword armasmOpcode	FTOUIZDGE FTOUIZDLT FTOUIZDGT FTOUIZDLE
syn keyword armasmOpcode	FTOUIZDAL

syn keyword armasmOpcode	FTOSIS FTOSISEQ FTOSISNE FTOSISCS FTOSISHS
syn keyword armasmOpcode	FTOSISCC FTOSISLO FTOSISMI FTOSISPL FTOSISVS
syn keyword armasmOpcode	FTOSISVC FTOSISHI FTOSISLS FTOSISGE FTOSISLT
syn keyword armasmOpcode	FTOSISGT FTOSISLE FTOSISAL
syn keyword armasmOpcode	FTOSID FTOSIDEQ FTOSIDNE FTOSIDCS FTOSIDHS
syn keyword armasmOpcode	FTOSIDCC FTOSIDLO FTOSIDMI FTOSIDPL FTOSIDVS
syn keyword armasmOpcode	FTOSIDVC FTOSIDHI FTOSIDLS FTOSIDGE FTOSIDLT
syn keyword armasmOpcode	FTOSIDGT FTOSIDLE FTOSIDAL

syn keyword armasmOpcode	FTOSIZS FTOSIZSEQ FTOSIZSNE FTOSIZSCS FTOSIZSHS
syn keyword armasmOpcode	FTOSIZSCC FTOSIZSLO FTOSIZSMI FTOSIZSPL
syn keyword armasmOpcode	FTOSIZSVS FTOSIZSVC FTOSIZSHI FTOSIZSLS
syn keyword armasmOpcode	FTOSIZSGE FTOSIZSLT FTOSIZSGT FTOSIZSLE
syn keyword armasmOpcode	FTOSIZSAL
syn keyword armasmOpcode	FTOSIZD FTOSIZDEQ FTOSIZDNE FTOSIZDCS FTOSIZDHS
syn keyword armasmOpcode	FTOSIZDCC FTOSIZDLO FTOSIZDMI FTOSIZDPL
syn keyword armasmOpcode	FTOSIZDVS FTOSIZDVC FTOSIZDHI FTOSIZDLS
syn keyword armasmOpcode	FTOSIZDGE FTOSIZDLT FTOSIZDGT FTOSIZDLE
syn keyword armasmOpcode	FTOSIZDAL

syn keyword armasmOpcode	FSTS FSTSEQ FSTSNE FSTSCS FSTSHS FSTSCC FSTSLO
syn keyword armasmOpcode	FSTSMI FSTSPL FSTSVS FSTSVC FSTSHI FSTSLS
syn keyword armasmOpcode	FSTSGE FSTSLT FSTSGT FSTSLE FSTSAL
syn keyword armasmOpcode	FSTD FSTDEQ FSTDNE FSTDCS FSTDHS FSTDCC FSTDLO
syn keyword armasmOpcode	FSTDMI FSTDPL FSTDVS FSTDVC FSTDHI FSTDLS
syn keyword armasmOpcode	FSTDGE FSTDLT FSTDGT FSTDLE FSTDAL

syn keyword armasmOpcode	FSTMIAS FSTMIASEQ FSTMIASNE FSTMIASCS FSTMIASHS
syn keyword armasmOpcode	FSTMIASCC FSTMIASLO FSTMIASMI FSTMIASPL
syn keyword armasmOpcode	FSTMIASVS FSTMIASVC FSTMIASHI FSTMIASLS
syn keyword armasmOpcode	FSTMIASGE FSTMIASLT FSTMIASGT FSTMIASLE
syn keyword armasmOpcode	FSTMIASAL
syn keyword armasmOpcode	FSTMIAD FSTMIADEQ FSTMIADNE FSTMIADCS FSTMIADHS
syn keyword armasmOpcode	FSTMIADCC FSTMIADLO FSTMIADMI FSTMIADPL
syn keyword armasmOpcode	FSTMIADVS FSTMIADVC FSTMIADHI FSTMIADLS
syn keyword armasmOpcode	FSTMIADGE FSTMIADLT FSTMIADGT FSTMIADLE
syn keyword armasmOpcode	FSTMIADAL
syn keyword armasmOpcode	FSTMIAX FSTMIAXEQ FSTMIAXNE FSTMIAXCS FSTMIAXHS
syn keyword armasmOpcode	FSTMIAXCC FSTMIAXLO FSTMIAXMI FSTMIAXPL
syn keyword armasmOpcode	FSTMIAXVS FSTMIAXVC FSTMIAXHI FSTMIAXLS
syn keyword armasmOpcode	FSTMIAXGE FSTMIAXLT FSTMIAXGT FSTMIAXLE
syn keyword armasmOpcode	FSTMIAXAL

syn keyword armasmOpcode	FSTMDBS FSTMDBSEQ FSTMDBSNE FSTMDBSCS FSTMDBSHS
syn keyword armasmOpcode	FSTMDBSCC FSTMDBSLO FSTMDBSMI FSTMDBSPL
syn keyword armasmOpcode	FSTMDBSVS FSTMDBSVC FSTMDBSHI FSTMDBSLS
syn keyword armasmOpcode	FSTMDBSGE FSTMDBSLT FSTMDBSGT FSTMDBSLE
syn keyword armasmOpcode	FSTMDBSAL
syn keyword armasmOpcode	FSTMDBD FSTMDBDEQ FSTMDBDNE FSTMDBDCS FSTMDBDHS
syn keyword armasmOpcode	FSTMDBDCC FSTMDBDLO FSTMDBDMI FSTMDBDPL
syn keyword armasmOpcode	FSTMDBDVS FSTMDBDVC FSTMDBDHI FSTMDBDLS
syn keyword armasmOpcode	FSTMDBDGE FSTMDBDLT FSTMDBDGT FSTMDBDLE
syn keyword armasmOpcode	FSTMDBDAL
syn keyword armasmOpcode	FSTMDBX FSTMDBXEQ FSTMDBXNE FSTMDBXCS FSTMDBXHS
syn keyword armasmOpcode	FSTMDBXCC FSTMDBXLO FSTMDBXMI FSTMDBXPL
syn keyword armasmOpcode	FSTMDBXVS FSTMDBXVC FSTMDBXHI FSTMDBXLS
syn keyword armasmOpcode	FSTMDBXGE FSTMDBXLT FSTMDBXGT FSTMDBXLE
syn keyword armasmOpcode	FSTMDBXAL

syn keyword armasmOpcode	FLDS FLDSEQ FLDSNE FLDSCS FLDSHS FLDSCC FLDSLO
syn keyword armasmOpcode	FLDSMI FLDSPL FLDSVS FLDSVC FLDSHI FLDSLS
syn keyword armasmOpcode	FLDSGE FLDSLT FLDSGT FLDSLE FLDSAL
syn keyword armasmOpcode	FLDD FLDDEQ FLDDNE FLDDCS FLDDHS FLDDCC FLDDLO
syn keyword armasmOpcode	FLDDMI FLDDPL FLDDVS FLDDVC FLDDHI FLDDLS
syn keyword armasmOpcode	FLDDGE FLDDLT FLDDGT FLDDLE FLDDAL

syn keyword armasmOpcode	FLDMIAS FLDMIASEQ FLDMIASNE FLDMIASCS FLDMIASHS
syn keyword armasmOpcode	FLDMIASCC FLDMIASLO FLDMIASMI FLDMIASPL
syn keyword armasmOpcode	FLDMIASVS FLDMIASVC FLDMIASHI FLDMIASLS
syn keyword armasmOpcode	FLDMIASGE FLDMIASLT FLDMIASGT FLDMIASLE
syn keyword armasmOpcode	FLDMIASAL
syn keyword armasmOpcode	FLDMIAD FLDMIADEQ FLDMIADNE FLDMIADCS FLDMIADHS
syn keyword armasmOpcode	FLDMIADCC FLDMIADLO FLDMIADMI FLDMIADPL
syn keyword armasmOpcode	FLDMIADVS FLDMIADVC FLDMIADHI FLDMIADLS
syn keyword armasmOpcode	FLDMIADGE FLDMIADLT FLDMIADGT FLDMIADLE
syn keyword armasmOpcode	FLDMIADAL
syn keyword armasmOpcode	FLDMIAX FLDMIAXEQ FLDMIAXNE FLDMIAXCS FLDMIAXHS
syn keyword armasmOpcode	FLDMIAXCC FLDMIAXLO FLDMIAXMI FLDMIAXPL
syn keyword armasmOpcode	FLDMIAXVS FLDMIAXVC FLDMIAXHI FLDMIAXLS
syn keyword armasmOpcode	FLDMIAXGE FLDMIAXLT FLDMIAXGT FLDMIAXLE
syn keyword armasmOpcode	FLDMIAXAL

syn keyword armasmOpcode	FLDMDBS FLDMDBSEQ FLDMDBSNE FLDMDBSCS FLDMDBSHS
syn keyword armasmOpcode	FLDMDBSCC FLDMDBSLO FLDMDBSMI FLDMDBSPL
syn keyword armasmOpcode	FLDMDBSVS FLDMDBSVC FLDMDBSHI FLDMDBSLS
syn keyword armasmOpcode	FLDMDBSGE FLDMDBSLT FLDMDBSGT FLDMDBSLE
syn keyword armasmOpcode	FLDMDBSAL
syn keyword armasmOpcode	FLDMDBD FLDMDBDEQ FLDMDBDNE FLDMDBDCS FLDMDBDHS
syn keyword armasmOpcode	FLDMDBDCC FLDMDBDLO FLDMDBDMI FLDMDBDPL
syn keyword armasmOpcode	FLDMDBDVS FLDMDBDVC FLDMDBDHI FLDMDBDLS
syn keyword armasmOpcode	FLDMDBDGE FLDMDBDLT FLDMDBDGT FLDMDBDLE
syn keyword armasmOpcode	FLDMDBDAL
syn keyword armasmOpcode	FLDMDBX FLDMDBXEQ FLDMDBXNE FLDMDBXCS FLDMDBXHS
syn keyword armasmOpcode	FLDMDBXCC FLDMDBXLO FLDMDBXMI FLDMDBXPL
syn keyword armasmOpcode	FLDMDBXVS FLDMDBXVC FLDMDBXHI FLDMDBXLS
syn keyword armasmOpcode	FLDMDBXGE FLDMDBXLT FLDMDBXGT FLDMDBXLE
syn keyword armasmOpcode	FLDMDBXAL

syn keyword armasmOpcode	FMSR FMSREQ FMSRNE FMSRCS FMSRHS FMSRCC FMSRLO
syn keyword armasmOpcode	FMSRMI FMSRPL FMSRVS FMSRVC FMSRHI FMSRLS
syn keyword armasmOpcode	FMSRGE FMSRLT FMSRGT FMSRLE FMSRAL

syn keyword armasmOpcode	FMRS FMRSEQ FMRSNE FMRSCS FMRSHS FMRSCC FMRSLO
syn keyword armasmOpcode	FMRSMI FMRSPL FMRSVS FMRSVC FMRSHI FMRSLS
syn keyword armasmOpcode	FMRSGE FMRSLT FMRSGT FMRSLE FMRSAL

syn keyword armasmOpcode	FMDLR FMDLREQ FMDLRNE FMDLRCS FMDLRHS FMDLRCC
syn keyword armasmOpcode	FMDLRLO FMDLRMI FMDLRPL FMDLRVS FMDLRVC FMDLRHI
syn keyword armasmOpcode	FMDLRLS FMDLRGE FMDLRLT FMDLRGT FMDLRLE FMDLRAL

syn keyword armasmOpcode	FMRDL FMRDLEQ FMRDLNE FMRDLCS FMRDLHS FMRDLCC
syn keyword armasmOpcode	FMRDLLO FMRDLMI FMRDLPL FMRDLVS FMRDLVC FMRDLHI
syn keyword armasmOpcode	FMRDLLS FMRDLGE FMRDLLT FMRDLGT FMRDLLE FMRDLAL

syn keyword armasmOpcode	FMDHR FMDHREQ FMDHRNE FMDHRCS FMDHRHS FMDHRCC
syn keyword armasmOpcode	FMDHRLO FMDHRMI FMDHRPL FMDHRVS FMDHRVC FMDHRHI
syn keyword armasmOpcode	FMDHRLS FMDHRGE FMDHRLT FMDHRGT FMDHRLE FMDHRAL

syn keyword armasmOpcode	FMRDH FMRDHEQ FMRDHNE FMRDHCS FMRDHHS FMRDHCC
syn keyword armasmOpcode	FMRDHLO FMRDHMI FMRDHPL FMRDHVS FMRDHVC FMRDHHI
syn keyword armasmOpcode	FMRDHLS FMRDHGE FMRDHLT FMRDHGT FMRDHLE FMRDHAL

syn keyword armasmOpcode	FMXR FMXREQ FMXRNE FMXRCS FMXRHS FMXRCC FMXRLO
syn keyword armasmOpcode	FMXRMI FMXRPL FMXRVS FMXRVC FMXRHI FMXRLS
syn keyword armasmOpcode	FMXRGE FMXRLT FMXRGT FMXRLE FMXRAL

syn keyword armasmOpcode	FMRX FMRXEQ FMRXNE FMRXCS FMRXHS FMRXCC FMRXLO
syn keyword armasmOpcode	FMRXMI FMRXPL FMRXVS FMRXVC FMRXHI FMRXLS
syn keyword armasmOpcode	FMRXGE FMRXLT FMRXGT FMRXLE FMRXAL

syn keyword armasmOpcode	FMSTAT FMSTATEQ FMSTATNE FMSTATCS FMSTATHS
syn keyword armasmOpcode	FMSTATCC FMSTATLO FMSTATMI FMSTATPL FMSTATVS
syn keyword armasmOpcode	FMSTATVC FMSTATHI FMSTATLS FMSTATGE FMSTATLT
syn keyword armasmOpcode	FMSTATGT FMSTATLE FMSTATAL

syn keyword armasmOpcode	ADR ADREQ ADRNE ADRCS ADRHS ADRCC ADRLO
syn keyword armasmOpcode	ADRMI ADRPL ADRVS ADRVC ADRHI ADRLS
syn keyword armasmOpcode	ADRGE ADRLT ADRGT ADRLE ADRAL
syn keyword armasmOpcode	ADRL ADREQL ADRNEL ADRCSL ADRHSL ADRCCL ADRLOL
syn keyword armasmOpcode	ADRMIL ADRPLL ADRVSL ADRVCL ADRHIL ADRLSL
syn keyword armasmOpcode	ADRGEL ADRLTL ADRGTL ADRLEL ADRALL

syn keyword armasmDirective	ADDRESS ALIGN AREA ASSERT CN CODE16 CODE32 CP
syn keyword armasmDirective	DATA DCB DCD DCDO DCDU DCFD DCFDU DCFS DCFSU
syn keyword armasmDirective	DCI DCQ DCQU DCW DCWU DN ELSE END ENDFUNC ENDIF
syn keyword armasmDirective	ENDP ENTRY EQU EXPORT EXPORTAS EXTERN FIELD FN
syn keyword armasmDirective	FRAME FUNCTION GBLA GBLL GBLS GET GLOBAL IF
syn keyword armasmDirective	IMPORT INCBIN INCLUDE INFO KEEP LCLA LCLL LCLS
syn keyword armasmDirective	LTORG MACRO MAP MEND MEXIT NOFP OPT POP PROC
syn keyword armasmDirective	PUSH REGISTER REMEMBER REQUIRE RESTORE RLIST RN
syn keyword armasmDirective	ROUT SAVE SETA SETL SETS SN SPACE STATE SUBT
syn keyword armasmDirective	TTL WEND WHILE ENDM
syn keyword armasmDirective	ASSOC CODE COMDEF COMMON NOINIT READONLY
syn keyword armasmDirective	READWRITE WEAK

" ARMv7 opcoes
" 
syn keyword armasmOpcode	CLREX CLREXEQ CLREXNE CLREXCS CLREXHS CLREXCC CLREXLO
syn keyword armasmOpcode	CLREXMI CLREXPL CLREXVS CLREXVC CLREXHI CLREXLS
syn keyword armasmOpcode	CLREXGE CLREXLT CLREXGT CLREXLE CLREXAL

syn keyword armasmOpcode	STREX STREXEQ STREXNE STREXCS STREXHS STREXCC STREXLO
syn keyword armasmOpcode	STREXMI STREXPL STREXVS STREXVC STREXHI STREXLS
syn keyword armasmOpcode	STREXGE STREXLT STREXGT STREXLE STREXAL

syn keyword armasmOpcode	LDREX LDREXEQ LDREXNE LDREXCS LDREXHS LDREXCC LDREXLO
syn keyword armasmOpcode	LDREXMI LDREXPL LDREXVS LDREXVC LDREXHI LDREXLS
syn keyword armasmOpcode	LDREXGE LDREXLT LDREXGT LDREXLE LDREXAL
syn keyword armasmOpcode	DSB ISB DMB SEV SEVL YIELD

syn keyword armasmOpcode	WFI WFIEQ WFINE WFICS WFIHS WFICC WFILO
syn keyword armasmOpcode	WFIMI WFIPL WFIVS WFIVC WFIHI WFILS
syn keyword armasmOpcode	WFIGE WFILT WFIGT WFILE WFIAL

syn keyword armasmOpcode	WFE WFEEQ WFENE WFECS WFEHS WFECC WFELO
syn keyword armasmOpcode	WFEMI WFEPL WFEVS WFEVC WFEHI WFELS
syn keyword armasmOpcode	WFEGE WFELT WFEGT WFELE WFEAL


syn keyword armasmOpcode	HVC HVCEQ HVCNE HVCCS HVCHS HVCCC HVCLO
syn keyword armasmOpcode	HVCMI HVCPL HVCVS HVCVC HVCHI HVCLS
syn keyword armasmOpcode	HVCGE HVCLT HVCGT HVCLE HVCAL

syn keyword armasmOpcode	SMC SMCEQ SMCNE SMCCS SMCHS SMCCC SMCLO
syn keyword armasmOpcode	SMCMI SMCPL SMCVS SMCVC SMCHI SMCLS
syn keyword armasmOpcode	SMCGE SMCLT SMCGT SMCLE SMCAL

" ARMv8 opcodes
syn keyword armasmOpcode	RET UMOV SMOV FMOV MOV32 ERET
syn keyword armasmOpcode	B.NE B.EQ B.LT B.GE
syn keyword armasmOpcode	BR BLR UBFX
syn keyword armasmOpcode	LDP STP
syn keyword armasmOpcode	IC CPUID TLB AT TLBI SYS SYSL
syn keyword armasmOpcode	DC AT TLBI
syn keyword armasmOpcode	BRK HLT HVC SMC SVC

syn keyword armasmOpcode	DCPS1 DCPS2 DCPS3 DRPS
syn keyword armasmOpcode	YIELD WFE WFI SEV SEVL HINT
syn keyword armasmOpcode	CLREX DSB DMB ISB
syn keyword armasmOpcode	MOV_IMM

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_armasm_syntax_inits")
  if version < 508
    let did_armasm_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink armasmTodo		Todo
  HiLink armasmComment		Comment
  HiLink armasmCommentStart	Comment
  HiLink armasmDirective	Statement
  HiLink armasmString		String
  HiLink armasmRegister		Structure
  HiLink armasmASCII		Character
  HiLink armasmBinary		Number
  HiLink armasmDecimal		Number
  HiLink armasmHexadecimal	Number
  HiLink armasmOctal		Number
  HiLink armasmBase3		Number
  HiLink armasmBase4		Number
  HiLink armasmBase5		Number
  HiLink armasmBase6		Number
  HiLink armasmBase7		Number
  HiLink armasmBase9		Number
  HiLink armasmFloat		Float
  HiLink armasmBoolean		Boolean
  HiLink armasmBuiltIn		Constant
  HiLink armasmIdentifier	Identifier
  HiLink armasmAddress		Special
  HiLink armasmInstrBin		Todo
  HiLink armasmIfdef		PreCondit
  "
  " The following look better (for me, at least) with the alternate mappings,
  " although the more "natural" way to highlight them is as follows:
  "
  HiLink armasmLabel		Label
  HiLink armasmOpcode		Keyword
  HiLink armasmOperator		Operator

  HiLink armasmLabel		Identifier
  HiLink armasmOpcode		Normal
  HiLink armasmOperator		Special

  delcommand HiLink
endif

let b:current_syntax = "armasm"

" vim: ts=8
