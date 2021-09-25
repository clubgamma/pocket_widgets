# Welcome to the contributing section 🤝

Flutter is a hot topic and it's high time for you to find out that it's emerging technology can improve the Mobile App Development Process and reduce the Cost. 

So let's come together and contribute something awesome to the Flutter community and also show the power and the height of feasibility for creating beautiful things🤩 and if you want to contribute. than you are at the right place, here are the steps how you can contribute to this project!!

### 1. READ CODE OF CONDUCT
   Read the [Code of Conduct](https://github.com/clubgamma/code-of-conduct) before starting contributing.
### 2. Fork the repo
   First of all fork the repo to your own GitHub account by clicking the **Fork** button on top-right corner. Still could not find 🙄,check the below image
   ![fork](https://user-images.githubusercontent.com/57007680/94579238-360b6b00-0296-11eb-8dfd-c8ac8f10aa26.png)
   After a sucessful fork, you'll see a copy of this repo in your own account.

### 3. Clone the repo    
   Now it's time to copy this repo to own laptop/PC. 
   To clone the repo you can write the below command in **Git Bash**
    
   > git clone <REPO_LINK_FROM_YOUR_ACCOUNT>
    
   You can get the repo link from the Download section in the **repo copied in your own account**. Still having trouble🙄,see the below image
    
   ![clone](https://user-images.githubusercontent.com/57007680/94578970-efb60c00-0295-11eb-93cc-301e605927bd.png)
   
 ### 4. Set up remote repo
  - When you cloned your fork, that should have automatically set your fork as the "origin" remote. Use git remote -v to show your current remotes. You should see the URL of your fork (which you copied in step 3) next to the word "origin". 
      If you don't see an "origin" remote, you can add it using below git command
    
    > git remote add origin <REPO_LINK_FROM_YOUR_ACCOUNT>
      
  - Now you have to setup **upstream**. For that write the below git command
      
    > git remote add upstream https://github.com/clubgamma/RiddlesWorld
        
  - Now pull the latest changes from original repo to your local changes by firing thee below command
        
    > git pull upstream master
  
 ### 5. Enough BoilerPlates, It's Flutter time now!!
  - Open cloned Project in your favourite IDE. After that go to the lib->Contributions. In Contributions create a Dart File named **(your_user_name)**. Great, you just created your playground, Now it's time for you to show your Creativity by designing and developing awesome custom Flutter Widgets.
      
     ![contribute_folder](https://user-images.githubusercontent.com/65907580/134782730-af8e999d-9018-4b5a-9f28-1f8b551bb553.PNG)

 - In that playground you can showcase your creativity, here is the [simple file example](https://user-images.githubusercontent.com/65907580/134782908-c055bc15-abcb-4270-b7bf-ba7c978bce16.jpeg)

 **Visual Example:**

 <img src="https://user-images.githubusercontent.com/65907580/134783001-a0ca3829-be01-414a-b7a8-2905dceaf559.jpeg" width="200" height="400" />
 
 After creating the playground, it's time to give reference to your playground from your **HomePage**
 
 Here is how you can reference your playground.
 
 ![home_reference](https://user-images.githubusercontent.com/65907580/134783481-95b78360-2dab-4411-9f15-fac2efaa9357.PNG)
 
 **Hurrah!!..**, You are going preety well, and it's time for you to start designing your Custom Flutter Widget in your playground.

 After you have finished designing a Custom Flutter Widget just copy the code of that particular widget, go to assets->files folder and create a txt file named **(widget_name@your_user_name)** and paste the code over there.
 
  **Visual Example:**
 
 ![code](https://user-images.githubusercontent.com/65907580/134783155-002d3d1b-99b8-4aaa-83a3-35857037c399.PNG)
 
 Now, reference this file in your playgound, to display the code for your custom Flutter Widget

 Still confused?...Here's what you can [refer](https://user-images.githubusercontent.com/65907580/134782908-c055bc15-abcb-4270-b7bf-ba7c978bce16.jpeg)
 
 Well, do not forget to add the **(COPY CODE)** button down there.

   Boom, You have successfully added one Riddle🔥✨
   
   
 ### 6. Now it's time to save the work
      
  - Stage the changes you have made by firing the below command
    > git add -A
  - Commit the changes 
    > git commit -m "Description of changes/your work"
  - Push the changes to your forked repo
    > git push origin master
  
### 7. Let's finish this
  
  - Go to your forked repo on GitHub website and refresh the page, you'll see something like the below image
  ![pr1](https://user-images.githubusercontent.com/57007680/94609340-3fa7c980-02bc-11eb-90dd-269a433b00e0.PNG)
        
  - Click on pull-request and you will be redirected to another page where you will see something like below image
  ![pr2](https://user-images.githubusercontent.com/57007680/94609343-420a2380-02bc-11eb-83f1-c6157417c50d.PNG)
        
  - After that you have to write your GitHub username as the title of your pull-request and describe your work if you want and that's it!!
    Create a pull-request by clicking the button
        
    Mark the pull request as **Ready for Review**
        
    Also add the below 2 lines in the description. It is compulsory for sucessful submission.
        
    - [X] I have read the Code Of Conduct.
        
    - [X] I have followed all the steps of submission properly.
        
    ![pr3](https://user-images.githubusercontent.com/58077762/93779010-1e076c00-fc44-11ea-86f0-7a6d74380624.png)

**Woohoo!! Congratulations on making your open source contribution🎉🎉**                                         
**Wait for some time to get your PR merged by our team**
