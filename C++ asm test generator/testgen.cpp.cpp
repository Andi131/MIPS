#include <iostream>
#include <time.h>
#include <fstream>
using namespace std;

class R_type{
    public:
    int op[6]={0,0,0,0,0,0};  //R-type operation

    int functions_matrix[9][6]={{1,0,0,1,0,0}, {1,0,0,1,0,1}, {1,0,0,0,1,1}, {1,0,0,0,0,0}, //AND //OR //NOR //ADD
                                {1,0,0,0,1,0}, {1,0,1,0,1,0}, {1,0,1,0,1,1}, {1,1,0,0,0,1}, {1,1,0,0,1,1}}; //SUB  //SLT  //MULL  //XOR  //SHT_L

    int rd, rs, rt;  //addresses for my registers 
    int vrd[5]={0,0,0,0,0}, vrt[5]={0,0,0,0,0}, vrs[5]={0,0,0,0,0};
    int shmt[5]={0,0,0,0,0};

    R_type(){

        int i=0;  //auxiliar variables to calculate 32 bit instruction
        rd=rand() % 32;  //randomizing a number between 0->32 to get an address for my destination register
    
        cout<<"Register generator:"<<endl;
        cout<<"RD="<<rd<<" ";

        int tmp_rd;  tmp_rd=rd;   // saving variable into an temporary variable to use it later at asm.txt file

        while(rd!=0){   // conversion to binary
	    vrd[i]=rd%2;      // binary value after division
        rd=rd/2;  
        i++;
	    }
       
        for(i=4; i>=0; i--){  //reading value in binary
            cout<<vrd[i]<<" ";
         }

        cout<<"\n";
        i=0;  //auxiliar variables to calculate 32 bit instruction
        rs=rand() % 32;  //randomizing a number between 0->32 to get an address for my destination register
        cout<<"RS="<<rs<<" ";

        int tmp_rs;  tmp_rs=rs;   // saving variable into an temporary variable to use it later at asm.txt file

        while(rs!=0){   // conversion to binary
	    vrs[i]=rs%2;      // binary value after division
        rs=rs/2;  
        i++;
	    }
       
        for(i=4; i>=0; i--){  //reading value in binary
            cout<<vrs[i]<<" ";
        }

        cout<<endl;

        i=0;  //auxiliar variables to calculate 32 bit instruction
        rt=rand() % 32;  //randomizing a number between 0->32 to get an address for my destination register
        cout<<"RT="<<rt<<" ";

        int tmp_rt;  tmp_rt=rt;   // saving variable into an temporary variable to use it later at asm.txt file

        while(rt!=0){   // conversion to binary
	        vrt[i]=rt%2;      // binary value after division
            rt=rt/2;  
            i++;
	    }
       
        for(i=4; i>=0; i--){  //reading value in binary
            cout<<vrt[i]<<" ";
        }

        cout<<endl;
        int instruction[31];
        int funct;
        funct=rand() % 8;  //randomizing a number between 0->8 to pick an function
        cout<<"Functia NR="<<funct<<" ";
        cout<<endl;

        cout<<"Functia=";
        for(i=0; i<6; i++){
            cout<<functions_matrix[funct][i]<<" ";  //display function
        }

        for(i=0; i<6; i++){
            instruction[i+26]=functions_matrix[funct][i];  //writing function and operation in instruction vector
            instruction[i]=op[i];
        }

        int j=0;
        for(i=0; i<=4; i++)
        {
            instruction[i+6]=vrs[4-j];      //writing register addresses in instruction vector
            instruction[i+11]=vrt[4-j];
            instruction[i+16]=vrd[4-j];
            instruction[i+21]=shmt[4-j];   //shamt value also is written here 
            j++;
        }
        cout<<endl;
        cout<<"Instructiune=";
        for(i=0; i<32; i++){
            cout<<instruction[i]<<" ";  //display vector
        }
        
        ofstream file;
        file.open("instructions.txt", ofstream::app);  // open file and continue writing in that
        for(i=1; i<=32; i++){
            file<<instruction[i-1];
            if(i%8==0){
                file<<endl;
            }
        }

        file.close();

        //funct->numarul functiei 0->AND 1->OR 2->NOR 3->ADD 4->SUB  5->SLT  6->MULL  7->XOR  8->SHT_L
        ofstream fila;
        fila.open("asm.txt", ofstream::app);  //asembly file creation

            switch(funct){
                case 0:
                    fila<<"AND Rd("<<tmp_rd<<")=Rs("<<tmp_rs<<") AND Rt("<<tmp_rt<<");"<<endl;
                break;

                case 1:
                    fila<<"OR Rd("<<tmp_rd<<")=Rs("<<tmp_rs<<") OR Rt("<<tmp_rt<<");"<<endl;
                break;

                case 2:
                    fila<<"NOR Rd("<<tmp_rd<<")=Rs("<<tmp_rs<<") NOR Rt("<<tmp_rt<<");"<<endl;
                break;

                case 3:
                    fila<<"ADD Rd("<<tmp_rd<<")=Rs("<<tmp_rs<<") ADD Rt("<<tmp_rt<<");"<<endl;
                break;

                case 4:
                    fila<<"SUB Rd("<<tmp_rd<<")=Rs("<<tmp_rs<<") SUB Rt("<<tmp_rt<<");"<<endl;
                break;

                case 5:
                    fila<<"SLT Rd("<<tmp_rd<<")=Rs("<<tmp_rs<<") SLT Rt("<<tmp_rt<<");"<<endl;
                break;

                case 6:
                    fila<<"MULL Rd("<<tmp_rd<<")=Rs("<<tmp_rs<<") MULL Rt("<<tmp_rt<<");"<<endl;
                break;

                case 7:
                    fila<<"XOR Rd("<<tmp_rd<<")=Rs("<<tmp_rs<<") XOR Rt("<<tmp_rt<<");"<<endl;
                break;

                case 8:
                    fila<<"Sht_L Rd("<<tmp_rd<<")=Rs("<<tmp_rs<<") SHT_L Rt("<<tmp_rt<<");"<<endl;
                break;
                
                default:
                    fila<<"Nothing"<<endl;
            }
            fila.close();

    }
   
 R_type(int rt, int rd, int rs, int funct){

        int i=0;  //auxiliar variables to calculate 32 bit instruction
    
        cout<<"Register generator:"<<endl;
        cout<<"RD="<<rd<<" ";

        int tmp_rd;  tmp_rd=rd;   // saving variable into an temporary variable to use it later at asm.txt file

        while(rd!=0){   // conversion to binary
	    vrd[i]=rd%2;      // binary value after division
        rd=rd/2;  
        i++;
	    }
       
        for(i=4; i>=0; i--){  //reading value in binary
            cout<<vrd[i]<<" ";
         }

        cout<<"\n";
        i=0;  //auxiliar variables to calculate 32 bit instruction
        cout<<"RS="<<rs<<" ";

        int tmp_rs;  tmp_rs=rs;   // saving variable into an temporary variable to use it later at asm.txt file

        while(rs!=0){   // conversion to binary
	    vrs[i]=rs%2;      // binary value after division
        rs=rs/2;  
        i++;
	    }
       
        for(i=4; i>=0; i--){  //reading value in binary
            cout<<vrs[i]<<" ";
        }

        cout<<endl;

        i=0;  //auxiliar variables to calculate 32 bit instruction
        cout<<"RT="<<rt<<" ";

        int tmp_rt;  tmp_rt=rt;   // saving variable into an temporary variable to use it later at asm.txt file

        while(rt!=0){   // conversion to binary
	        vrt[i]=rt%2;      // binary value after division
            rt=rt/2;  
            i++;
	    }
       
        for(i=4; i>=0; i--){  //reading value in binary
            cout<<vrt[i]<<" ";
        }

        cout<<endl;
        int instruction[31];
        cout<<"Functia NR="<<funct<<" ";
        cout<<endl;

        cout<<"Functia=";
        for(i=0; i<6; i++){
            cout<<functions_matrix[funct][i]<<" ";  //display function
        }

        for(i=0; i<6; i++){
            instruction[i+26]=functions_matrix[funct][i];  //writing function and operation in instruction vector
            instruction[i]=op[i];
        }

        int j=0;
        for(i=0; i<=4; i++)
        {
            instruction[i+6]=vrs[4-j];      //writing register addresses in instruction vector
            instruction[i+11]=vrt[4-j];
            instruction[i+16]=vrd[4-j];
            instruction[i+21]=shmt[4-j];   //shamt value also is written here 
            j++;
        }
        cout<<endl;
        cout<<"Instructiune=";
        for(i=0; i<32; i++){
            cout<<instruction[i]<<" ";  //display vector
        }
        
        ofstream file;
        file.open("instructions.txt", ofstream::app);  // open file and continue writing in that
        for(i=1; i<=32; i++){
            file<<instruction[i-1];
            if(i%8==0){
                file<<endl;
            }
        }

        file.close();

        //funct->numarul functiei 0->AND 1->OR 2->NOR 3->ADD 4->SUB  5->SLT  6->MULL  7->XOR  8->SHT_L
        ofstream fila;
        fila.open("asm.txt", ofstream::app);  //asembly file creation

            switch(funct){
                case 0:
                    fila<<"AND Rd("<<tmp_rd<<")=Rs("<<tmp_rs<<") AND Rt("<<tmp_rt<<");"<<endl;
                break;

                case 1:
                    fila<<"OR Rd("<<tmp_rd<<")=Rs("<<tmp_rs<<") OR Rt("<<tmp_rt<<");"<<endl;
                break;

                case 2:
                    fila<<"NOR Rd("<<tmp_rd<<")=Rs("<<tmp_rs<<") NOR Rt("<<tmp_rt<<");"<<endl;
                break;

                case 3:
                    fila<<"ADD Rd("<<tmp_rd<<")=Rs("<<tmp_rs<<") ADD Rt("<<tmp_rt<<");"<<endl;
                break;

                case 4:
                    fila<<"SUB Rd("<<tmp_rd<<")=Rs("<<tmp_rs<<") SUB Rt("<<tmp_rt<<");"<<endl;
                break;

                case 5:
                    fila<<"SLT Rd("<<tmp_rd<<")=Rs("<<tmp_rs<<") SLT Rt("<<tmp_rt<<");"<<endl;
                break;

                case 6:
                    fila<<"MULL Rd("<<tmp_rd<<")=Rs("<<tmp_rs<<") MULL Rt("<<tmp_rt<<");"<<endl;
                break;

                case 7:
                    fila<<"XOR Rd("<<tmp_rd<<")=Rs("<<tmp_rs<<") XOR Rt("<<tmp_rt<<");"<<endl;
                break;

                case 8:
                    fila<<"Sht_L Rd("<<tmp_rd<<")=Rs("<<tmp_rs<<") SHT_L Rt("<<tmp_rt<<");"<<endl;
                break;
                
                default:
                    fila<<"Nothing"<<endl;
            }
            fila.close();

    }

       

};

class I_type{
    public:
    int op[9][6]={{1,0,0,0,1,1}, {1,0,1,0,1,1}, {0,0,1,0,0,0}, {0,0,0,1,0,0}, {0,0,0,0,0,1}, {0,0,0,0,1,1}, //LW  //SW  //ADDI  //BEQ  //SUBI  //ANDI
                  {0,0,0,1,1,1}, {0,0,1,1,1,1}, {0,1,1,1,1,1}};  //ORI  //MULLI  //XORI

    int vrt[5]={0,0,0,0,0}, vrs[5]={0,0,0,0,0}, imm[16]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    int rs, rt, im;  //addresses for my registers and the immediate value

    I_type(){      
        int i=0;  //auxiliar variables to calculate 32 bit instruction
        rt=rand() % 32;  //randomizing a number between 0->32 to get an address for my destination register
    
        cout<<"Register generator:"<<endl;
        cout<<"Rt="<<rt<<" ";

        int tmp_rt;  tmp_rt=rt;   // saving reg address an temporary variable to use it later at asm.txt file

        while(rt!=0){   // conversion to binary
	    vrt[i]=rt%2;      // binary value after division
        rt=rt/2;  
        i++;
	    }

        for(i=4; i>=0; i--){  //reading value in binary
            cout<<vrt[i]<<" ";
        }
        cout<<endl;

        i=0;
        rs=rand() % 32;
        int tmp_rs;  tmp_rs=rs;   // saving reg address into an temporary variable to use it later at asm.txt file
        cout<<"Rs="<<rs<<" ";
        while(rs!=0){   // conversion to binary
	    vrs[i]=rs%2;      // binary value after division
        rs=rs/2;  
        i++;
	    }
       
        for(i=4; i>=0; i--){  //reading value in binary
            cout<<vrs[i]<<" ";
        }
        cout<<endl;

        i=0;
        im=rand() % 65534;
        int tmp_im; tmp_im=im;
        cout<<"Imm="<<im<<" ";
        while(im!=0){   // conversion to binary
	    imm[i]=im%2;      // binary value after division
        im=im/2;  
        i++;
	    }

        for(i=15; i>=0; i--){  //reading value in binary
            cout<<imm[i]<<" ";
        }
        cout<<endl;

        int instruction[31];
        int operation;
        operation=rand() % 8;  //randomizing a number between 0->8 to pick an operation
        cout<<"Operatia NR="<<operation<<" ";
        cout<<endl;

        cout<<"Operatia=";
        for(i=0; i<6; i++){
            cout<<op[operation][i]<<" ";  //display function
        }


        for(i=0; i<6; i++){
            instruction[i]=op[operation][i];
        }

        int j=0;
        for(i=0; i<=4; i++)
        {
            instruction[i+6]=vrs[4-j];      //writing register addresses in instruction vector
            instruction[i+11]=vrt[4-j];
            j++;
        }

        j=0;
        for(i=0; i<=15; i++){
            instruction[i+16]=imm[15-j];
            j++;
        }
        cout<<endl;
        
        cout<<"Instruction= ";
        for(i=0; i<32; i++){
            cout<<instruction[i]<<" ";
        }

        ofstream file;
        file.open("instructions.txt", ofstream::app);  // open file and continue writing in that
        for(i=1; i<=32; i++){
            file<<instruction[i-1];
            if(i%8==0){
                file<<endl;
            }
        }

        file.close();

        //funct->numarul functiei 0->AND 1->OR 2->NOR 3->ADD 4->SUB  5->SLT  6->MULL  7->XOR  8->SHT_L
        ofstream fila;
        fila.open("asm.txt", ofstream::app);  //asembly file creation

            switch(operation){  //LW  //SW  //ADDI  //BEQ  //SUBI  //ANDI   //ORI  //MULLI  //XORI
                case 0:
                    fila<<"LW Rt("<<tmp_rt<<")<-Rs("<<tmp_rs<<") + imm("<<tmp_im<<");"<<endl;
                break;

                case 1:
                    fila<<"SW [Rt]("<<tmp_rt<<")<-Rs("<<tmp_rs<<") + imm("<<tmp_im<<");"<<endl;
                break;

                case 2:
                    fila<<"ADDI Rt("<<tmp_rt<<")=Rs("<<tmp_rs<<") + imm("<<tmp_im<<");"<<endl;
                break;

                case 3:
                    fila<<"BEQ [imm]("<<tmp_im<<")<-Rs("<<tmp_rs<<") - Rt("<<tmp_rt<<");"<<endl;
                break;

                case 4:
                    fila<<"SUBI Rt("<<tmp_rt<<")=Rs("<<tmp_rs<<") SUBI imm("<<tmp_im<<");"<<endl;
                break;

                case 5:
                    fila<<"ANDI Rt("<<tmp_rt<<")=Rs("<<tmp_rs<<") ANDI imm("<<tmp_im<<");"<<endl;
                break;

                case 6:
                    fila<<"ORI Rt("<<tmp_rt<<")=Rs("<<tmp_rs<<") ORI imm("<<tmp_im<<");"<<endl;
                break;

                case 7:
                    fila<<"MULLI Rt("<<tmp_rt<<")=Rs("<<tmp_rs<<") MULLI imm("<<tmp_im<<");"<<endl;
                break;

                case 8:
                    fila<<"XORI Rt("<<tmp_rt<<")=Rs("<<tmp_rs<<") XORI imm("<<tmp_im<<");"<<endl;
                break;
                
                default:
                    fila<<"Nothing"<<endl;
            }
            fila.close();
    }

    I_type(int operation, int rt, int rs, int im){        //constructor de forma: tipul operatiei, registrii cu val<32, val imm<65535
        int i=0;  //auxiliar variables to calculate 32 bit instruction
    
        if((rt>32)||(rs>32)||(operation>8)||(im>65535))
        {
            exit(1);
        }
        cout<<"Register generator:"<<endl;
        cout<<"Rt="<<rt<<" ";

        int tmp_rt;  tmp_rt=rt;   // saving reg address an temporary variable to use it later at asm.txt file

        while(rt!=0){   // conversion to binary
	        vrt[i]=rt%2;      // binary value after division
            rt=rt/2;  
            i++;
	    }

        for(i=4; i>=0; i--){  //reading value in binary
            cout<<vrt[i]<<" ";
        }
        cout<<endl;

        i=0;
        int tmp_rs;  tmp_rs=rs;   // saving reg address into an temporary variable to use it later at asm.txt file
        cout<<"Rs="<<rs<<" ";
        while(rs!=0){   // conversion to binary
	        vrs[i]=rs%2;      // binary value after division
            rs=rs/2;  
            i++;
	    }
       
        for(i=4; i>=0; i--){  //reading value in binary
            cout<<vrs[i]<<" ";
        }
        cout<<endl;

        i=0;
        int tmp_im; tmp_im=im;
        cout<<"Imm="<<im<<" ";
        while(im!=0){   // conversion to binary
	        imm[i]=im%2;      // binary value after division
            im=im/2;  
            i++;
	    }

        for(i=15; i>=0; i--){  //reading value in binary
            cout<<imm[i]<<" ";
        }
        cout<<endl;

        int instruction[31];
      
        cout<<"Operatia NR="<<operation<<" ";
        cout<<endl;

        cout<<"Operatia=";
        for(i=0; i<6; i++){
            cout<<op[operation][i]<<" ";  //display function
        }


        for(i=0; i<6; i++){
            instruction[i]=op[operation][i];
        }

        int j=0;
        for(i=0; i<=4; i++)
        {
            instruction[i+6]=vrs[4-j];      //writing register addresses in instruction vector
            instruction[i+11]=vrt[4-j];
            j++;
        }

        j=0;
        for(i=0; i<=15; i++){
            instruction[i+16]=imm[15-j];
            j++;
        }
        cout<<endl;
        
        cout<<"Instruction= ";
        for(i=0; i<32; i++){
            cout<<instruction[i]<<" ";
        }

        ofstream file;
        file.open("instructions.txt", ofstream::app);  // open file and continue writing in that
        for(i=1; i<=32; i++){
            file<<instruction[i-1];
            if(i%8==0){
                file<<endl;
            }
        }

        file.close();

        //funct->numarul operatia 0->LW 1->SW 2->ADDI 3->BEQ 4->SUBI  5->ANDI  6->ORI  7->MULLI  8->XORI
        ofstream fila;
        fila.open("asm.txt", ofstream::app);  //asembly file creation

            switch(operation){  //LW  //SW  //ADDI  //BEQ  //SUBI  //ANDI   //ORI  //MULLI  //XORI
                case 0:
                    fila<<"LW Rt("<<tmp_rt<<")<-Rs("<<tmp_rs<<") + imm("<<tmp_im<<");"<<endl;
                break;

                case 1:
                    fila<<"SW [Rt]("<<tmp_rt<<")<-Rs("<<tmp_rs<<") + imm("<<tmp_im<<");"<<endl;
                break;

                case 2:
                    fila<<"ADDI Rt("<<tmp_rt<<")=Rs("<<tmp_rs<<") + imm("<<tmp_im<<");"<<endl;
                break;

                case 3:
                    fila<<"BEQ [imm]("<<tmp_im<<")<-Rs("<<tmp_rs<<") - Rt("<<tmp_rt<<");"<<endl;
                break;

                case 4:
                    fila<<"SUBI Rt("<<tmp_rt<<")=Rs("<<tmp_rs<<") SUBI imm("<<tmp_im<<");"<<endl;
                break;

                case 5:
                    fila<<"ANDI Rt("<<tmp_rt<<")=Rs("<<tmp_rs<<") ANDI imm("<<tmp_im<<");"<<endl;
                break;

                case 6:
                    fila<<"ORI Rt("<<tmp_rt<<")=Rs("<<tmp_rs<<") ORI imm("<<tmp_im<<");"<<endl;
                break;

                case 7:
                    fila<<"MULLI Rt("<<tmp_rt<<")=Rs("<<tmp_rs<<") MULLI imm("<<tmp_im<<");"<<endl;
                break;

                case 8:
                    fila<<"XORI Rt("<<tmp_rt<<")=Rs("<<tmp_rs<<") XORI imm("<<tmp_im<<");"<<endl;
                break;
                
                default:
                    fila<<"Nothing"<<endl;
            }
            fila.close();
    }
    

};

class J_type{
    public:
    int op[6]={0,0,0,0,1,0};
    int imm[26]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    int instr[31];
    J_type();
    J_type(int im){
        int i=0;
        int tmp_im; tmp_im=im;
            while(im!=0){   // conversion to binary
	        imm[i]=im%2;      // binary value after division
            im=im/2;  
            i++;
	        }

            for(i=0;i<26;i++)
            {
                cout<<imm[i]<<" ";
            }
        cout<<endl;
        for(i=0; i<6; i++)
        {
            instr[i]=op[i];
        }

        int j=25;

        for(i=6; i<32; i++){
            instr[i]=imm[j];
            j--;

        }

        cout<<"Instructiunea: ";
        for(i=0; i<32; i++){
            cout<<instr[i];
        }

        ofstream file;
        file.open("instructions.txt", ofstream::app);  // open file and continue writing in that
        for(i=1; i<=32; i++){
            file<<instr[i-1];
            if(i%8==0){
                file<<endl;
            }
        }

         ofstream fila;
        fila.open("asm.txt", ofstream::app);  //asembly file creation
            fila<<"J  address("<<tmp_im<<");"<<endl;
        fila.close();
    };

};

int main(){
    
      //taking time as benchmark for randomization
    int i;  //index pt generare instructiuni in bucla
    //constrcutorii parametrizabili sunt de forma: operatie, reg dest(32>rt>=0), reg sursa(32>rs>=0), valoare imediata(65500>=imm>=0)
    
    /*
//Test1                      //Memory accesses
    for(i=1; i<32; i++){
        val=rand() % 200;        //random value to load registers
        I_type(2, i, 0, val);   // load registers from 0<->31 with addi op and random vall between 0 and 200
    }
    
    for(i=0; i<3; i++){
        R_type();
    }
                                        // op rt rs im
    I_type(1, 1, 0, 4);  //sw
    I_type(1, 2, 0, 8);  //sw
    I_type(1, 3, 0, 12);  //sw

    I_type(0, 3, 0, 4);  //lw
    I_type(0, 4, 0, 8);  //lw
    I_type(0, 5, 0, 12);  //lw
    */
    
             //funct->numarul operatia 0->LW 1->SW 2->ADDI 3->BEQ 4->SUBI  5->ANDI  6->ORI  7->MULLI  8->XORI
                //I_type(op, rt, rs, im)

                //funct->numarul functiei 0->AND 1->OR 2->NOR 3->ADD 4->SUB  5->SLT  6->MULL  7->XOR  8->SHT_L
                //R_type(rt, rd, rs, funct)
  
  /* //Test 2             //Fibonacci numbers
   I_type(2, 6, 0, 10); //ADDI
   I_type(1, 1, 5, 0);  //SW
   I_type(2, 2, 1, 1);  //ADDi
   I_type(1, 2, 0, 4);  //SW
   I_type(2, 5, 0, 4);  //ADDI
   R_type(1, 1, 2, 3);  //ADD
   I_type(2, 8, 5, 4);  //ADDI
   I_type(2, 5, 8, 0);  //ADDI
   I_type(1, 1, 5, 0);  //SW
   I_type(2, 1, 2, 0);  //ADDI
   I_type(0, 2, 5, 0);  //LW
   R_type(2, 9, 6, 5);  //SLT
   I_type(3, 9, 0, 20); //BEQ

    for(i=0; i<8; i++)
    {
        I_type(0, 10, 11, 0+i*4);
    }
    */

                //funct->numarul operatia 0->LW 1->SW 2->ADDI 3->BEQ 4->SUBI  5->ANDI  6->ORI  7->MULLI  8->XORI
                //I_type(op, rt, rs, im)

                //funct->numarul functiei 0->AND 1->OR 2->NOR 3->ADD 4->SUB  5->SLT  6->MULL  7->XOR  8->SHT_L
                //R_type(rt, rd, rs, funct)

   //test3          //Finding even or odd numbers
    int val;
    srand ((unsigned)time(NULL));

    I_type(2, 1, 0, 1); //mask to reg 1
    I_type(2, 2, 0, 1); //reg 2 load 1

   //start
   for(i=0;i<3;i++)
   {
    val=rand() % 500;
    I_type(2, i+10, 0, val);  //rand val
   }

      for(i=0;i<3;i++)
   {
    I_type(1, i+10, 0, i*4);  //addr to store
   }

   //start
   I_type(0, 4, 6, 0); //LW
   I_type(2, 7, 6, 4); //next addr
   I_type(2, 6, 7, 0); //next addr
   R_type(4, 5, 1, 0); //AND
   I_type(3, 5, 2, 56);  //jmp numar impar
   I_type(3, 5, 3, 68);  //jmp numar par

   //odd
   I_type(2, 20, 19, 0); //ADDI reg for odd number
   R_type(4, 20, 0, 0); //AND for clear
   J_type(32);          //J back

   //even
   I_type(2, 30, 19, 0);  //ADDi reg for even number
   R_type(4, 30, 0, 0);   //AND for clear
   J_type(32);            //J back
    

   return 0;
}