// Define variables
const gameBoard = document.getElementById("game-board");
const boardSize = 40;
const squareSize = gameBoard.clientWidth / boardSize;
let score = 0;
let snake = [
    { x: 20, y: 20 },
    { x: 19, y: 20 },
    { x: 18, y: 20 },
];
let food = {};

// Define functions
function drawSnake() {
    for (let i = 0; i < snake.length; i++) {
        const snakeElement = document.createElement("div");
        snakeElement.classList.add("snake");
        snakeElement.style.top = snake[i].y * squareSize + "px";
        snakeElement.style.left = snake[i].x * squareSize + "px";
        gameBoard.appendChild(snakeElement);
    }
}

function updateSnake() {
    const head = { x: snake[0].x + direction.x, y: snake[0].y + direction.y };
    snake.unshift(head);
    if (head.x === food.x && head.y === food.y) {
        generateFood();
        score++;
    } else {
        snake.pop();
    }
}

function drawFood() {
    const foodElement = document.createElement("div");
    foodElement.classList.add("food");
    foodElement.style.top = food.y * squareSize + "px";
    foodElement.style.left = food.x * squareSize + "px";
    gameBoard.appendChild(foodElement);
}

function generateFood() {
    food = {
        x: Math.floor(Math.random() * boardSize),
        y: Math.floor(Math.random() * boardSize),
    };
}

function checkGameOver() {
    if (
        snake[0].x < 0 ||
        snake[0].x >= boardSize ||
        snake[0].y < 0 ||
        snake[0].y >= boardSize
    ) {
        return true;
    }
    for (let i = 1; i < snake.length; i++) {
        if (snake[i].x === snake[0].x && snake[i].y === snake[0].y) {
            return true;
        }
    }
    return false;
}

function gameLoop() {
    if (checkGameOver()) {
        alert(`Game over! Your score was ${score}.`);
        return;
    }

    gameBoard.innerHTML = "";

    updateSnake();
    drawSnake();
    drawFood();

    setTimeout(gameLoop, 100);
}

// Set up event listener for arrow keys
let direction = { x: 1, y: 0 };
document.addEventListener("keydown", (event) => {
    switch (event) {
        case "ArrowUp":
            direction = { x: 0, y: -1 };
            break;
        case "ArrowDown":
            direction = { x: 0, y: 1 };
            break;
        case "ArrowLeft":
            direction = { x: -1, y: 0 };
            break;
        case "ArrowRight":
            direction = { x: 1, y: 0 };
            break;
        default:
            break;
    }
});
