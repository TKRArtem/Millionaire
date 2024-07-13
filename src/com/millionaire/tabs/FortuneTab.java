package com.millionaire.tabs;

import com.millionaire.Data;
import javafx.collections.FXCollections;
import javafx.geometry.*;
import javafx.scene.control.*;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.ColumnConstraints;
import javafx.scene.layout.GridPane;
import javafx.scene.text.Font;
import javafx.stage.Popup;

import java.util.ArrayList;
import java.util.List;

public class FortuneTab {
    public Tab getTab(double interfaceScale, Data data, TabPane tabPane, ListView<String> streetsList, ListView<String> streetOwner, ListView<String> streetBuildings, CheckBox pledgeCheckBox, Label[] pledges) {
        Tab tab = new Tab();

        tab.setText("Фортуна");
        tab.setClosable(false);
        tab.setStyle("-fx-font-size: " + (interfaceScale * 12) + "px;");

        ScrollPane scrollPane = new ScrollPane(getContent(interfaceScale, data, tabPane, streetsList, streetOwner, streetBuildings, pledgeCheckBox, pledges));
        scrollPane.setFitToWidth(true);

        tab.setContent(scrollPane);

        return tab;
    }

    private BorderPane getContent(double interfaceScale, Data data, TabPane tabPane, ListView<String> streetsList, ListView<String> streetOwner, ListView<String> streetBuildings, CheckBox pledgeCheckBox, Label[] pledges) {
        BorderPane tabContent = new BorderPane();

        GridPane gridPane = new GridPane();
        gridPane.setHgap(5 * interfaceScale);
        gridPane.setVgap(5 * interfaceScale);
        gridPane.setPadding(new javafx.geometry.Insets(5 * interfaceScale));

        ColumnConstraints column1 = new ColumnConstraints();
        column1.setHgrow(javafx.scene.layout.Priority.ALWAYS);
        ColumnConstraints column2 = new ColumnConstraints();
        column2.setHgrow(javafx.scene.layout.Priority.ALWAYS);
        gridPane.getColumnConstraints().addAll(column1, column2);

        Label title = new Label("Фортуна:");
        title.setFont(new Font(16 * interfaceScale));
        gridPane.add(title, 0, 0);

        ListView<BorderPane> fortunes = new ListView<>();

        Button plus = new Button("\ue710");
        plus.setStyle("-fx-font-size: "+(11 * interfaceScale)+"px;");
        plus.getStyleClass().add("addButton");

        TextField fortune = new TextField();
        fortune.setFont(new Font(12 * interfaceScale));
        GridPane.setHgrow(fortune, javafx.scene.layout.Priority.ALWAYS);
        fortune.setVisible(false);

        Popup suggestionsPopup = new Popup();
        ListView<String> suggestions = new ListView<>();
        suggestionsPopup.getContent().add(suggestions);
        suggestionsPopup.setAutoHide(true);

        for (String fort: data.fortunes) {
            BorderPane cell = new BorderPane();
            Label label = new Label(fort);
            label.setFont(new Font(12 * interfaceScale));
            cell.setLeft(label);
            Button button = new Button("\ue738");
            button.setStyle("-fx-font-size: " + (11 * interfaceScale) + "px;");
            button.getStyleClass().add("removeButton");
            button.setOnAction(event1 -> {
                int index = fortunes.getItems().indexOf(cell);
                if (index != -1) {
                    fortunes.getItems().remove(index);
                }
                data.removeFortune(fort);
                tabPane.getTabs().get(0).setContent(new MainTab().getContent(interfaceScale, tabPane, streetsList, streetOwner, streetBuildings, pledgeCheckBox, pledges, data));
            });
            cell.setRight(button);
            fortunes.getItems().add(cell);
        }

        fortune.textProperty().addListener((observable, oldValue, newValue) -> {
            if (!newValue.isEmpty()) {
                List<String> completions = getCompletionsFortune(newValue);
                if (!completions.isEmpty()) {
                    suggestions.setMinWidth(fortune.getWidth());
                    suggestions.setItems(FXCollections.observableArrayList(completions));
                    suggestions.setStyle("-fx-font-size: "+(11 * interfaceScale)+"px; -fx-border-width: 2px; -fx-background-color: #181818;");
                    Point2D point = fortune.localToScene(0, fortune.getHeight());
                    suggestionsPopup.show(fortune, point.getX() + fortune.getScene().getX() + fortune.getScene().getWindow().getX(),
                            point.getY() + fortune.getScene().getY() + fortune.getScene().getWindow().getY());
                } else {
                    suggestionsPopup.hide();
                }
            } else {
                suggestionsPopup.hide();
            }
        });

        suggestions.setOnMouseClicked((MouseEvent event) -> {
            if (event.getClickCount() == 1) {
                String selectedWord = suggestions.getSelectionModel().getSelectedItem();
                if (!data.isFortuneAdded(selectedWord)) {
                    data.addFortune(selectedWord);
                    BorderPane cell = new BorderPane();
                    Label label = new Label(selectedWord);
                    label.setFont(new Font(12 * interfaceScale));
                    cell.setLeft(label);
                    Button button = new Button("\ue738");
                    button.setStyle("-fx-font-size: " + (11 * interfaceScale) + "px;");
                    button.getStyleClass().add("removeButton");
                    button.setOnAction(event1 -> {
                        int index = fortunes.getItems().indexOf(cell);
                        if (index != -1) {
                            fortunes.getItems().remove(index);
                        }
                        data.removeFortune(selectedWord);
                        tabPane.getTabs().get(0).setContent(new MainTab().getContent(interfaceScale, tabPane, streetsList, streetOwner, streetBuildings, pledgeCheckBox, pledges, data));
                    });
                    cell.setRight(button);
                    fortunes.getItems().add(cell);
                    tabPane.getTabs().get(0).setContent(new MainTab().getContent(interfaceScale, tabPane, streetsList, streetOwner, streetBuildings, pledgeCheckBox, pledges, data));
                }
                fortune.setVisible(false);
                fortune.setText("");
            }
        });

        plus.setOnAction(event -> {
            if (!fortune.isVisible()) {
                fortune.setVisible(true);
            }
        });

        GridPane.setHalignment(plus, HPos.RIGHT);

        gridPane.add(fortune, 1, 0);
        gridPane.add(plus, 2, 0);
        gridPane.add(fortunes, 0, 1, 3, 1);

        tabContent.setCenter(gridPane);

        return tabContent;
    }

    public static List<String> getCompletionsFortune(String input) {
        List<String> completions = new ArrayList<>();

        for (String word : new Data().getAvailableFortunes()) {
            if (word.toLowerCase().contains(input.toLowerCase())) {
                completions.add(word);
            }
        }

        return completions;
    }
}
