package controllers;

import java.io.BufferedReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.logging.Level;
import java.util.logging.Logger;


public class LoadFile {
    
    public StringBuilder load(String path) {
        StringBuilder content = new StringBuilder();
        
        try(BufferedReader readFile = Files.newBufferedReader(Path.of(path))){

            String line;
            while((line = readFile.readLine()) != null){
                content.append(line).append("\n");
            }
        }catch(IOException e){
            Logger.getLogger(this.getClass().getName()).log(Level.INFO, "Erro na leitura do ficheiro!\n===>  {0}", e.getMessage());
        }
        return content;
    }
}
