 let score = 
                JSON.parse(localStorage.getItem('score')) || {
                    wins : 0,
                    losses : 0,
                    ties : 0
              };
            ;
            let playerMove =''
         let computerMove =''
         let result =''


           updateScoreElement();
         /*   if (!score){
                score = {
                    wins : 0,
                    losses : 0,
                    ties : 0
                }
            }*/
          
                let isAutoPlaying() = false;
                let intervalId;
                function autoPlay(){
                    if (!isAutoPlaying){

                    intervalId = setInterval(()=> {
                        const playerMove = pickComputerMove();
                        playGame(playerMove);
                    }, 1000);
                    isAutoPlaying = true;
                    }else{
                      clearInterval(intervalId);
                      isAutoPlaying = false;
                    }
                    
                }
          function playGame(playerMoveParam){
            playerMove = playerMoveParam
            computerMove = pickComputerMove();
            if (playerMove === 'rock'){
              if (computerMove === 'rock'){
                result = 'tile';
              }
              else if (computerMove === 'paper'){
                result = 'you lose'
              }
              else if (computerMove === 'scissors'){
                result = 'you win'
              }}
              console.log(playerMove);
             if (playerMove === 'scissors'){
                 if (computerMove === 'rock'){
                    result = 'you lose';
                 }
                 else if (computerMove === 'paper'){
                    result = 'you win'
                 }
                 else if (computerMove === 'scissors'){
                    result = 'tile'
                 }
            }
            else if (playerMove === 'paper'){
                if (computerMove === 'rock'){
                    result = 'you win';
                }
                else if (computerMove === 'paper'){
                    result = 'tile';
                }
                else if (computerMove === 'scissors'){
                    result = 'you lose'
                }
            }
            if (result ==='you win'){
                score.wins += 1;
            }
            else if (result === 'you lose'){
                score.losses += 1;
            }
            else if (result === 'tile'){
                score.ties += 1;
            }
            localStorage.setItem('score', JSON.stringify(score));

            updateScoreElement();

            document.querySelector('.js-result').innerHTML = result;
              console.log(playerMove)
            document.querySelector('.js-moves').innerHTML = `you ${playerMove} . ${computerMove} computer`;
          }
          function updateScoreElement(){
             document.querySelector('.js-score')
                 .innerHTML =   `You
          <img src="${playerMove}-emoji.png"  class="move-icon">
          <img src="${computerMove}-emoji.png" class="move-icon" >
          computer`;
          }

        function pickComputerMove(){
          const randomNumber = Math.random();
          let computerMove = '';
        if (randomNumber >= 0 && randomNumber < 1/3){
           computerMove = 'rock'
        }else if (randomNumber >= 1/3 && randomNumber < 2/3 ){
             computerMove = 'paper';
        }
        else if (randomNumber >= 2/3 && randomNumber < 1){
             computerMove = 'scissors';
        }
        return computerMove;
         }