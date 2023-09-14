
function! GitStatus()
  let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  return strlen(l:branchname) > 0?'branch:'.l:branchname.' ':''
endfunction

