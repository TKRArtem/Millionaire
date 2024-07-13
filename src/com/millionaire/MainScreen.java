package com.millionaire;

import com.millionaire.tabs.*;
import javafx.scene.Scene;
import javafx.scene.control.TabPane;
import javafx.stage.Stage;

import java.util.Objects;

public class MainScreen {
    private TabPane tabPane = new TabPane();

    public Scene getScene(double interfaceScale, Data data, Stage primaryStage) {
        tabPane = new TabPane();

        EditStreetTab editStreetTab = new EditStreetTab();
        tabPane.getTabs().add(editStreetTab.getTab(tabPane, interfaceScale, data));
        tabPane.getTabs().add(0, new MainTab().getTab(tabPane, interfaceScale, editStreetTab.getStreetsList(), editStreetTab.getStreetOwner(), editStreetTab.getStreetBuildings(), editStreetTab.getPledgeCheckBox(), editStreetTab.getPledges(), data));
        tabPane.getTabs().add(new FortuneTab().getTab(interfaceScale, data, tabPane, editStreetTab.getStreetsList(), editStreetTab.getStreetOwner(), editStreetTab.getStreetBuildings(), editStreetTab.getPledgeCheckBox(), editStreetTab.getPledges()));
        tabPane.getTabs().add(new StocksTab().getTab(interfaceScale, data, tabPane, editStreetTab.getStreetsList(), editStreetTab.getStreetOwner(), editStreetTab.getStreetBuildings(), editStreetTab.getPledgeCheckBox(), editStreetTab.getPledges()));
        tabPane.getTabs().add(new AdditionalTab().getTab(interfaceScale, data, primaryStage));

        tabPane.getSelectionModel().select(0);

        tabPane.setTabMinHeight(20 * interfaceScale);
        tabPane.setTabMaxHeight(20 * interfaceScale);

        Scene scene = new Scene(tabPane, 300, 200);
        scene.getStylesheets().add(Objects.requireNonNull(getClass().getResource("/com/millionaire/style.css")).toExternalForm());

        return scene;
    }

}
