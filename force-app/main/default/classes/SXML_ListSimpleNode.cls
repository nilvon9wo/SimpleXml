public class SXML_ListSimpleNode implements SXML_SimpleNodeBuilderIntf, SXML_SimpleDocumentBuilderIntf {
    String nodeName;
    List<SXML_SimpleNodeBuilderIntf> contentList;

    public SXML_ListSimpleNode(String nodeName, List<SXML_SimpleNodeBuilderIntf> contentList) {
        this.nodeName = nodeName;
        this.contentList = contentList;
    }

    public Dom.XmlNode toXmlNode(Dom.XmlNode outerNode) {
        outerNode.addChildElement(this.nodeName, null, null);
        Dom.XmlNode innerNode = outerNode.getChildElement(this.nodeName, null);
        convertInnerContent(innerNode);
        return innerNode;
    }

    public Dom.Document toXmlDocument() {
        Dom.Document document = new Dom.Document();
        Dom.XmlNode rootNode = document.createRootElement(this.nodeName, null, null);
        convertInnerContent(rootNode);
        return document;
    }

    private void convertInnerContent(Dom.XmlNode innerNode) {
        for (SXML_SimpleNodeBuilderIntf content : this.contentList) {
            content.toXmlNode(innerNode);
        }
    }
}