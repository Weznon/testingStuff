## Modes
**Vim** has two modes insertion mode and command mode. The editor begins in command mode, where the cursor movement and text deletion and pasting occur. Insertion mode begins upon entering an insertion or change command. **`[ESC]`** returns the editor to command mode (where you can quit, for example by typing **`:q!`**). Most commands execute as soon as you type them except for "colon" commands which execute when you press the ruturn key.

## Quitting
* **`:x`**	Exit, saving changes <br/>
* **`:q`**	Exit as long as there have been no changes <br/>
* **`ZZ`**	Exit and save changes if any have been made <br/>
* **`:q!`**	Exit and ignore any changes<br/>

## Inserting Text
* **`i`**	Insert before cursor <br/>
* **`I`**	Insert before line <br/>
* **`a`**	Append after cursor <br/>
* **`A`**	Append after line <br/>
* **`o`**	Open a new line after current line <br/>
* **`O`**	Open a new line before current line <br/>
* **`r`**	Replace one character <br/>
* **`R`**	Replace many characters <br/>

## Motion
* **`h`**	Move left <br/>
* **`j`**	Move down  <br/>
* **`k`**	Move up  <br/>
* **`l`**	Move right  <br/>
* **`w`**	Move to next word  <br/>
* **`W`**	Move to next blank delimited word <br/>
* **`b`**	Move to the beginning of the word <br/>
* **`B`**	Move to the beginning of blank delimted word <br/>
* **`e`**	Move to the end of the word <br/>
* **`E`**	Move to the end of Blank delimited word <br/>
* **`(`**	Move a sentence back <br/>
* **`)`**	Move a sentence forward <br/>
* **`{`**	Move a paragraph back <br/>
* **`}`**	Move a paragraph forward <br/>
* **`0`**	Move to the begining of the line <br/>
* **`H`**	Move to top of screen <br/>
* **`M`**	Move to middle of screen <br/>
* **`L`**	Move to botton of screen <br/>
* **`%`**	Move to associated ( ), { }, [ ] <br/>

## Search for strings
* **`/str`**	Search forward for string<br/>
* **`?str`**	Search back for string<br/>
* **`n`**	Search for next instance of string<br/>
* **`N`**	Search for previous instance of string<br/>

## Deleting Text
Almost all deletion commands are performed by typing d followed by a motion. For example, dw deletes a word. A few other deletes are:

* **`x`**	Delete character to the right of cursor<br/>
* **`X`**	Delete character to the left of cursor<br/>
* **`D`**	Delete to the end of the line<br/>
* **`dd`**	Delete current line<br/>
* **`:d`**	Delete current line<br/>

## Replace
The search and replace function is accomplished with the :s command. It is commonly used in combination with ranges or the :g command (below).

* **`:s/pattern/string/flags`**	Replace pattern with string according to flags. (Example: `:%s/foo/bar/`. Find each occurrence of 'foo' (in all lines), and replace it with 'bar'.) <br/>
* **`g`** Flag - Replace all occurrences of pattern <br/>
* **`c`** Flag - Confirm replaces. <br/>
* **`&`** Repeat last :s command <br/>

## Files
* **`:w file`**	Write to file<br/>
* **`:r file`**	Read file in after line<br/>
* **`:n`**	Go to next file<br/>
* **`:p`**	Go to previos file<br/>
* **`:e file`**	Edit file<br/>
* **`!!program`**	Replace line with output from program<br/>

## Other
* **`~`**	Toggle upp and lower case <br/>
* **`J`**	Join lines <br/>
* **`.`**	Repeat last text-changing command <br/>
* **`u`**	Undo last change <br/>
* **`U`**	Undo all changes to line <br/>

## Keybindings and commands

The commands are organized into logical groups to help you remember
them.

### Types, autocomplete, refactoring, and linting

<table>
<tbody>
  <tr>
    <td>&lt;Tab&gt;</td><td>Autocomplete with words in file</td>
  </tr>
  <tr>
    <td>&lt;C-space&gt;</td><td>Autocomplete with symbols in your Cabal sandbox</td>
  </tr>
  <tr>
    <td>,ht</td><td>Show type of expression under cursor</td>
  </tr>
  <tr>
    <td>,hT</td><td>Insert type of expression into previous line</td>
  </tr>
  <tr>
    <td>,hr</td><td>Apply one refactoring hint at cursor position</td>
  </tr>
  <tr>
    <td>,hR</td><td>Apply all refactoring suggestions in the file</td>
  </tr>
  <tr>
    <td>,hl</td><td>Run Haskell linter on file</td>
  </tr>
  <tr>
    <td>,hc</td><td>Run Haskell compile check on file</td>
  </tr>
  <tr>
    <td>,&lt;cr&gt;</td><td>Clear type selection</td>
  </tr>
</tbody>
</table>

### Hoogle

<table>
<tbody>
  <tr>
    <td>,hh</td><td>Run Hoogle on the word under the cursor</td>
  </tr>
  <tr>
    <td>,hH</td><td>Run Hoogle and prompt for input</td>
  </tr>
  <tr>
    <td>,hi</td><td>Run Hoogle for detailed information on word under cursor</td>
  </tr>
  <tr>
    <td>,hI</td><td>Run Hoogle for detailed information and prompt for input</td>
  </tr>
  <tr>
    <td>,hz</td><td>Close the Hoogle search window</td>
  </tr>
</tbody>
</table>

### GHCI repl

If you open a tmux terminal alongside MacVim then you can send Vim
selections to it. This works well for evaluating things in GHCI.

<table>
<tbody>
  <tr>
    <td>,rs</td><td>Send selected text to tmux</td>
  </tr>
  <tr>
    <td>,rv</td><td>Change tmux session, window, and pane attachment</td>
  </tr>
</tbody>
</table>

### Git

<table>
<tbody>
  <tr>
    <td>,g?</td><td>Last-committed files (Monday morning key)</td>
  </tr>
  <tr>
    <td>,gs</td><td>Git status (fugitive)</td>
  </tr>
  <tr>
    <td>,gg</td><td>Git grep</td>
  </tr>
  <tr>
    <td>,gl</td><td>Git log (extradition)</td>
  </tr>
  <tr>
    <td>,gd</td><td>Git diff</td>
  </tr>
  <tr>
    <td>,gb</td><td>Git blame</td>
  </tr>
</tbody>
</table>

### Commenting

<table>
<tbody>
  <tr>
    <td>gc</td><td>Comment / Uncomment selection</td>
  </tr>
</tbody>
</table>

### Aligning

<table>
<tbody>
  <tr>
    <td>,a=</td><td>Align on equal signs</td>
  </tr>
  <tr>
    <td>,a,</td><td>Align on commas</td>
  </tr>
  <tr>
    <td>,a|</td><td>Align on vertical bar</td>
  </tr>
  <tr>
    <td>,ap</td><td>Align on character of your choice</td>
  </tr>
</tbody>
</table>

### Splits and find file

<table>
<tbody>
  <tr>
    <td>,&lt;space&gt;</td><td>Fuzzy file find (CtrlP)</td>
  </tr>
  <tr>
    <td>,f</td><td>Toggle file browser, find file</td>
  </tr>
  <tr>
    <td>,F</td><td>Toggle file browser</td>
  </tr>
  <tr>
    <td>,sj</td><td>Open split below</td>
  </tr>
  <tr>
    <td>,sk</td><td>Open split above</td>
  </tr>
  <tr>
    <td>,sh</td><td>Open split leftward</td>
  </tr>
  <tr>
    <td>,sl</td><td>Open split rightward</td>
  </tr>
</tbody>
</table>

### Tags

<table>
<tbody>
  <tr>
    <td>,tg</td><td>Generate tags with codex</td>
  </tr>
  <tr>
    <td>,tt</td><td>Open/close the tag bar</td>
  </tr>
  <tr>
    <td>C-]</td><td>Jump to definition of symbol (codex + hasktags)</td><td>Note: You must generate the tags for your project (with <code>,tg</code>) prior to using the jump command.</td> 
  </tr>
  <tr>
    <td>C-\</td><td>Show uses of symbol (hscope)</td>
  </tr>
</tbody>
</table>

### Conversions

<table>
<tbody>
  <tr>
    <td>,h.</td><td>Transform visual selection to pointfree style</td>
  </tr>
  <tr>
    <td>,h&gt;</td><td>Transform visual selection to pointed style</td>
  </tr>
</tbody>
</table>

### Buffers

<table>
<tbody>
  <tr>
    <td>,bp</td><td>Previous buffer</td>
  </tr>
  <tr>
    <td>,bn</td><td>Next buffer</td>
  </tr>
  <tr>
    <td>,b&lt;space&gt;</td><td>Buffer fuzzy finder</td>
  </tr>
  <tr>
    <td>,bd</td><td>Delete buffer, keep window open (bbye)</td>
  </tr>
  <tr>
    <td>,bo</td><td>Close all buffers except the current one</td>
  </tr>
</tbody>
</table>

### Misc

<table>
<tbody>
  <tr>
    <td>,ma</td><td>Enable mouse mode (default)</td>
  </tr>
  <tr>
    <td>,mo</td><td>Disable mouse mode</td>
  </tr>
  <tr>
    <td>,ig</td><td>Toggle indentation guides</td>
  </tr>
  <tr>
    <td>,u</td><td>Interactive undo tree</td>
  </tr>
  <tr>
    <td>,ss</td><td>Enable spell checking</td>
  </tr>
  <tr>
    <td>,e</td><td>Open file prompt with current path</td>
  </tr>
  <tr>
    <td>,&lt;cr&gt;</td><td>Clear search highlights</td>
  </tr>
  <tr>
    <td>,r</td><td>Redraw screen</td>
  </tr>
  <tr>
    <td>C-h</td><td>Move cursor to leftward pane</td>
  </tr>
  <tr>
    <td>C-k</td><td>Move cursor to upward pane</td>
  </tr>
  <tr>
    <td>C-j</td><td>Move cursor to downward pane</td>
  </tr>
  <tr>
    <td>C-l</td><td>Move cursor to rightward pane (redraw is `,r` instead)</td>
  </tr>
  <tr>
    <td>gq</td><td>Format selection using `hindent` for haskell buffers (`par` for others)</td>
  </tr>
  <tr>
    <td>,y</td><td>Yank to OS clipboard</td>
  </tr>
  <tr>
    <td>,d</td><td>Delete to OS clipboard</td>
  </tr>
  <tr>
    <td>,p</td><td>Paste from OS clipboard</td>
  </tr>
</tbody>
</table>

(If you prefer to restore the default screen redraw action of `C-l`
then add `unmap <c-l>` to your vimrc.local)
