# I've found this code somewhere on stack overflow and then rewritten it to coffee script
# unfortunately I do not have question URL anymore

# page:load is for turbolinks
$(document).bind 'page:load', -> allowTabKey()
$(document).ready -> allowTabKey()  

allowTabKey = ->
  $("textarea").keydown (e) ->
    # 9 is for tab key
    if e.keyCode == 9
      # get caret position/selection
      start = @.selectionStart
      end = @.selectionEnd

      $this = $(this)
      value = $this.val()

      # set textarea value to: text before caret + tab + text after caret
      $this.val("#{value.substring(0, start)}\t#{value.substring(end)}")
      
      # put caret at right position again (add one for the tab)
      @.selectionStart = @.selectionEnd = start + 1

      # prevent the focus lose
      e.preventDefault()