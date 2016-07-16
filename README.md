#Vim Configurations for Linux

| ~/.vim/            | | |
| :--- | --- | --- |
| ├─ **autoload**/   | *plug.vim*      | `plugin` [Vim-plug](https://github.com/junegunn/vim-plug) -- plugin manager                       |
| ├─ **plugged **/   | **vim-session** | `plugin` [vim-session](https://github.com/xolox/vim-session)                                      |
|                    | **vim-misc**    | `plugin` [vim-misc](https://github.com/xolox/vim-misc) -- vim-session dependency                  |
| ├─ **colors**/     | *monokai.vim*   | `colorscheme` [monokai](https://github.com/sickill/vim-monoka)                                    |
|                    | *tender.vim*    | `colorscheme` [tender](https://github.com/jacoborus/tender.vim)                                   |
| ├─ **syntax**/     | *tut.vim*       | `syntax` tut(orial), used in my notes of [ROS tutorials](https://github.com/Neur1n/ROS_Tutorials) |
|                    | *bug.vim*       | `syntax` bug logging, used in my [bug logs](https://github.com/Neur1n/bug_logs)                   |
| ├─ *filetype.vim*  |                 | `line 2637` au BufRead,BufNewFile *.tut setf tut -- make tut.vim works                            |
|                    |                 | `line 2638` au BufRead,BufNewFile *.bug setf bug -- make bug.vim works                            |
| └─ *vimrc*         |                 |                                                                                                   |
