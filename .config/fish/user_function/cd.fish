if type standard_cd >/dev/null 2>&1
else
    functions --copy cd standard_cd
end

function cd
    standard_cd $argv; and ll
end
