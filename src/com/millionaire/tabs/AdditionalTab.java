package com.millionaire.tabs;

import com.millionaire.Data;
import com.millionaire.MainScreen;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.scene.text.Font;
import javafx.stage.FileChooser;
import javafx.stage.Modality;
import javafx.stage.Stage;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import org.json.JSONArray;
import org.json.JSONObject;

public class AdditionalTab {

    public Tab getTab(double interfaceScale, Data data, Stage primaryStage) {
        Tab tab = new Tab();

        tab.setText("Дополнительно");
        tab.setClosable(false);
        tab.setStyle("-fx-font-size: " + (interfaceScale * 12) + "px;");

        ScrollPane scrollPane = new ScrollPane(getContent(interfaceScale, data, primaryStage));
        scrollPane.setFitToWidth(true);

        tab.setContent(scrollPane);

        return tab;
    }

    private BorderPane getContent(double interfaceScale, Data data, Stage primaryStage) {
        BorderPane tabContent = new BorderPane();

        GridPane gridPane = new GridPane();
        gridPane.setHgap(5 * interfaceScale);
        gridPane.setVgap(5 * interfaceScale);
        gridPane.setPadding(new javafx.geometry.Insets(5 * interfaceScale));

        Label title = new Label("Импорт:");
        title.setFont(new Font(16 * interfaceScale));
        gridPane.add(title, 0, 0);

        Button import_ = new Button("Импортировать");
        import_.setFont(new Font(12 * interfaceScale));
        import_.setOnAction(event -> {
            FileChooser fileChooser = new FileChooser();
            fileChooser.setTitle("Сохранить игру");
            fileChooser.getExtensionFilters().add(new FileChooser.ExtensionFilter("Milliner Game Save", "*.mgs"));
            fileChooser.getExtensionFilters().add(new FileChooser.ExtensionFilter("JSON файл", "*.json"));
            fileChooser.getExtensionFilters().add(new FileChooser.ExtensionFilter("Все файлы", "*.*"));

            File file = fileChooser.showOpenDialog(primaryStage);

            String json = "{}";

            try {
                json = readFileToString(file.getPath());
            } catch (Exception e) {
                e.printStackTrace();
                return;
            }

            if (file == null)
                return;

            Data newData = new Data();

            JSONObject jsonObject = new JSONObject(json);

            newData.players = jsonArrayToStringArray(jsonObject.getJSONArray("players"));
            newData.owners = jsonArrayToIntArray(jsonObject.getJSONArray("owners"));
            newData.houses = jsonArrayToIntArray(jsonObject.getJSONArray("houses"));
            newData.pledge = jsonArrayToBooleanArray(jsonObject.getJSONArray("pledge"));
            newData.fortunes = jsonArrayToStringArray(jsonObject.getJSONArray("fortunes"));
            newData.stockPrice = jsonObject.getInt("stockPrice");
            newData.playerStocks = jsonArrayToIntArray(jsonObject.getJSONArray("playerStocks"));
            String notes = jsonObject.getString("notes");

            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle("Миллионер");
            alert.setHeaderText("Заметки");
            alert.setContentText(notes);
            alert.showAndWait();

            primaryStage.setScene(new MainScreen().getScene(interfaceScale, newData, primaryStage));
        });
        gridPane.add(import_, 0, 1);

        Label title2 = new Label("Экспорт:");
        title2.setFont(new Font(16 * interfaceScale));
        gridPane.add(title2, 0, 2);

        GridPane notesGrid = new GridPane();
        GridPane.setHgrow(notesGrid, javafx.scene.layout.Priority.ALWAYS);

        Label nodesTitle = new Label("Заметки: ");
        nodesTitle.setFont(new Font(12 * interfaceScale));
        notesGrid.add(nodesTitle, 0, 0);

        TextField notes = new TextField();
        GridPane.setHgrow(notes, javafx.scene.layout.Priority.ALWAYS);
        notes.setFont(new Font(12 * interfaceScale));
        notes.textProperty().addListener((observable, oldValue, newValue) -> {});
        notesGrid.add(notes, 1, 0);

        gridPane.add(notesGrid, 0, 3);

        Button export = new Button("Экспортировать");
        export.setFont(new Font(12 * interfaceScale));
        export.setOnAction(event -> {
            FileChooser fileChooser = new FileChooser();
            fileChooser.setTitle("Сохранить игру");
            fileChooser.getExtensionFilters().add(new FileChooser.ExtensionFilter("Milliner Game Save", "*.mgs"));
            fileChooser.getExtensionFilters().add(new FileChooser.ExtensionFilter("JSON файл", "*.json"));
            fileChooser.getExtensionFilters().add(new FileChooser.ExtensionFilter("Все файлы", "*.*"));

            File file = fileChooser.showSaveDialog(primaryStage);

            JSONObject main = new JSONObject();
            main.put("players", data.players);
            main.put("owners", data.owners);
            main.put("houses", data.houses);
            main.put("pledge", data.pledge);
            main.put("fortunes", data.fortunes);
            main.put("stockPrice", data.stockPrice);
            main.put("playerStocks", data.playerStocks);
            main.put("notes", notes.getText());

            if (file != null) {
                saveTextToFile(main.toString(), file);
            }
        });

        gridPane.add(export, 0, 4);

        Label sizeTitle = new Label("Настройки: ");
        sizeTitle.setFont(new Font(16 * interfaceScale));
        gridPane.add(sizeTitle, 0, 5);

        gridPane.add(getInterfaceScaleButton(interfaceScale, data,primaryStage), 0, 6);

        tabContent.setCenter(gridPane);

        return tabContent;
    }

    private void saveTextToFile(String content, File file) {
        try (FileWriter writer = new FileWriter(file)) {
            writer.write(content);
        } catch (IOException ex) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Миллионер");
            alert.setHeaderText("Ошибка сохранения файла");
            alert.setContentText(ex.getMessage());
            alert.showAndWait();

            ex.printStackTrace();
        }
    }

    private Button getInterfaceScaleButton(double interfaceScale, Data data, Stage primaryStage) {
        Button changeInterfaceScale = new Button("Изменить размер интерфейса");
        changeInterfaceScale.setFont(new Font(12 * interfaceScale));

        changeInterfaceScale.setOnAction(event -> {
            showInterfaceScaleDialog(interfaceScale, data, primaryStage);
        });

        return changeInterfaceScale;
    }

    private void showInterfaceScaleDialog(double interfaceScale, Data data, Stage primaryStage) {
        Stage dialogStage = new Stage();
        dialogStage.setTitle("Изменение размера интерфейса");
        dialogStage.initModality(Modality.WINDOW_MODAL);
        dialogStage.initOwner(primaryStage);

        BorderPane borderPane = new BorderPane();

        GridPane grid = new GridPane();
        grid.setHgap(10);
        grid.setVgap(10);
        grid.setAlignment(Pos.BOTTOM_RIGHT);

        GridPane.setHgrow(grid, javafx.scene.layout.Priority.ALWAYS);
        GridPane.setVgrow(grid, javafx.scene.layout.Priority.ALWAYS);

        TextField scaleTextField = new TextField(String.format("%.2f", interfaceScale).replace(',', '.'));
        scaleTextField.setFont(new Font(12 * interfaceScale));
        borderPane.setCenter(scaleTextField);
        borderPane.setPadding(new Insets(10));

        Button okButton = new Button("ОК");
        okButton.setFont(new Font(12 * interfaceScale));
        Button cancelButton = new Button("Отмена");
        cancelButton.setFont(new Font(12 * interfaceScale));

        grid.add(okButton, 0, 0);
        grid.add(cancelButton, 1, 0);

        borderPane.setBottom(grid);

        okButton.setOnAction(event -> {
            try {
                double newScale = Double.parseDouble(scaleTextField.getText());
                primaryStage.setScene(new MainScreen().getScene(newScale, data, primaryStage));
                dialogStage.close();
            } catch (NumberFormatException e) {
                showErrorDialog("Некорректный ввод", "Пожалуйста, введите правильное число.");
            }
        });

        cancelButton.setOnAction(event -> dialogStage.close());

        Scene dialogScene = new Scene(borderPane, 406, 150);
        dialogScene.getStylesheets().add(Objects.requireNonNull(getClass().getResource("/com/millionaire/style.css")).toExternalForm());
        dialogStage.setScene(dialogScene);
        dialogStage.setWidth(406);
        dialogStage.setHeight(121*interfaceScale);
        dialogStage.show();
    }

    private void showErrorDialog(String title, String message) {
        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }

    public static String readFileToString(String filePath) {
        StringBuilder jsonBuilder = new StringBuilder();

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                jsonBuilder.append(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return jsonBuilder.toString();
    }

    public String[] jsonArrayToStringArray(JSONArray jsonArray) {
        List<String> stringList = new ArrayList<>();
        for (int i = 0; i < jsonArray.length(); i++) {
            stringList.add(jsonArray.getString(i));
        }
        return stringList.toArray(new String[0]);
    }

    public boolean[] jsonArrayToBooleanArray(JSONArray jsonArray) {
        boolean[] booleanArray = new boolean[jsonArray.length()];
        for (int i = 0; i < jsonArray.length(); i++) {
            booleanArray[i] = jsonArray.getBoolean(i);
        }
        return booleanArray;
    }

    public int[] jsonArrayToIntArray(JSONArray jsonArray) {
        int[] intArray = new int[jsonArray.length()];
        for (int i = 0; i < jsonArray.length(); i++) {
            intArray[i] = jsonArray.getInt(i);
        }
        return intArray;
    }
}
