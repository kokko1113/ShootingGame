int[] balls;
Player player;

void setup() {
    size(600, 600);
    background(255);
    
    player = Player();
}

void draw() {
    
}

void moveBall() {
    for (int i = 0;i < balls.length;i++) {
        // 壁に達していた場合、向きを反転させる
        if (balls[i].x <=  0 || balls[i].x >=  width) {
            balls[i].speedX =-  balls[i].speedX
        }
        balls[i].x += balls[i].speedX;
        balls[i].y -= balls[i].speedy;
    }
}
void movePlayer() {
    
}
void moveEnemy() {
    
}

void keyPressed() {
    if (key ==  'f') {
        // 新しいボールを出す
        balls = append(balls, Ball());
    }
}

//　ボールのクラス
class ball{
    int x,y; // ｘ、ｙ座標
    int speedX,speedY;//　ｘ、ｙ方向へのスピード
    int size; //サイズ
    color c; //色
    
    Ball(int playerSpeed,playerX,playerWidth) {
        x = (playerX + playerWidth) / 2;
        y = 540;
        size = 20;
        speedX = playerSpeed;
        speedY = 5;
        size = 10;
        c = #00ff00;
        ellipse(x, y, size, size);
    }
}
//　プレイヤーのクラス
class player{
    int x,y; // ｘ、ｙ座標
    int speed;// スピード
    int w; //横幅
    
    Player() {
        x = 0;
        y = 540;
        w = 80;
        line(x,y,x + w,y);
    }
}
