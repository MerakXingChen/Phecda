package com.root.krscript.model

class SwitchNode(currentConfigXml: String) : RunnableNode(currentConfigXml){
    var getState: String = ""
    var checked = false
}