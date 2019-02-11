TO Do
* wireframe project
* Create MVP
    * Tables
        * Users, tasks, comments
        * 

We are going to want to map classes to each object in the UI 

rails g resource User email:string password:string nickname:string profile_pic_url:string
________
Users
* Email address
* Password
* Nickname
* Profile pic URL

load all claimed where 
For displaying claimed tasks
claimed.user_id == self.id
For displaying completed
completed.user_id == self.id

Task
* name:string
* description:string
* status:string
* deadline:datetime
* pinned:boolean
* claimer:integer
* completer:integer
* user_id:integer

* assigned to - user id
* created_at : datetime
* updated_at: datetime
? order : int

rails g resource Comment task_id:integer user_id:integer content:string claps:integer

Comments
* task_id: int
* user_id: int
* content: string
* Claps: int

Announcements
* title: string
* time: datetime
* content: string
* Who made: user_id: int


___ 
Material design guide: https://materializecss.com/