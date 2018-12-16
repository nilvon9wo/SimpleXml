public class SXML_EmptySimpleNode implements SXML_SimpleNodeBuilderIntf, SXML_SimpleDocumentBuilderIntf {
    String nodeName;

    public SXML_EmptySimpleNode(String nodeName) {
        this.nodeName = nodeName;
    }

    public Dom.XmlNode toXmlNode(Dom.XmlNode outerNode) {
        outerNode.addChildElement(this.nodeName, null, null);
        return outerNode.getChildElement(this.nodeName, null);
    }

    public Dom.Document toXmlDocument() {
        Dom.Document document = new Dom.Document();
        document.createRootElement(this.nodeName, null, null);
        return document;
    }
}