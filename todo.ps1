$todoList = New-Object System.Collections.ArrayList

Function processResult($result){
    if($result -eq 1) {
        createNewTask
    }
    elseif($result -eq 2) {
        markTaskDone
    }
    elseif($result -eq 3) {
        deleteTask
    }
    writeToScreen
}

Function createNewtask() {
    $task = Read-Host 'Enter new task'
    $length = $todoList.Count
    [void] $todoList.Add("$length $task")
}

Function markTaskDone() {
    $i = Read-Host 'Enter task number'
    $task = $todoList[$i]
    $task = $task + " ** Done ** "
    $todoList[$i] = $task
}

Function deleteTask() {
    $i = Read-Host 'Enter task number'
    $todoList.RemoveAt($i)
}

function writeToScreen() {
    Clear-Variable $result
    Clear-Host
    Write-Host '*************************'
    $todoList
    Write-Host '*************************'
    Write-Host 'Enter 1 to enter new task'
    Write-Host 'Enter 2 to mark task done'
    Write-Host 'Enter 3 to delete task'
    $result = Read-Host 'select option'
    processResult $result
}

writeToScreen


