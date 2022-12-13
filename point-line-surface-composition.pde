void setup() { 
  size(512, 512);  
  //pixelDensity(2);
  noStroke();
  colorMode(HSB,512,256,256); 
  //fill(0,0,0);
  //text("Click to save.",100,100);
}

void draw() {

    background(0,0,256);

    stroke(480);
    line(256, 0, 256, 512);
    stroke(480);
    line(0, 256, 512, 256);
    //stroke(480);
    //line(128, 128, 384, 128);
    //stroke(480);
    //line(384, 128, 384, 384);
    //stroke(480);
    //line(384, 384, 128, 384);
    //stroke(480);
    //line(128, 384, 128, 128);
    
    

    int n[]={0,0,0,0};
    int n_2[]={0,0,0,0};
    if(mouseX<128 || mouseY<128){
      noStroke();
    }else if(mouseX>=384 || mouseY>=384){
      noStroke();
    }else if(mouseX>=128 || mouseX<385 || mouseY>=128 || mouseY<385){
      
      fill(0,256,0);
      square(mouseX-130, mouseY-130, 256);
      n[0]=(128+(256-mouseX))*(128+(256-mouseY))/*+int((256*256-(128+(256-mouseX))*(128+(256-mouseY)))/3)*/;
      n[1]=(128-(256-mouseX))*(128+(256-mouseY))/*+int((256*256-(128-(256-mouseX))*(128+(256-mouseY)))/3)*/;
      n[2]=(128+(256-mouseX))*(128-(256-mouseY))/*+int((256*256-(128+(256-mouseX))*(128-(256-mouseY)))/3)*/;
      n[3]=(128-(256-mouseX))*(128-(256-mouseY))/*+int((256*256-(128-(256-mouseX))*(128-(256-mouseY)))/3)*/;
    }else{}
    
     
    n[1]=2*n[1];
    n[2]=3*n[2];
    n[3]=4*n[3];
    
    int maxS=0,minS=999999;
    int maxN=0,minN=0;
    
  for(int i=0 ; i<4 ; i++){
    if(minS > n[i]){
      minS=n[i];
      minN=i;
    }
  }
    
    
    n_2[0]=n[0]+n[1]; //12
    n_2[1]=n[1]+n[3]; //23
    n_2[2]=n[3]+n[2]; //34
    n_2[3]=n[0]+n[2]; //41
    
 
  int maxS_2=0,minS_2=999999;
  int maxN_2=0,minN_2=0;
  for(int i=0 ; i<4 ; i++){
    if(maxS_2 < n_2[i]){
      maxS_2=n_2[i];
      maxN_2=i;
    }
  }
  for(int i=0 ; i<4 ; i++){
    if(minS_2 > n_2[i]){
      minS_2=n_2[i];
      minN_2=i;
    }
  }
  int s=maxS_2-minS_2;
  
  if(minN_2==0){
    rect(0, (128-((mouseY-256)/2))-(s/8192)-noise(frameCount/400.0)*64, 512, s/4096);
    //rect(0, (mouseY+128+(512-(mouseY+128))/2)-(s/4096), 512, s/2048);
    if(minN==0){
      ellipse((128-((mouseX-256)/2))-noise(frameCount/200.0)*128, 256, s/4096, s/4096);
    }else if(minN==1){
      ellipse((384+((256-mouseX)/2))+noise(frameCount/200.0)*128, 256, s/4096, s/4096);
    }else if(minN==2){
      ellipse((384+((256-mouseX)/2))-noise(frameCount/200.0)*128, 256, s/4096, s/4096);
    }else if(minN==3){
      ellipse((128-((mouseX-256)/2))+noise(frameCount/200.0)*128, 256, s/4096, s/4096);
    }
    
  }else if(minN_2==1){
    rect((384+((256-mouseX)/2))-(s/8192)+noise(frameCount/400.0)*64, 0, s/4096, 512);
    if(minN==0){
      ellipse(256, (128-((mouseY-256)/2))-noise(frameCount/200.0)*128, s/4096, s/4096);
    }else if(minN==1){
      ellipse(256, (128-((mouseY-256)/2))-noise(frameCount/200.0)*128, s/4096, s/4096);
    }else if(minN==2){
      ellipse(256, (384+((256-mouseY)/2))+noise(frameCount/200.0)*128, s/4096, s/4096);
    }else if(minN==3){
      ellipse(256, (384+((256-mouseY)/2))+noise(frameCount/200.0)*128, s/4096, s/4096);
    }
  }else if(minN_2==2){
    rect(0, (384+((256-mouseY)/2))-(s/8192)+noise(frameCount/400.0)*64, 512, s/4096);
    if(minN==0){
      ellipse((128-((mouseX-256)/2))-noise(frameCount/200.0)*128, 256, s/4096, s/4096);
    }else if(minN==1){
      ellipse((384+((256-mouseX)/2))+noise(frameCount/200.0)*128, 256, s/4096, s/4096);
    }else if(minN==2){
      ellipse((384+((256-mouseX)/2))-noise(frameCount/200.0)*128, 256, s/4096, s/4096);
    }else if(minN==3){
      ellipse((128-((mouseX-256)/2))+noise(frameCount/200.0)*128, 256, s/4096, s/4096);
    }
  }else if(minN_2==3){
    rect((128-((mouseX-256)/2))-(s/8192)-noise(frameCount/400.0)*64, 0, s/4096, 512);
    if(minN==0){
      ellipse(256, (128-((mouseY-256)/2))-noise(frameCount/200.0)*128, s/4096, s/4096);
    }else if(minN==1){
      ellipse(256, (128-((mouseY-256)/2))-noise(frameCount/200.0)*128, s/4096, s/4096);
    }else if(minN==2){
      ellipse(256, (384+((256-mouseY)/2))+noise(frameCount/200.0)*128, s/4096, s/4096);
    }else if(minN==3){
      ellipse(256, (384+((256-mouseY)/2))+noise(frameCount/200.0)*128, s/4096, s/4096);
    }
  }
  
  
  
}





void mousePressed() { //save img
 //fill(0,0,0);
 //text("Click to save.",100,100);
 saveFrame("####.png");
}
