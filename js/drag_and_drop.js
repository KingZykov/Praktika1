const zone1 = document.querySelector('#col1');
const zone2 = document.querySelector('#col2');
const zone3 = document.querySelector('#col3');
const task = document.querySelector('.accordion');

/*const task = document.addEventListener("mousedown", function(event) {
    const elementId = event.target.id;
    console.log("Id элемента: " + elementId);
  });*/

/*const task = document.querySelector('.accordion.list-group-item.pe-auto');*/
/*const task = document.querySelector('#task-todo-1');*/
/*list-group-item*/

zone1.ondragover = allowDrop;
zone2.ondragover = allowDrop;
zone3.ondragover = allowDrop;

function allowDrop(event) {
    event.preventDefault();
}

task.ondragstart = drag;

function drag (event){
    event.dataTransfer.setData('id', event.target.id);

}

zone1.ondrop = drop;
zone2.ondrop = drop;
zone3.ondrop = drop;

function drop (event){
    let itemId = event.dataTransfer.getData('id');
    console.log(itemId);
    event.target.append(document.getElementById(itemId))
}
/*getElementByClass*/

/*list-group list-group-flush*/

/*  list-group
accordion.list-group-item.pe-auto
*/