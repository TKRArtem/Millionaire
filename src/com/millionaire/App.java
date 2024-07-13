package com.millionaire;

import javafx.application.Application;
import javafx.geometry.Rectangle2D;
import javafx.scene.Scene;

import javafx.scene.image.Image;
import javafx.stage.Screen;
import javafx.stage.Stage;

import java.util.Objects;

public class App extends Application {

    @Override
    public void start(Stage primaryStage) {

        double interfaceScale = 1.3;

        Rectangle2D screenBounds = Screen.getPrimary().getBounds();
        primaryStage.setWidth((int) (screenBounds.getWidth()/1.5));
        primaryStage.setHeight((int) (screenBounds.getHeight()/1.5));
        primaryStage.setX((screenBounds.getWidth() / 2) - (primaryStage.getWidth() / 2));
        primaryStage.setY((screenBounds.getHeight() / 2) - (primaryStage.getHeight() / 2));
        primaryStage.setTitle("Миллионер");
        primaryStage.getIcons().add(new Image(Objects.requireNonNull(App.class.getResourceAsStream("/com/millionaire/logo.png"))));

        Scene scene = new LaunchScreen().getScene(interfaceScale, primaryStage);

        primaryStage.setScene(scene);
        primaryStage.show();

    }

    public static void main(String[] args) {
        launch(args);
    }
}
