public class SXML_TextSimpleNode implements SXML_SimpleNodeBuilderIntf, SXML_SimpleDocumentBuilderIntf {
    String nodeName;
    String content;

    public SXML_TextSimpleNode(String nodeName, String content) {
        this.nodeName = nodeName;
        this.content = content;
    }

    public Dom.XmlNode toXmlNode(Dom.XmlNode outerNode) {
        outerNode.addChildElement(this.nodeName, null, null);
        Dom.XmlNode innerNode = outerNode.getChildElement(this.nodeName, null)
            .addTextNode(this.content);
        return innerNode;
    }

    public Dom.Document toXmlDocument() {
        Dom.Document document = new Dom.Document();
        document.createRootElement(this.nodeName, null, null)
                .addTextNode(this.content);
        return document;
    }
}