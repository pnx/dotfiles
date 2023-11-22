function sail --wraps='[ -f sail ] && sh sail || sh vendor/bin/sail' --description 'alias sail=[ -f sail ] && sh sail || sh vendor/bin/sail'
  [ -f sail ] && sh sail || sh vendor/bin/sail $argv
        
end
