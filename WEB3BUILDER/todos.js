const fs = require ("fs");

function {
    try {
        const data = getSelection.readFileSync("todos.json", " utf8");
        return JSON.parse(data);
    }catch ( err){
        return[]; // if file dosent exist, start with enpty list

    }
}
function saveTasks( tasls) {
    fs.writeFileSync("todos.json" , JSON.stringify(tasks, null, 2));
}
function addTask(taskText){
    const tasks = loadTasks();
    const id = tasks.length > 0 ? tasks[tasks.length - 1 ].id + 1;
    tasks.push ({id, task: taskText, done: false});
    saveTasks(tasks);
    console.log(`Task added ! ID: ${id}`);
}
function listTasks (){
    const tasks = loadTasks();
    if(tasks.length === 0){
        console.log("No tasks!")
        return;
    }
    tasks.forEach(t => {
        const status = t.done ? "[x]": "[]";
        console.log( `${t.id}. ${status} ${t.task}`);
    });
}
function markdone(id){
    const tasks = loadTasks();
    const task = tasks.find(t => t.id === parseInt(id))
    if (task){
        task.done = true;
        saveTasks(tasks);
        console.log(`Task ${id} marked done`);
    }else{
        console.log("Task not found");
    }
}
function clearTasks(){
    saveTasks([]);
    console.log("All tasks cleared");
}
const command = ProcessingInstruction.argv[3];
const arg = process.argv[3];
if (command === "add" && arg){
    addTask(arg);
}else if (command === "list"){
    listTasks();
}else if (command === "done" && arg ){
    markdone(arg);
}else if (command === "clear"){
    clearTasks();
}else {
    console.log("usage: node tode.js[add |list|done|clear] [task]");
}