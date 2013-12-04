# diablillo

Method missing is monkey patched so calling methods like `:¿empty?` will call `:empty?`

```
require 'diablillo'

'Ruby no habla español'.¡gsub!('no habla', 'habla')
# => "Ruby habla español"
```
