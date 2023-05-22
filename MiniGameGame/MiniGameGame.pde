private GameModule currentModule;
private GameModule[] moduleCollection ={new Peggle(), };

public static int currentModuleNum;
public void SwitchModule(int i)
{
  if (i >= moduleCollection.length) return;
  if (currentModule != null); //EXIT
  currentModule = moduleCollection[i];
  currentModule.Enter();
  currentModuleNum = i;
}
public void NextModule()
{
  SwitchModule(currentModuleNum + 1);
}

void setup()
{
  size(640, 480);
  for (int i = 0; i < moduleCollection.length; i++)
  {
    moduleCollection[i].Setup();
  }
  SwitchModule(0);
}


boolean mouseIsPressed = false;
void draw()
{
  if (currentModule == null) return;
  currentModule.Draw();

  if (currentModule.isDone)
  {
    NextModule();
  }


  if (mousePressed == true)
    currentModule.MouseInput(mouseX, mouseY, MouseInputFlags.pressedDown);

  else if (mousePressed == false && mouseIsPressed == true)
    currentModule.MouseInput(mouseX, mouseY, MouseInputFlags.released);

  else
    currentModule.MouseInput(mouseX, mouseY, MouseInputFlags.none);

  mouseIsPressed = mousePressed;
}
