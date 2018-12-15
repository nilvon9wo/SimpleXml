public class SXML_ElementSimpleNode implements SXML_SimpleNodeIntf {
    String nodeName;
    SXML_SimpleNodeIntf content;

    public SXML_ElementSimpleNode(String nodeName) {
        this.nodeName = nodeName;
    }

    public SXML_ElementSimpleNode setContent(SXML_SimpleNodeIntf content) {
        this.content = content;
        return this;
    }

    public Dom.XmlNode toXmlNode(Dom.XmlNode outerNode) {
        outerNode.addChildElement(this.nodeName, null, null);
        Dom.XmlNode innerNode = outerNode.getChildElement(this.nodeName, null);
        this.content.toXmlNode(innerNode);
        return innerNode;
    }

    public Dom.Document buildDocument() {
        Dom.Document document = new Dom.Document();
        Dom.XmlNode rootNode = document.createRootElement(this.nodeName, null, null);
        this.content.toXmlNode(rootNode);
        return document;
    }
}