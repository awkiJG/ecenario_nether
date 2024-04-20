class Game {
  PImage FondoImage;
  PImage jugadorImage;
  PImage enemigoImage;
  PImage nubeImage;
  PImage ladrillo;
  ArrayList<Cloud> clouds;

  int playerX, playerY;
  int enemyX, enemyY;
  int enemySpeed;
  int direction;
  int xlad;

  Game() {
    loadImages();
    createClouds();
    playerX = 50;
    playerY = 200;
    enemyX = 600;
    enemyY = 100;
    xlad = 0;
    enemySpeed = 2;
    direction = 1;
  }

  void draw() {
    image(FondoImage, 0, 0, width, height);
    drawClouds();
    moveEnemy();
    movePlayer();
    ladrillo();
  }

  private void loadImages() {
    FondoImage = loadImage("fondo.png");
    jugadorImage = loadImage("jugador.png");
    enemigoImage = loadImage("enemigo.png");
    nubeImage = loadImage("nube.png");
    ladrillo = loadImage("ladrillo.png");
  }

  private void createClouds() {
    clouds = new ArrayList<Cloud>();
    for (int i = 0; i < 25; i++) {
      clouds.add(new Cloud(random(width), random(height), random(100, 150), random(1, 5)));
    }
  }
private void ladrillo(){
    while(xlad<width){
      image(ladrillo, xlad, height-75);
      xlad= xlad+134;
    }
  }
    
  private void drawClouds() {
    for (Cloud cloud : clouds) {
      image(nubeImage, cloud.x, cloud.y-400, cloud.size, cloud.size+130);
      cloud.y += cloud.speed;
      if (cloud.y > width) {
        cloud.y = 0;
        cloud.x = random(height);
      }
    }
  }

  private void movePlayer() {
    if(mousePressed){
    playerX = mouseX-45;
    playerY = mouseY-45;
    }
    image(jugadorImage, playerX, playerY, 100, 100);
  }

  private void moveEnemy() {
    image(enemigoImage, enemyX, enemyY, 150, 170);
    enemyX += enemySpeed * direction;
    if (enemyX <= 0 || enemyX >= width - 150) {
      direction *= -1;
    }
  }
}
