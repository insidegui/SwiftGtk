//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import CGtk

public class Label: Widget {
    public init(text: String? = nil) {
        super.init()
        if let text = text {
            widgetPointer = gtk_label_new(text)
        } else {
            widgetPointer = gtk_label_new(nil)
        }
    }

    public var text: String? {
        get {
            return String(cString: gtk_label_get_text(castedPointer()))
        }
        set {
            if let text = newValue {
                gtk_label_set_text(castedPointer(), text)
            } else {
                gtk_label_set_text(castedPointer(), nil)
            }
        }
    }
    
    public var html: String? {
        get {
            return String(cString: gtk_label_get_text(castedPointer()))
        }
        set {
            if let html = newValue {
                gtk_label_set_markup(castedPointer(), html)
            } else {
                gtk_label_set_use_markup(castedPointer(), 1)
                gtk_label_set_markup(castedPointer(), nil)
            }
        }
    }

    public var selectable: Bool {
        get {
            return gtk_label_get_selectable(castedPointer()) == 1
        }
        set {
            gtk_label_set_selectable(castedPointer(), newValue ? 1 : 0)
        }
    }
}
