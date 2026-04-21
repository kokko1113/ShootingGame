ArrayList<Ball> balls = new ArrayList<Ball>();
Player player;
Enemy enemy;
int prevPlayerX = 0;
int score = 0;

class Ball {
    int x, y;
    int speedX, speedY;
    int size = 10;
    color c = #00ff00;

    Ball() {
        x = (int)(player.x + (player.size / 2));
        y = 540;
        speedX = player.x - prevPlayerX;
        speedY = 5;

        fill(c);
        noStroke();
        ellipse(x, y, size, size);
    }
}

class Player {
    int x, y;
    int size;

    Player() {
        x = 0;
        y = 540;
        size = 80;
        noFill();
        stroke(0);
        line(x, y, x + size, y);
    }
}

class Enemy {
    int x, y;
    int size = 150;
    int speed = 5;
    color c = #ff0000;

    Enemy() {
        x = 0;
        y = 30;
        noFill();
        stroke(c);
        line(x, y, x + size, y);
    }
}

void setup() {
    size(600, 600);
    player = new Player();
    enemy = new Enemy();
}

void draw() {
    background(255); // 画面更新用

    moveBall();
    movePlayer();
    moveEnemy();
    announceScore();
    
    prevPlayerX = player.x;
}

void announceScore(){
    fill(#0000ff);
    textSize(30);
    text(score + " HIT", 20, 30);
}

boolean isHitted(int ballX){
    if(ballX >= enemy.x && ballX <= enemy.x + enemy.size){
        return true;
    }else{
        return false;
    }
}

void moveBall() {
    for (int i = 0; i < balls.size(); i++) {  // ボールを一つずつ操作
        if (balls.get(i).x <= 0 || balls.get(i).x >= width) { // 左右の壁に達したら方向転換
            balls.get(i).speedX = -balls.get(i).speedX;
        }
        
        if(balls.get(i).y < enemy.y && isHitted(balls.get(i).x)){ // 弾が敵に当たったら
            score++;
            
            balls.remove(i);
            i--;  //削除した分スキップ
            continue;
        }else if(balls.get(i).y < 0){ // ボールが画面外に出たら削除
            balls.remove(i);
            i--; 
            continue;
        }
        
        balls.get(i).x += balls.get(i).speedX;
        balls.get(i).y -= balls.get(i).speedY;

        noStroke();
        fill(balls.get(i).c);
        ellipse(balls.get(i).x, balls.get(i).y, balls.get(i).size, balls.get(i).size);
    }
}

void movePlayer(){
    stroke(0);
    noFill();
    line(player.x, player.y, player.x + player.size, player.y);
}

void moveEnemy(){
    if (enemy.x < 0 || enemy.x > width - enemy.size) { // 左右の壁に達したら方向転換
        enemy.speed = -enemy.speed;
    }

    enemy.x += enemy.speed;
    stroke(enemy.c);
    noFill();
    line(enemy.x, enemy.y, enemy.x + enemy.size, enemy.y);
}

void mouseMoved(){
    player.x = constrain(mouseX, 0, width - player.size);
}

void keyPressed() {
    if (key == 'f') {
        balls.add(new Ball());
    }
}
