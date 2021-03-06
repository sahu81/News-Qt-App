import bb.cascades 1.0
import com.kdab.components 1.0
import uk.co.piggz 1.0

Page {
    id: advancedPage
    paneProperties: NavigationPaneProperties {
        backButton: ActionItem {
            onTriggered: {
                navigationPane.pop()
            }
        }
    }

    signal daysToRetainChanged(int days);
    signal numberItemsToSyncChanged(int numitems);

    Container {
        topPadding: 30
        leftPadding: 30
        bottomPadding: 30
        rightPadding: 30
/*

        Button {

            text: qsTr("Recreate Database")

            onClicked: {
                NewsInterface.recreateDatabase();
            }
        }
*/

        Label {
            text: "Days to retain:"
        }

        Container {

            layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight;
                }

            Slider {
                id: sldRetain
                fromValue: 3
                toValue: 60

                onValueChanged: {
                    daysToRetainChanged(Math.round(value));
                }
            }

            Label {
                text: Math.round(sldRetain.immediateValue)
                preferredWidth: 200
            }

        }

        Label {
            text: "Number of items to sync:"
        }

        Container {

            layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight;
                }

            Slider {
                id: sldNumSync
                fromValue: 20
                toValue: 50

                onValueChanged: {
                    numberItemsToSyncChanged(Math.round(value));
                }
            }

            Label {
                text: Math.round(sldNumSync.immediateValue)
                preferredWidth: 200
            }

        }
    }

    function setDaysToRetain(days) {
        sldRetain.value = days;
    }

    function setNumItemsToSync(numitems) {
        sldNumSync.value = numitems;
    }
}


